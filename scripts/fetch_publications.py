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


def fetch_all_papers() -> list[dict]:
    """Fetch all papers from Google Scholar."""
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
            "title": bib.get("title", ""),
            "abstract": clean_abstract(bib.get("abstract", "")),
            "year": int(bib.get("pub_year", 0)) if bib.get("pub_year") else None,
            "venue": bib.get("venue", "") or bib.get("journal", "") or bib.get("conference", ""),
            "citationCount": filled.get("num_citations", 0),
            "authors": format_authors(bib.get("author", "")),
            "url": filled.get("pub_url", ""),
            "scholarUrl": filled.get("author_pub_id", ""),
        })

    return papers


def main() -> None:
    papers = fetch_all_papers()
    papers.sort(
        key=lambda p: (p.get("year") or 0, p.get("citationCount") or 0),
        reverse=True,
    )

    os.makedirs(os.path.dirname(OUTPUT_FILE), exist_ok=True)
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        json.dump(papers, f, indent=2, ensure_ascii=False)

    logger.info("Saved %d publications to %s", len(papers), OUTPUT_FILE)


if __name__ == "__main__":
    try:
        main()
    except Exception:
        logger.exception("Failed to fetch publications")
        sys.exit(1)
