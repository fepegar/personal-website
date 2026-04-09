import json
import re
from datetime import date
from pathlib import Path

from markupsafe import Markup
from flask import Flask, render_template

from content import BIO, PERSONAL, SOCIAL_LINKS
from content.cv_data import EDUCATION, EXPERIENCE, LANGUAGES, TECHNICAL_SKILLS
from content.news import NEWS
from content.publications import SELECTED_PUBLICATIONS

app = Flask(__name__)

PUBLICATIONS_JSON = Path(__file__).parent / "data" / "publications.json"

_NAME_VARIANTS = [
    r"F(?:ernando)?\s+Pérez-García",
    r"F(?:ernando)?\s+Perez-Garcia",
]
_NAME_RE = re.compile("(" + "|".join(_NAME_VARIANTS) + ")")


@app.template_filter("natural_date")
def natural_date(iso_date: str) -> str:
    """Format an ISO date string (YYYY-MM-DD) as a natural date, e.g. 8 April 2026."""
    d = date.fromisoformat(iso_date)
    return f"{d.day} {d.strftime('%B')} {d.year}"


@app.template_filter("bold_name")
def bold_name(authors: str) -> Markup:
    """Bold the author's name in an author list."""
    return Markup(_NAME_RE.sub(r"<strong>\1</strong>", authors))


@app.context_processor
def inject_globals():
    return {"current_year": date.today().year, "social_links": SOCIAL_LINKS}


@app.route("/")
def home():
    return render_template(
        "home.html",
        personal=PERSONAL,
        bio=BIO,
    )


@app.route("/news/")
def news():
    return render_template("news.html", news_items=NEWS)


@app.route("/publications/selected/")
def publications_selected():
    return render_template(
        "publications_selected.html",
        publications=SELECTED_PUBLICATIONS,
    )


@app.route("/publications/all/")
def publications_all():
    all_pubs = []
    if PUBLICATIONS_JSON.exists():
        all_pubs = json.loads(PUBLICATIONS_JSON.read_text())
    # Group by year
    years = {}
    for pub in all_pubs:
        y = pub.get("year") or "Unknown"
        years.setdefault(y, []).append(pub)
    sorted_years = sorted(years.items(), key=lambda x: x[0] if isinstance(x[0], int) else 0, reverse=True)
    return render_template("publications_all.html", years=sorted_years)


@app.route("/cv/")
def cv():
    return render_template(
        "cv.html",
        experience=EXPERIENCE,
        education=EDUCATION,
        technical_skills=TECHNICAL_SKILLS,
        languages=LANGUAGES,
    )


if __name__ == "__main__":
    app.run(debug=True)
