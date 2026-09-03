"""Fetch publications from Google Scholar for author Gc2eg3kAAAAJ."""

import json
import logging
import os
import re
import sys

from scholarly import scholarly

AUTHOR_ID = "Gc2eg3kAAAAJ"

OUTPUT_DIR = os.path.join(os.path.dirname(__file__), os.pardir, "data")
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "publications.json")
METRICS_FILE = os.path.join(OUTPUT_DIR, "scholar.json")

logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")
logger = logging.getLogger(__name__)

# Section headers that Google Scholar sometimes concatenates with abstract text
_SECTION_HEADERS = [
    "Background and Objective",
    "Background",
    "Conclusions",
    "Context",
    "Introduction",
    "Methods",
    "Motivation",
    "Objective",
    "Purpose",
    "Results",
    "Significance",
    "Summary",
]
_HEADER_PATTERN = re.compile(
    r"([.!?])\s*(" + "|".join(re.escape(h) for h in _SECTION_HEADERS) + r")(?=[A-Z])"
)


# Google Scholar sentence-cases some titles, mangling acronyms. Keys are the
# mangled titles, lowercased; values are the titles as they should be shown.
TITLE_OVERRIDES = {
    "monai label: a framework for ai-assisted interactive labeling of 3d medical images": (
        "MONAI Label: A framework for AI-assisted Interactive Labeling of 3D Medical Images"
    ),
}


def fix_title(title: str) -> str:
    """Restore the correct casing of titles mangled by Google Scholar."""
    return TITLE_OVERRIDES.get(title.strip().lower(), title)


def clean_abstract(text: str) -> str:
    """Remove concatenated section headers from abstracts."""
    # Handle header at the very start
    text = re.sub(
        r"^(" + "|".join(re.escape(h) for h in _SECTION_HEADERS) + r")(?=[A-Z])",
        r"\1. ",
        text,
    )
    # Handle headers mid-text: remove header, keep preceding punctuation
    text = _HEADER_PATTERN.sub(r"\1 ", text)
    return text


def format_authors(raw: str) -> str:
    """Convert 'A and B and C' to 'A, B, and C'."""
    authors = [a.strip() for a in raw.split(" and ") if a.strip()]
    if len(authors) <= 1:
        return raw
    if len(authors) == 2:
        return f"{authors[0]} and {authors[1]}"
    return ", ".join(authors[:-1]) + ", and " + authors[-1]


def fetch_scholar_data() -> tuple[list[dict], dict[str, int]]:
    """Fetch the author's papers and profile metrics from Google Scholar."""
    logger.info("Fetching author profile %s from Google Scholar", AUTHOR_ID)
    author = scholarly.search_author_id(AUTHOR_ID)
    author = scholarly.fill(author, sections=["publications"])

    papers = []
    for i, pub in enumerate(author.get("publications", [])):
        logger.info("Fetching details for publication %d: %s", i + 1, pub["bib"].get("title", "?")[:60])
        try:
            filled = scholarly.fill(pub)
        except Exception as exc:
            logger.warning("Failed to fill publication %d: %s", i + 1, exc)
            filled = pub

        bib = filled.get("bib", {})
        papers.append({
            "title": fix_title(bib.get("title", "")),
            "abstract": clean_abstract(bib.get("abstract", "")),
            "year": int(bib.get("pub_year", 0)) if bib.get("pub_year") else None,
            "venue": bib.get("venue", "") or bib.get("journal", "") or bib.get("conference", ""),
            "citationCount": int(filled.get("num_citations") or 0),
            "authors": format_authors(bib.get("author", "")),
            "url": filled.get("pub_url", ""),
            "scholarUrl": filled.get("author_pub_id", ""),
        })

    citation_counts = sorted(
        (paper["citationCount"] for paper in papers),
        reverse=True,
    )
    calculated_h_index = max(
        (rank for rank, count in enumerate(citation_counts, 1) if count >= rank),
        default=0,
    )
    metrics = {
        "hIndex": int(author.get("hindex") or calculated_h_index),
        "citationCount": int(author.get("citedby") or sum(citation_counts)),
    }
    return papers, metrics


def main() -> None:
    papers, metrics = fetch_scholar_data()
    papers.sort(
        key=lambda p: (p.get("year") or 0, p.get("citationCount") or 0),
        reverse=True,
    )

    os.makedirs(os.path.dirname(OUTPUT_FILE), exist_ok=True)
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        json.dump(papers, f, indent=2, ensure_ascii=False)
    with open(METRICS_FILE, "w", encoding="utf-8") as f:
        json.dump(metrics, f, indent=2)

    logger.info("Saved %d publications to %s", len(papers), OUTPUT_FILE)
    logger.info("Saved Scholar metrics to %s", METRICS_FILE)


if __name__ == "__main__":
    try:
        main()
    except Exception:
        logger.exception("Failed to fetch publications")
        sys.exit(1)
