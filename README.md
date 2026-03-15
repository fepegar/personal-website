# personal-website

Fernando Pérez-García's personal website, built with Flask and exported as a static site for GitHub Pages.

The site includes:

- a homepage / bio page
- a news page
- selected publications
- all publications with abstracts
- a CV page with downloadable short and long PDF versions
- a light / dark / auto theme toggle
- GitHub Pages deployment with a custom domain (`fepegar.com`)

## High-level architecture

This repository uses **Flask as a content renderer** and **Frozen-Flask as a static exporter**.

In development, Flask serves the site dynamically.

For deployment, `freeze.py` renders every route to static HTML in `build/`, and GitHub Actions uploads that folder to GitHub Pages.

At a glance:

1. Content lives in Python modules under `content/`
2. Flask routes in `main.py` pass that content into Jinja templates
3. Templates in `templates/` render the pages
4. CSS in `static/css/style.css` defines the site look and theme system
5. Publications are fetched from Google Scholar into `data/publications.json`
6. CV data is converted into Typst data and compiled into PDFs
7. Frozen-Flask exports the whole site to `build/`
8. GitHub Actions deploys `build/` to GitHub Pages

## Tech stack

- **Python 3.12+**
- **Flask** for routing and templating
- **Frozen-Flask** for static export
- **Jinja2** templates
- **Typst** for CV PDFs
- **scholarly** for Google Scholar data
- **uv** for Python environment and dependency management
- **mise** for task orchestration and Typst installation
- **GitHub Actions** for build + deploy

## Repository structure

```text
.
├── .github/workflows/deploy.yml   # GitHub Pages workflow
├── content/                       # Human-edited site content
│   ├── __init__.py                # Personal info, bio, social links
│   ├── cv_data.py                 # Experience, education, skills, languages
│   ├── news.py                    # News timeline entries
│   └── publications.py            # Selected publications derived from all pubs
├── cv/
│   ├── common.typ                 # Shared Typst CV helpers / styling
│   ├── cv-long.typ                # Long CV source
│   ├── cv-short.typ               # Short CV source
│   └── data.typ                   # Auto-generated Typst data (do not edit)
├── data/
│   └── publications.json          # Fetched Google Scholar cache (committed)
├── scripts/
│   ├── check_cv_pages.py          # Enforces short CV page-count limit
│   ├── fetch_publications.py      # Fetches publications from Google Scholar
│   └── generate_cv_data.py        # Converts Python CV content to Typst data
├── static/
│   ├── CNAME                      # Custom domain for GitHub Pages
│   ├── css/style.css              # Site styling
│   ├── cv/                        # Generated CV PDFs
│   └── img/                       # Avatar, favicon, publication thumbnails
├── templates/                     # Jinja templates
├── freeze.py                      # Static export entrypoint
├── main.py                        # Flask application
├── mise.toml                      # Task runner and Typst tool config
├── pyproject.toml                 # Python package metadata + dependencies
└── README.md
```

## How the site works

### 1. Content layer

The website is mostly data-driven.

The main content sources are:

- `content/__init__.py`
  - `PERSONAL`: name, title, location, pronouns, etc.
  - `SOCIAL_LINKS`: footer icons and external links
  - `BIO`: homepage bio text
- `content/news.py`
  - chronological news items
- `content/cv_data.py`
  - experience, education, technical skills, and languages
- `content/publications.py`
  - selected publications shown on the featured publications page

This keeps the templates simple and makes content edits straightforward.

### 2. Flask routes

`main.py` defines one route per page:

- `/` → home
- `/news/` → news
- `/publications/selected/` → selected publications
- `/publications/all/` → complete publications list
- `/cv/` → CV page

It also defines:

- a `bold_name` Jinja filter that bolds Fernando's name in author lists
- a context processor that injects `current_year` and `social_links` globally

### 3. Templates

All HTML is rendered with Jinja templates under `templates/`.

- `base.html` provides the shared layout:
  - nav bar
  - theme toggle
  - footer
  - small JS helpers
- `home.html` renders the profile image, pronouns, keywords, and bio
- `news.html` renders a chronological list of updates
- `publications_selected.html` renders curated featured papers
- `publications_all.html` renders the full publication list grouped by year
- `cv.html` renders a web version of the CV and links to PDF downloads

### 4. Styling and theming

`static/css/style.css` contains the full site stylesheet.

The theme system is based on CSS custom properties:

- default light theme in `:root`
- explicit dark theme under `[data-theme="dark"]`
- automatic dark-mode behavior using `prefers-color-scheme`

The theme toggle in `templates/base.html` is a single icon button that cycles:

`auto → dark → light → auto`

The current choice is stored in `localStorage`.

## Publications pipeline

There are two publication surfaces:

### Selected publications

Selected publications are built in `content/publications.py`.

That file does **not** hardcode abstracts anymore. Instead, it:

1. loads all publications from `data/publications.json`
2. picks a curated subset by title
3. enriches those entries with extra metadata that Google Scholar does not provide, such as:
   - `code_url`
   - `image_url`

This means:

- the **source of truth for publication text** is `data/publications.json`
- the selected publications page is just a curated view on top of that data

### All publications

All publications are read directly from `data/publications.json` and grouped by year in `main.py`.

Each entry can show:

- title
- authors
- venue
- citation count
- abstract
- external paper link

### Fetching publications

`scripts/fetch_publications.py` fetches publications from Google Scholar using `scholarly`.

