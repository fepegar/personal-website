"""Selected publications data."""

import json
from pathlib import Path

_PUBS_JSON = Path(__file__).parent.parent / "data" / "publications.json"

# Titles of selected publications (order matters for display)
_SELECTED_TITLES = [
    "Exploring scalable medical image encoders beyond text supervision",
    "MAIRA-2: Grounded Radiology Report Generation",
    "RadEdit: stress-testing biomedical vision models via diffusion image editing",
    "Learning to exploit temporal structure for biomedical vision-language processing",
    "TorchIO: a Python library for efficient loading, preprocessing, augmentation and patch-based sampling of medical images in deep learning",
    "MONAI Label: A framework for AI-assisted interactive labeling of 3D medical images",
]

# Extra metadata not available in Google Scholar
_EXTRA = {
    "Exploring scalable medical image encoders beyond text supervision": {
        "code_url": "https://huggingface.co/microsoft/rad-dino",
        "image_url": "/static/img/publications/raddino.jpg",
    },
    "MAIRA-2: Grounded Radiology Report Generation": {
        "image_url": "/static/img/publications/maira2.jpg",
    },
    "RadEdit: stress-testing biomedical vision models via diffusion image editing": {
        "code_url": "https://huggingface.co/microsoft/radedit",
        "image_url": "/static/img/publications/radedit.jpg",
    },
    "TorchIO: a Python library for efficient loading, preprocessing, augmentation and patch-based sampling of medical images in deep learning": {
        "code_url": "https://github.com/TorchIO-project/torchio",
    },
}


def _load_selected() -> list[dict]:
    if not _PUBS_JSON.exists():
        return []
    all_pubs = json.loads(_PUBS_JSON.read_text())
    by_title = {p["title"].lower(): p for p in all_pubs}
    selected = []
    for title in _SELECTED_TITLES:
        pub = by_title.get(title.lower())
        if pub:
            entry = {
                "title": pub["title"],
                "authors": pub["authors"],
                "venue": pub.get("venue", ""),
                "year": pub.get("year"),
                "url": pub.get("url", ""),
                "description": pub.get("abstract", ""),
                **_EXTRA.get(title, {}),
            }
            selected.append(entry)
    return selected


SELECTED_PUBLICATIONS = _load_selected()
