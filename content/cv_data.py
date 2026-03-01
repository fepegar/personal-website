"""CV data: experience, education, skills, etc."""

EXPERIENCE = [
    {
        "title": "Senior Researcher and Tech Lead",
        "organization": "Microsoft Health Futures",
        "location": "Cambridge, UK",
        "start": "Feb 2022",
        "end": "Present",
        "bullets": [
            "Focus on Multimodal AI for healthcare: self-supervised learning (e.g. RAD-DINO, Nature Machine Intelligence) and generative diffusion models for medical imaging (e.g. RadEdit, ECCV)",
            "Collaborated with the NHS to develop a deep learning model for hippocampal segmentation from brain MRI scans",
            "Collaborated with Mayo Clinic to implement our multimodal LLM, MAIRA, in their clinical workflows",
        ],
    },
    {
        "title": "Research Software Engineer (freelance)",
        "organization": "",
        "location": "",
        "start": "Jan 2019",
        "end": "Sep 2021",
        "bullets": [
            "Paris Brain Institute (ICM): Developed tools to build a 3D atlas of the macaque brainstem (histology & MRI)",
            "Arterys – Medical Imaging Cloud AI: Deployed deep learning models for medical images using Docker",
            "Medical Augmented Intelligence (MAI): Developed virtual reality and medical imaging software on 3D Slicer",
        ],
    },
    {
        "title": "Research Software Engineer",
        "organization": "Paris Brain Institute (ICM) – CENIR",
        "location": "Paris, France",
        "start": "Aug 2015",
        "end": "July 2017",
        "bullets": [
            "Created 3D atlases of human and monkey brainstems based on immunohistochemical and MRI data",
            "Collaborated with Medtronic on a product for planning and assessment of stereotactic surgery",
        ],
    },
    {
        "title": "Research Software Engineer (intern)",
        "organization": "Center for Biomedical Technology (CTB – UPM)",
        "location": "Madrid, Spain",
        "start": "Nov 2014",
        "end": "Feb 2015",
        "bullets": [
            "Collaborated with NASAL Inc. on a DICOM reading/writing software tool for planning of sinus surgery",
        ],
    },
    {
        "title": "Research Software Engineer (intern)",
        "organization": "Paris Brain Institute (ICM) – CENIR",
        "location": "Paris, France",
        "start": "Mar 2014",
        "end": "Sep 2014",
        "bullets": [
            "Developed EpiLoc, an automated pipeline for planning and assessment of electrode implantation surgery in epilepsy",
        ],
    },
]

EDUCATION = [
    {
        "degree": "PhD in Medical Imaging",
        "institution": "University College London & King's College London",
        "location": "London, UK",
        "start": "Sep 2018",
        "end": "Nov 2022",
        "bullets": [
            "Lead the development of TorchIO, a library for medical images and deep learning (in PyTorch ecosystem)",
            "Coordinated a collaboration between UCL and UCLH to publish EPISURG, a large MRI dataset",
            "Wrote and released Resseg, a tool for quantitative analysis of resective neurosurgery using deep learning",
            "Collaborated with neurophysiologists at NHNN to classify seizures from video-telemetry using deep learning",
            "Joined the Medical Open Network for AI (MONAI) Transformations Working Group as an advisor",
        ],
    },
    {
        "degree": "MRes Medical Imaging",
        "institution": "University College London",
        "location": "London, UK",
        "start": "Sep 2017",
        "end": "Sep 2018",
        "bullets": [],
    },
    {
        "degree": "MEng Biomedical Engineering",
        "institution": "Universidad Politécnica de Madrid",
        "location": "Madrid, Spain",
        "start": "Sep 2014",
        "end": "July 2015",
        "bullets": [],
    },
    {
        "degree": "BEng Sound and Image Engineering",
        "institution": "Universidad Politécnica de Madrid",
        "location": "Madrid, Spain",
        "start": "Sep 2009",
        "end": "July 2014",
        "bullets": [
            "Erasmus year at Beuth Hochschule für Technik Berlin, Germany (2011/12)",
        ],
    },
    {
        "degree": "BEng Industrial Electronics Engineering",
        "institution": "Universidad Pontificia Comillas — ICAI",
        "location": "Madrid, Spain",
        "start": "Sep 2007",
        "end": "July 2010",
        "bullets": [],
    },
]

TECHNICAL_SKILLS = {
    "Languages": "Python (since 2012), MATLAB (10 years), C (5 years), JavaScript (a few years), shell (since 2015)",
    "Tools": "Azure Cloud, PyTorch, Docker, Git[Hub], uv, pytest, tox, VS Code, TorchIO, MONAI, ITK, VTK, 3D Slicer",
}

LANGUAGES = (
    "Spanish: native; English (IELTS – 2017) and French: full professional"
    " proficiency; German (Goethe-Zertifikat B2 – 2012) and Italian:"
    " intermediate; Chinese (HSK2 – 2013) and Arabic: beginner."
)