It does a few cleanup steps:

- fetches the author profile for Google Scholar author ID `Gc2eg3kAAAAJ`
- fills each publication entry with detailed metadata
- cleans malformed structured abstracts
- reformats author lists from repeated `"and"` separators into a readable list
- sorts output by year and citation count
- writes the result to `data/publications.json`

Important detail:

GitHub Actions does **not** fetch from Google Scholar during deploy. Google Scholar is unreliable from CI IP ranges, so `data/publications.json` is **committed to the repository** and updated locally instead.

## CV pipeline

The project keeps the website CV content and the Typst CV content aligned.

### Source of truth

The main editable CV content lives in `content/cv_data.py`.

That file defines:

- `EXPERIENCE`
- `EDUCATION`
- `TECHNICAL_SKILLS`
- `LANGUAGES`

### Generating Typst data

`scripts/generate_cv_data.py` converts Python content into `cv/data.typ`.

That generated file contains Typst variables for:

- personal info
- profile text
- experience
- education
- skills
- languages
- selected publications
- all publications

`cv/data.typ` is generated output and should not be edited manually.

### Typst templates

The PDFs are built from:

- `cv/common.typ`
- `cv/cv-short.typ`
- `cv/cv-long.typ`

The shared Typst styling uses the `cv-soft-and-hard` package.

### Page-count enforcement

`scripts/check_cv_pages.py` performs a programmatic PDF page-count check after compilation.

Right now it enforces:

- `static/cv/cv-short.pdf` must be **at most 2 pages**
- `static/cv/cv-long.pdf` has no enforced limit

This check runs automatically in the `build-cv` task.

## Static export

`freeze.py` is the static export entrypoint.

It:

1. imports the Flask app from `main.py`
2. configures Frozen-Flask to export into `build/`
3. enables relative URLs for GitHub Pages
4. freezes every route into static files
5. copies `static/CNAME` into `build/CNAME`

That last step is important for the custom domain.

## Deployment

Deployment is handled by `.github/workflows/deploy.yml`.

On every push to `main` (and on a weekly schedule), GitHub Actions:

1. checks out the repository
2. installs `uv`
3. installs `mise`
4. runs `uv sync`
5. runs `mise run generate-cv-data`
6. runs `mise run build-cv`
7. runs `mise run freeze`
8. uploads `build/`
9. deploys to GitHub Pages

The published site is intended to live at:

- `https://fepegar.com`

The repository includes `static/CNAME` so the custom domain is part of the build output.

## Local development

### Prerequisites

Install:

- `uv`
- `mise`

Then install dependencies:

```bash
uv sync
mise install
```

### Common commands

All common workflows are defined in `mise.toml`.

#### Start the dev server

```bash
mise run serve
```

This runs:

```bash
uv run flask --app main run --debug
```

#### Build everything

```bash
mise run build
```

This runs:

- Typst CV generation
- PDF compilation
- CV page-count checks
- Frozen-Flask export

#### Regenerate CV Typst data only

```bash
mise run generate-cv-data
```

#### Build CV PDFs only

```bash
mise run build-cv
```

#### Export the static site only

```bash
mise run freeze
```

#### Fetch publications from Google Scholar

```bash
mise run fetch-pubs
```

This updates `data/publications.json` locally.

#### Fetch publications and push them

```bash
mise run update-pubs
```

This:

1. fetches publications locally
2. stages `data/publications.json`
3. creates a commit if needed
4. pushes to GitHub

This is the intended way to refresh publication data, rather than doing it in CI.

## Generated vs hand-edited files

### Hand-edited

- `content/__init__.py`
- `content/cv_data.py`
- `content/news.py`
- `content/publications.py`
- `templates/*`
- `static/css/style.css`
- `cv/common.typ`
- `cv/cv-short.typ`
- `cv/cv-long.typ`
- `main.py`
- `freeze.py`
- `mise.toml`
- `.github/workflows/deploy.yml`

### Generated

- `cv/data.typ`
- `static/cv/cv-short.pdf`
- `static/cv/cv-long.pdf`
- `build/`

### Generated but committed

- `data/publications.json`

That file is committed on purpose so deploys do not depend on Google Scholar availability.

## Content update guide

### Update the bio or personal info

Edit:

- `content/__init__.py`

### Update news items

Edit:

- `content/news.py`

### Update experience, education, or skills

Edit:

- `content/cv_data.py`

Then regenerate/rebuild:

```bash
mise run build-cv
```

### Update selected publications

Edit:

- `content/publications.py`

This file controls:

- which publication titles are featured
- image thumbnails
- code/model links

### Update all publications data

Run:

```bash
mise run update-pubs
```

## Notes and caveats

- The short CV is intentionally guarded by an automated page-count check.
- Google Scholar fetching is best-effort and should be run locally.
- The site is static in production even though it uses Flask during development.
- `PERSONAL["avatar_url"]` exists in content, but templates use `url_for('static', ...)` for deployment-safe asset paths.
- The footer email link is assembled client-side in JavaScript to avoid exposing the address directly in static HTML source.

## In short

If you only remember a few commands, they are these:

```bash
uv sync
mise install
mise run serve
mise run build
mise run update-pubs
```

And if you only remember the editing model, it is this:

- edit Python data in `content/`
- let scripts generate derived files
- let Typst build PDFs
- let Frozen-Flask export HTML
- let GitHub Pages serve the static result
