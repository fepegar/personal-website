"""Generate cv/data.typ from Python CV content data.

This ensures the Typst CVs and the website share a single source of truth.
Run via: uv run python scripts/generate_cv_data.py
"""

import json
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent.parent))

from content import BIO, PERSONAL
from content.cv_data import EDUCATION, EXPERIENCE, LANGUAGES, TECHNICAL_SKILLS
from content.publications import SELECTED_PUBLICATIONS

PUBLICATIONS_JSON = Path(__file__).parent.parent / "data" / "publications.json"


def escape_typst(s: str) -> str:
    """Escape characters that are special in Typst strings."""
    return s.replace("\\", "\\\\").replace('"', '\\"')


def gen_pub_entry(pub: dict) -> list[str]:
    """Generate Typst dict for a publication."""
    lines = []
    lines.append("  (")
    lines.append(f'    title: "{escape_typst(pub.get("title", ""))}",')
    lines.append(f'    authors: "{escape_typst(pub.get("authors", ""))}",')
    lines.append(f'    venue: "{escape_typst(pub.get("venue", ""))}",')
    year = pub.get("year")
    lines.append(f"    year: {year if year else 'none'},")
    lines.append("  ),")
    return lines


def generate() -> str:
    lines = ["// AUTO-GENERATED from content/cv_data.py — do not edit manually\n"]

    # Personal
    lines.append(f'#let name = "{escape_typst(PERSONAL["name"])}"')
    lines.append(f'#let job-title = "{escape_typst(PERSONAL["title"])}"')
    lines.append(f'#let affiliation = "{escape_typst(PERSONAL["affiliation"])}"')
    lines.append(f'#let location = "{escape_typst(PERSONAL["location"])}"')
    lines.append(f'#let email = "{escape_typst(PERSONAL["email"])}"')
    lines.append("")

    # Profiles
    plain_bio = re.sub(r"<[^>]+>", "", BIO).replace("\n\n", " ").strip()
    lines.append(f'#let profile = "{escape_typst(plain_bio)}"')
    lines.append("")

    lines.append(
        '#let cv-profile-long = "I am an engineer with a PhD in Medical'
        " Imaging and a decade of experience applying cutting-edge multimodal"
        " AI for healthcare to solve real-world problems and supporting"
        " biomedical research. I strongly believe in the importance of"
        " meaningful translational research and have developed open-source"
        " machine learning software actively used by both clinicians and"
        " researchers. I enjoy being halfway between research and engineering"
        " and have developed strong communication skills to connect ideas"
        ' from both worlds."'
    )
    lines.append("")
    lines.append(
        '#let cv-profile-short = "I am an engineer with a PhD in Medical'
        " Imaging and a decade of experience applying multimodal AI for"
        " healthcare. I develop open-source machine learning software used by"
        " clinicians and researchers. I combine research and engineering with"
        ' strong communication skills."'
    )
    lines.append("")

    # Experience
    lines.append("#let experience = (")
    for exp in EXPERIENCE:
        org_loc = ""
        if exp["organization"]:
            org_loc = exp["organization"]
            if exp["location"]:
                org_loc += f", {exp['location']}"
        lines.append("  (")
        lines.append(f'    title: "{escape_typst(exp["title"])}",')
        lines.append(f'    org-loc: "{escape_typst(org_loc)}",')
        lines.append(f'    dates: "{exp["start"]} – {exp["end"]}",')
        lines.append("    bullets: (")
        for b in exp["bullets"]:
            lines.append(f'      "{escape_typst(b)}",')
        lines.append("    ),")
        lines.append("  ),")
    lines.append(")")
    lines.append("")

    # Education
    lines.append("#let education = (")
    for edu in EDUCATION:
        lines.append("  (")
        lines.append(f'    degree: "{escape_typst(edu["degree"])}",')
        lines.append(f'    institution: "{escape_typst(edu["institution"])}",')
        lines.append(f'    dates: "{edu["start"]} – {edu["end"]}",')
        lines.append("    bullets: (")
        for b in edu["bullets"]:
            lines.append(f'      "{escape_typst(b)}",')
        lines.append("    ),")
        lines.append("  ),")
    lines.append(")")
    lines.append("")

    # Technical skills
    lines.append(
        f'#let skill-languages = "{escape_typst(TECHNICAL_SKILLS["Languages"])}"'
    )
    lines.append(f'#let skill-tools = "{escape_typst(TECHNICAL_SKILLS["Tools"])}"')
    lines.append("")

    # Languages
    lines.append(f'#let languages = "{escape_typst(LANGUAGES)}"')
    lines.append("")

    # Selected publications
    lines.append("#let selected-publications = (")
    for pub in SELECTED_PUBLICATIONS:
        lines.extend(gen_pub_entry(pub))
    lines.append(")")
    lines.append("")

    # All publications (from Google Scholar JSON)
    if PUBLICATIONS_JSON.exists():
        all_pubs = json.loads(PUBLICATIONS_JSON.read_text())
        lines.append("#let all-publications = (")
        for pub in all_pubs:
            lines.extend(gen_pub_entry(pub))
        lines.append(")")
    else:
        lines.append("#let all-publications = ()")

    lines.append("")
    return "\n".join(lines)


def main() -> None:
    output = Path(__file__).parent.parent / "cv" / "data.typ"
    output.write_text(generate())
    print(f"Generated {output}")


if __name__ == "__main__":
    main()
