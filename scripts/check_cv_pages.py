"""Check that CV PDFs have the expected number of pages."""

import re
import sys
from pathlib import Path

EXPECTED = {
    "static/cv/cv-short.pdf": 2,
    "static/cv/cv-long.pdf": None,  # no limit
}

ROOT = Path(__file__).parent.parent


def get_page_count(pdf_path: Path) -> int:
    """Count pages by scanning for /Type /Page entries in the PDF."""
    data = pdf_path.read_bytes()
    # Match /Type /Page but not /Type /Pages
    return len(re.findall(rb"/Type\s*/Page(?!s)", data))


def main() -> int:
    errors = 0
    for rel_path, max_pages in EXPECTED.items():
        pdf = ROOT / rel_path
        if not pdf.exists():
            print(f"MISSING: {rel_path}")
            errors += 1
            continue
        pages = get_page_count(pdf)
        if max_pages is not None and pages > max_pages:
            print(f"FAIL: {rel_path} has {pages} pages (expected ≤ {max_pages})")
            errors += 1
        else:
            print(f"OK: {rel_path} — {pages} pages")
    return errors


if __name__ == "__main__":
    sys.exit(main())
