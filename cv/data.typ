// AUTO-GENERATED from content/cv_data.py — do not edit manually

#let name = "Fernando Pérez-García"
#let job-title = "Senior Researcher and Team Lead"
#let affiliation = "Microsoft Research"
#let location = "Cambridge, UK"
#let email = "fepegar@gmail.com"

#let profile = "I am a senior researcher and team lead at Microsoft Research. My work within Microsoft Health Futures focuses on translating multimodal artificial intelligence research into clinical practice. I hold a PhD in Medical Imaging from UCL and King's College London, where I developed data-driven computer vision methods for the treatment of epilepsy, from classification of seizure videos to segmentation of postoperative MRI scans. Prior to this, I was a research engineer at the Paris Brain Institute, where I worked on tools for surgical planning and assessment in Parkinson's disease and epilepsy. I am a strong supporter of open-source software. My framework TorchIO is used as a research tool at numerous hospitals and academic institutions worldwide. When not staring at a computer screen, I can be found playing football or trumpet."

#let cv-profile-long = "I am an engineer with a PhD in Medical Imaging and a decade of experience applying cutting-edge multimodal AI for healthcare to solve real-world problems and supporting biomedical research. I strongly believe in the importance of meaningful translational research and have developed open-source machine learning software actively used by both clinicians and researchers. I enjoy being halfway between research and engineering and have developed strong communication skills to connect ideas from both worlds."

#let cv-profile-short = "I am an engineer with a PhD in Medical Imaging and a decade of experience applying multimodal AI for healthcare. I develop open-source machine learning software used by clinicians and researchers. I combine research and engineering with strong communication skills."

#let experience = (
  (
    title: "Senior Researcher and Team Lead",
    org-loc: "Microsoft Health Futures, Cambridge, UK",
    dates: "Feb 2022 – Present",
    bullets: (
      "Focus on Multimodal AI for healthcare: self-supervised learning (e.g. RAD-DINO, Nature Machine Intelligence) and generative diffusion models for medical imaging (e.g. RadEdit, ECCV)",
      "Collaborated with the NHS to develop a deep learning model for hippocampal segmentation from brain MRI scans",
      "Collaborated with Mayo Clinic to implement our multimodal LLM, MAIRA, in their clinical workflows",
    ),
  ),
  (
    title: "Research Software Engineer (freelance)",
    org-loc: "",
    dates: "Jan 2019 – Sep 2021",
    bullets: (
      "Paris Brain Institute (ICM): Developed tools to build a 3D atlas of the macaque brainstem (histology & MRI)",
      "Arterys – Medical Imaging Cloud AI: Deployed deep learning models for medical images using Docker",
      "Medical Augmented Intelligence (MAI): Developed virtual reality and medical imaging software on 3D Slicer",
    ),
  ),
  (
    title: "Research Software Engineer",
    org-loc: "Paris Brain Institute (ICM) – CENIR, Paris, France",
    dates: "Aug 2015 – July 2017",
    bullets: (
      "Created 3D atlases of human and monkey brainstems based on immunohistochemical and MRI data",
      "Collaborated with Medtronic on a product for planning and assessment of stereotactic surgery",
    ),
  ),
  (
    title: "Research Software Engineer (intern)",
    org-loc: "Center for Biomedical Technology (CTB – UPM), Madrid, Spain",
    dates: "Nov 2014 – Feb 2015",
    bullets: (
      "Collaborated with NASAL Inc. on a DICOM reading/writing software tool for planning of sinus surgery",
    ),
  ),
  (
    title: "Research Software Engineer (intern)",
    org-loc: "Paris Brain Institute (ICM) – CENIR, Paris, France",
    dates: "Mar 2014 – Sep 2014",
    bullets: (
      "Developed EpiLoc, an automated pipeline for planning and assessment of electrode implantation surgery in epilepsy",
    ),
  ),
)

#let education = (
  (
    degree: "PhD in Medical Imaging",
    institution: "University College London & King's College London",
    dates: "Sep 2018 – Nov 2022",
    bullets: (
      "Lead the development of TorchIO, a library for medical images and deep learning (in PyTorch ecosystem)",
      "Coordinated a collaboration between UCL and UCLH to publish EPISURG, a large MRI dataset",
      "Wrote and released Resseg, a tool for quantitative analysis of resective neurosurgery using deep learning",
      "Collaborated with neurophysiologists at NHNN to classify seizures from video-telemetry using deep learning",
      "Joined the Medical Open Network for AI (MONAI) Transformations Working Group as an advisor",
    ),
  ),
  (
    degree: "MRes Medical Imaging",
    institution: "University College London",
    dates: "Sep 2017 – Sep 2018",
    bullets: (
    ),
  ),
  (
    degree: "MEng Biomedical Engineering",
    institution: "Universidad Politécnica de Madrid",
    dates: "Sep 2014 – July 2015",
    bullets: (
    ),
  ),
  (
    degree: "BEng Sound and Image Engineering",
    institution: "Universidad Politécnica de Madrid",
    dates: "Sep 2009 – July 2014",
    bullets: (
      "Erasmus year at Beuth Hochschule für Technik Berlin, Germany (2011/12)",
    ),
  ),
  (
    degree: "BEng Industrial Electronics Engineering",
    institution: "Universidad Pontificia Comillas — ICAI",
    dates: "Sep 2007 – July 2010",
    bullets: (
    ),
  ),
)

#let skill-languages = "Python (since 2012), MATLAB (10 years), C (5 years), JavaScript (a few years), shell (since 2015)"
#let skill-tools = "Azure Cloud, PyTorch, Docker, Git[Hub], uv, pytest, tox, VS Code, TorchIO, MONAI, ITK, VTK, 3D Slicer"

#let languages = "Spanish: native; English (IELTS – 2017) and French: full professional proficiency; German (Goethe-Zertifikat B2 – 2012) and Italian: intermediate; Chinese (HSK2 – 2013) and Arabic: beginner."

#let selected-publications = (
  (
    title: "Exploring scalable medical image encoders beyond text supervision",
    authors: "Fernando Pérez-García, Harshita Sharma, Sam Bond-Taylor, Kenza Bouzid, Valentina Salvatelli, Maximilian Ilse, Shruthi Bannur, Daniel C Castro, Anton Schwaighofer, Matthew P Lungren, Maria Teodora Wetscherek, Noel Codella, Stephanie L Hyland, Javier Alvarez-Valle, and Ozan Oktay",
    venue: "Nature Machine Intelligence",
    year: 2025,
  ),
  (
    title: "MAIRA-2: Grounded Radiology Report Generation",
    authors: "Shruthi Bannur, Kenza Bouzid, Daniel C Castro, Anton Schwaighofer, Sam Bond-Taylor, Maximilian Ilse, Fernando Pérez-García, Valentina Salvatelli, Harshita Sharma, Felix Meissen, Mercy Ranjit, Shaury Srivastav, Julia Gong, Fabian Falck, Ozan Oktay, Anja Thieme, Matthew P Lungren, Maria Teodora Wetscherek, Javier Alvarez-Valle, and Stephanie L Hyland",
    venue: "arXiv preprint arXiv:2406.04449",
    year: 2024,
  ),
  (
    title: "RadEdit: stress-testing biomedical vision models via diffusion image editing",
    authors: "Fernando Pérez-García, Sam Bond-Taylor, Pedro P Sanchez, Boris van Breugel, Daniel C Castro, Harshita Sharma, Valentina Salvatelli, Maria TA Wetscherek, Hannah Richardson, Matthew P Lungren, Aditya Nori, Javier Alvarez-Valle, Ozan Oktay, and Maximilian Ilse",
    venue: "",
    year: 2024,
  ),
  (
    title: "Learning to exploit temporal structure for biomedical vision-language processing",
    authors: "Shruthi Bannur, Stephanie Hyland, Qianchu Liu, Fernando Perez-Garcia, Maximilian Ilse, Daniel C Castro, Benedikt Boecking, Harshita Sharma, Kenza Bouzid, Anja Thieme, Anton Schwaighofer, Maria Wetscherek, Matthew P Lungren, Aditya Nori, Javier Alvarez-Valle, and Ozan Oktay",
    venue: "Proceedings of the IEEE/CVF Conference on Computer Vision and Pattern Recognition",
    year: 2023,
  ),
  (
    title: "TorchIO: a Python library for efficient loading, preprocessing, augmentation and patch-based sampling of medical images in deep learning",
    authors: "Fernando Pérez-García, Rachel Sparks, and Sebastien Ourselin",
    venue: "Computer Methods and Programs in Biomedicine",
    year: 2021,
  ),
  (
    title: "Monai label: A framework for ai-assisted interactive labeling of 3d medical images",
    authors: "Andres Diaz-Pinto, Sachidanand Alle, Vishwesh Nath, Yucheng Tang, Alvin Ihsani, Muhammad Asad, Fernando Pérez-García, Pritesh Mehta, Wenqi Li, Mona Flores, Holger R Roth, Tom Vercauteren, Daguang Xu, Prerna Dogra, Sebastien Ourselin, Andrew Feng, and M Jorge Cardoso",
    venue: "Medical Image Analysis",
    year: 2024,
  ),
)

#let all-publications = (
  (
    title: "Exploring scalable medical image encoders beyond text supervision",
    authors: "Fernando Pérez-García, Harshita Sharma, Sam Bond-Taylor, Kenza Bouzid, Valentina Salvatelli, Maximilian Ilse, Shruthi Bannur, Daniel C Castro, Anton Schwaighofer, Matthew P Lungren, Maria Teodora Wetscherek, Noel Codella, Stephanie L Hyland, Javier Alvarez-Valle, and Ozan Oktay",
    venue: "Nature Machine Intelligence",
    year: 2025,
  ),
  (
    title: "Challenges for responsible AI design and workflow integration in healthcare: a case study of automatic feeding tube qualification in radiology",
    authors: "Anja Thieme, Abhijith Rajamohan, Benjamin Cooper, Heather Groombridge, Robert Simister, Barney Wong, Nicholas Woznitza, Mark A Pinnock, Maria T Wetscherek, Cecily Morrison, Hannah Richardson, Fernando Pérez-García, Stephanie L Hyland, Shruthi Bannur, Daniel Coelho de Castro, Kenza Bouzid, Anton Schwaighofer, Mercy P Ranjit, Harshita Sharma, Matthew P Lungren, Ozan Oktay, Javier Alvarez-Valle, Aditya Nori, Steve Harris, and Joseph Jacob",
    venue: "ACM Transactions on Computer-Human Interaction",
    year: 2025,
  ),
  (
    title: "Closing the Performance Gap Between AI and Radiologists in Chest X-Ray Reporting",
    authors: "Harshita Sharma, Maxwell C Reynolds, Valentina Salvatelli, Anne-Marie G Sykes, Kelly K Horst, Anton Schwaighofer, Maximilian Ilse, Olesya Melnichenko, Sam Bond-Taylor, Fernando Pérez-García, Vamshi K Mugu, Alex Chan, Ceylan Colak, Shelby A Swartz, Motassem B Nashawaty, Austin J Gonzalez, Heather A Ouellette, Selnur B Erdal, Beth A Schueler, Maria T Wetscherek, Noel Codella, Mohit Jain, Shruthi Bannur, Kenza Bouzid, Daniel C Castro, Stephanie Hyland, Panos Korfiatis, Ashish Khandelwal, and Javier Alvarez-Valle",
    venue: "arXiv preprint arXiv:2511.21735",
    year: 2025,
  ),
  (
    title: "Comprehensive language-image pre-training for 3D medical image understanding",
    authors: "Tassilo Wald, Ibrahim Ethem Hamamci, Yuan Gao, Sam Bond-Taylor, Harshita Sharma, Maximilian Ilse, Cynthia Lo, Olesya Melnichenko, Anton Schwaighofer, Noel CF Codella, Maria Teodora Wetscherek, Klaus H Maier-Hein, Panagiotis Korfiatis, Valentina Salvatelli, Javier Alvarez-Valle, and Fernando Pérez-García",
    venue: "arXiv preprint arXiv:2510.15042",
    year: 2025,
  ),
  (
    title: "Data Scaling Laws for Radiology Foundation Models",
    authors: "Maximilian Ilse, Harshita Sharma, Anton Schwaighofer, Sam Bond-Taylor, Fernando Pérez-García, Olesya Melnichenko, Anne-Marie G Sykes, Kelly K Horst, Ashish Khandelwal, Maxwell Reynolds, Maria T Wetscherek, Noel CF Codella, Javier Alvarez-Valle, Korfiatis Panagiotis, and Valentina Salvatelli",
    venue: "arXiv preprint arXiv:2509.12818",
    year: 2025,
  ),
  (
    title: "Let's share: Open-source frameworks and public databases",
    authors: "Fernando Pérez-García, Benjamin Murray, Eric Kerfoot, Sebastien Ourselin, and Marc Modat",
    venue: "",
    year: 2025,
  ),
  (
    title: "Monai label: A framework for ai-assisted interactive labeling of 3d medical images",
    authors: "Andres Diaz-Pinto, Sachidanand Alle, Vishwesh Nath, Yucheng Tang, Alvin Ihsani, Muhammad Asad, Fernando Pérez-García, Pritesh Mehta, Wenqi Li, Mona Flores, Holger R Roth, Tom Vercauteren, Daguang Xu, Prerna Dogra, Sebastien Ourselin, Andrew Feng, and M Jorge Cardoso",
    venue: "Medical Image Analysis",
    year: 2024,
  ),
  (
    title: "MAIRA-2: Grounded Radiology Report Generation",
    authors: "Shruthi Bannur, Kenza Bouzid, Daniel C Castro, Anton Schwaighofer, Sam Bond-Taylor, Maximilian Ilse, Fernando Pérez-García, Valentina Salvatelli, Harshita Sharma, Felix Meissen, Mercy Ranjit, Shaury Srivastav, Julia Gong, Fabian Falck, Ozan Oktay, Anja Thieme, Matthew P Lungren, Maria Teodora Wetscherek, Javier Alvarez-Valle, and Stephanie L Hyland",
    venue: "arXiv preprint arXiv:2406.04449",
    year: 2024,
  ),
  (
    title: "Multimodal healthcare AI: identifying and designing clinically relevant vision-language applications for radiology",
    authors: "Nur Yildirim, Hannah Richardson, Maria Teodora Wetscherek, Junaid Bajwa, Joseph Jacob, Mark Ames Pinnock, Stephen Harris, Daniel Coelho De Castro, Shruthi Bannur, Stephanie Hyland, Pratik Ghosh, Mercy Ranjit, Kenza Bouzid, Anton Schwaighofer, Fernando Pérez-García, Harshita Sharma, Ozan Oktay, Matthew Lungren, Javier Alvarez-Valle, Aditya Nori, and Anja Thieme",
    venue: "",
    year: 2024,
  ),
  (
    title: "RadEdit: stress-testing biomedical vision models via diffusion image editing",
    authors: "Fernando Pérez-García, Sam Bond-Taylor, Pedro P Sanchez, Boris van Breugel, Daniel C Castro, Harshita Sharma, Valentina Salvatelli, Maria TA Wetscherek, Hannah Richardson, Matthew P Lungren, Aditya Nori, Javier Alvarez-Valle, Ozan Oktay, and Maximilian Ilse",
    venue: "",
    year: 2024,
  ),
  (
    title: "MAIRA at RRG24: A specialised large multimodal model for radiology report generation",
    authors: "Shaury Srivastav, Mercy Ranjit, Fernando Pérez-García, Kenza Bouzid, Shruthi Bannur, Daniel C Castro, Anton Schwaighofer, Harshita Sharma, Maximilian Ilse, Valentina Salvatelli, Sam Bond-Taylor, Fabian Falck, Anja Thieme, Hannah Richardson, Matthew P Lungren, Stephanie L Hyland, and Javier Alvarez-Valle",
    venue: "Proceedings of the 23rd Workshop on Biomedical Natural Language Processing",
    year: 2024,
  ),
  (
    title: "MAIRA-Seg: Enhancing Radiology Report Generation with Segmentation-Aware Multimodal Large Language Models",
    authors: "Harshita Sharma, Valentina Salvatelli, Shaury Srivastav, Kenza Bouzid, Shruthi Bannur, Daniel C Castro, Maximilian Ilse, Sam Bond-Taylor, Mercy Prasanna Ranjit, Fabian Falck, Fernando Pérez-García, Anton Schwaighofer, Hannah Richardson, Maria Teodora Wetscherek, Stephanie L Hyland, and Javier Alvarez-Valle",
    venue: "arXiv preprint arXiv:2411.11362",
    year: 2024,
  ),
  (
    title: "Zero-shot domain transfer with a text-to-text model",
    authors: "Stephanie HYLAND, Aditya Nori, Fangyu Liu, Fernando PEREZ-GARCIA, Qianchu LIU, Hoifung Poon, Javier ALVAREZ-VALLE, Naoto USUYAMA, Ozan Oktay, Sheng Zhang, Shruthi Jaisimha Bannur, and Tristan Josef NAUMANN",
    venue: "",
    year: 2024,
  ),
  (
    title: "Learning to exploit temporal structure for biomedical vision-language processing",
    authors: "Shruthi Bannur, Stephanie Hyland, Qianchu Liu, Fernando Perez-Garcia, Maximilian Ilse, Daniel C Castro, Benedikt Boecking, Harshita Sharma, Kenza Bouzid, Anja Thieme, Anton Schwaighofer, Maria Wetscherek, Matthew P Lungren, Aditya Nori, Javier Alvarez-Valle, and Ozan Oktay",
    venue: "Proceedings of the IEEE/CVF Conference on Computer Vision and Pattern Recognition",
    year: 2023,
  ),
  (
    title: "MAIRA-1: A specialised large multimodal model for radiology report generation",
    authors: "Stephanie L Hyland, Shruthi Bannur, Kenza Bouzid, Daniel C Castro, Mercy Ranjit, Anton Schwaighofer, Fernando Pérez-García, Valentina Salvatelli, Shaury Srivastav, Anja Thieme, Noel Codella, Matthew P Lungren, Maria Teodora Wetscherek, Ozan Oktay, and Javier Alvarez-Valle",
    venue: "arXiv preprint arXiv:2311.13668",
    year: 2023,
  ),
  (
    title: "Exploring the Boundaries of GPT-4 in Radiology",
    authors: "Qianchu Liu, Stephanie Hyland, Shruthi Bannur, Kenza Bouzid, Daniel C Castro, Maria Teodora Wetscherek, Robert Tinn, Harshita Sharma, Fernando Pérez-García, Anton Schwaighofer, Pranav Rajpurkar, Sameer Tajdin Khanna, Hoifung Poon, Naoto Usuyama, Anja Thieme, Aditya V Nori, Matthew P Lungren, Ozan Oktay, and Javier Alvarez-Valle",
    venue: "arXiv preprint arXiv:2310.14573",
    year: 2023,
  ),
  (
    title: "Compositional zero-shot domain transfer with text-to-text models",
    authors: "Fangyu Liu, Qianchu Liu, Shruthi Bannur, Fernando Pérez-García, Naoto Usuyama, Sheng Zhang, Tristan Naumann, Aditya Nori, Hoifung Poon, Javier Alvarez-Valle, Ozan Oktay, and Stephanie L Hyland",
    venue: "Transactions of the Association for Computational Linguistics",
    year: 2023,
  ),
  (
    title: "Region-based Contrastive Pretraining for Medical Image Retrieval with Anatomic Query",
    authors: "Ho Hin Lee, Alberto Santamaria-Pang, Jameson Merkow, Ozan Oktay, Fernando Pérez-García, Javier Alvarez-Valle, and Ivan Tarapov",
    venue: "arXiv preprint arXiv:2305.05598",
    year: 2023,
  ),
  (
    title: "MS-CXR-T: Learning to Exploit Temporal Structure for Biomedical Vision-Language Processing",
    authors: "Shruthi Bannur, Stephanie Hyland, Qianchu Liu, Fernando Pérez-García, Max Ilse, Daniel Coelho de Castro, Benedikt Boecking, Harshita Sharma, Kenza Bouzid, Anton Schwaighofer, Maria Teodora Wetscherek, Hannah Richardson, Tristan Naumann, Javier Alvarez Valle, and Ozan Oktay",
    venue: "",
    year: 2023,
  ),
  (
    title: "InnerEye as a tool for accurate hippocampal segmentation",
    authors: "Anna Schroder, James Moggridge, Jiaming Wu, Hamza A Salhab, Sjoerd Vos, Melissa Bristow, Fernando Pérez-García, Javier Alvarez-Valle, Tarek A Yousry, John S Thornton, Frederik Barkhof, Matthew Grech-Sollars, and Daniel C Alexander",
    venue: "Proceedings of 2023 ISMRM Annual Meeting and Exhibition (ISMRM)",
    year: 2023,
  ),
  (
    title: "Towards a data-driven treatment of epilepsy: computational methods to overcome low-data regimes in clinical settings",
    authors: "Fernando Pérez-García",
    venue: "",
    year: 2023,
  ),
  (
    title: "Probabilistic landscape of seizure semiology localizing values",
    authors: "Ali Alim-Marvasti, Gloria Romagnoli, Karan Dahele, Hadi Modarres, Fernando Pérez-García, Rachel Sparks, Sébastien Ourselin, Matthew J Clarkson, Fahmida Chowdhury, Beate Diehl, and John S Duncan",
    venue: "Brain Communications",
    year: 2022,
  ),
  (
    title: "Pedunculopontine and cuneiform nuclei deep brain stimulation for severe gait and balance disorders in Parkinson’s disease: interim results from a randomized double-blind clinical trial",
    authors: "Julie Bourilhon, Claire Olivier, Hana You, Antoine Collomb-Clerc, David Grabli, Hayat Belaid, Yannick Mullie, Chantal François, Virginie Czernecki, Brian Lau, Fernando Pérez-García, Eric Bardinet, Sara Fernandez-Vidal, Carine Karachi, and Marie-Laure Welter",
    venue: "Journal of Parkinson's disease",
    year: 2022,
  ),
  (
    title: "Software tool for visualization of a probabilistic map of the epileptogenic zone from seizure semiologies",
    authors: "Fernando Pérez-García, Ali Alim-Marvasti, Gloria Romagnoli, Matthew J Clarkson, Rachel Sparks, John S Duncan, and Sébastien Ourselin",
    venue: "Frontiers in Neuroinformatics",
    year: 2022,
  ),
  (
    title: "Seizure focus prediction from seizure semiology: data-driven cortical probabilistic heatmaps from 4643 patients",
    authors: "Ali Alim-Marvasti, Gloria Romagnoli, Fernando Pérez-García, Fatemeh Geranmayeh, Gregory Scott, Sadegh Shahrbaf, Fahmida Amin Chowdhury, Beate Diehl, Matthew Clarkson, and John S. Duncan",
    venue: "",
    year: 2022,
  ),
  (
    title: "TorchIO: a Python library for efficient loading, preprocessing, augmentation and patch-based sampling of medical images in deep learning",
    authors: "Fernando Pérez-García, Rachel Sparks, and Sebastien Ourselin",
    venue: "Computer Methods and Programs in Biomedicine",
    year: 2021,
  ),
  (
    title: "A self-supervised learning strategy for postoperative brain cavity segmentation simulating resections",
    authors: "Fernando Pérez-García, Reuben Dorent, Michele Rizzi, Francesco Cardinale, Valerio Frazzini, Vincent Navarro, Caroline Essert, Irène Ollivier, Tom Vercauteren, Rachel Sparks, John S Duncan, and Sébastien Ourselin",
    venue: "International Journal of Computer Assisted Radiology and Surgery",
    year: 2021,
  ),
  (
    title: "Transfer learning of deep spatiotemporal networks to model arbitrarily long videos of seizures",
    authors: "Fernando Pérez-García, Catherine Scott, Rachel Sparks, Beate Diehl, and Sébastien Ourselin",
    venue: "",
    year: 2021,
  ),
  (
    title: "Machine learning for localizing epileptogenic-zone in the temporal lobe: Quantifying the value of multimodal clinical-semiology and imaging concordance",
    authors: "Ali Alim-Marvasti, Fernando Pérez-García, Karan Dahele, Gloria Romagnoli, Beate Diehl, Rachel Sparks, Sebastien Ourselin, Matthew J Clarkson, and John S Duncan",
    venue: "Frontiers in digital health",
    year: 2021,
  ),
  (
    title: "A generative model of hyperelastic strain energy density functions for multiple tissue brain deformation",
    authors: "Alejandro Granados, Fernando Perez-Garcia, Martin Schweiger, Vejay Vakharia, Sjoerd B Vos, Anna Miserocchi, Andrew W McEvoy, John S Duncan, Rachel Sparks, and Sébastien Ourselin",
    venue: "International Journal of Computer Assisted Radiology and Surgery",
    year: 2021,
  ),
  (
    title: "Simulation of brain resection for cavity segmentation using self-supervised and semi-supervised learning",
    authors: "Fernando Pérez-García, Roman Rodionov, Ali Alim-Marvasti, Rachel Sparks, John S Duncan, and Sébastien Ourselin",
    venue: "",
    year: 2020,
  ),
  (
    title: "Anatomo‐functional mapping of the primate mesencephalic locomotor region using stereotactic lesions",
    authors: "Marion Gay, Hayat Belaid, Alister Rogers, Fernando Pérez‐García, Maxime Roustan, Eric Bardinet, Chantal François, and Carine Karachi",
    venue: "Movement Disorders",
    year: 2020,
  ),
  (
    title: "Normal and pathological neuronal distribution of the human mesencephalic locomotor region",
    authors: "Sophie B Sébille, Anne‐Sophie Rolland, Matthieu Faillot, Fernando Perez‐Garcia, Antoine Colomb‐Clerc, Brian Lau, Sylvie Dumas, Sara Fernandez Vidal, Marie‐Laure Welter, Chantal Francois, Eric Bardinet, and Carine Karachi",
    venue: "Movement Disorders",
    year: 2019,
  ),
  (
    title: "Multicenter validation of automated trajectories for selective laser amygdalohippocampectomy",
    authors: "Vejay N Vakharia, Rachel E Sparks, Kuo Li, Aidan G O'Keeffe, Fernando Pérez‐García, Lucas GS França, Andrew L Ko, Chengyuan Wu, Joshua P Aronson, Brett E Youngerman, Ashwini Sharan, Guy McKhann, Sebastien Ourselin, and John S Duncan",
    venue: "Epilepsia",
    year: 2019,
  ),
  (
    title: "Machine learning for stereotactic neurosurgery: A prospective implementation and validation",
    authors: "Vejay N Vakharia, Rachel Sparks, Fernando Pérez-García, Alejandro Granados, Anna Miserocchi, Andrew McEvoy, Sebastien Ourselin, and John S Duncan",
    venue: "",
    year: 2019,
  ),
  (
    title: "Software suite for stereotactic imaging",
    authors: "Sara Fernández Vidal, Jordan Cornillault, Fernando Pérez-García, Pierre Jannin, Dominique Hasboun, Carine Karachi, and Eric Bardinet",
    venue: "World Society for Stereotactic and Functional Neurosurgery 2019",
    year: 2019,
  ),
  (
    title: "Multiparametric evaluation of geometric distortions in stereotactic MR imaging at 1.5 and 3 Tesla with a plexiglass phantom: towards practical recommendations for clinical imaging protocols*",
    authors: "Gizem Temiz, Fernando Pérez-García, Catherine Jenny, Stéphane Lehéricy, Marguerite Cuttat, Didier Dormont, Damien Galanaud, Chales Valery, Carine Karachi, Romain Valabregue, Sara Fernandez-Vidal, Nadya Pyatigorskaya, and Eric Bardinet",
    venue: "International Society for Magnetic Resonance in Medicine",
    year: 2019,
  ),
  (
    title: "Tumor localization using prone to supine surface based registration for breast cancer surgical planning",
    authors: "F Alfano, F Pérez-García, J E Ortuño Fisac, M Herrero Conde, O Bueno Zamora, Felipe A Calvo, S Lizarraga, Andrés Santos, Javier Pascau, and M J Ledesma Carbayo",
    venue: "2018 IEEE 15th International Symposium on Biomedical Imaging (ISBI 2018)",
    year: 2018,
  ),
  (
    title: "Automatic brain vessel segmentation using 3D convolutional neural networks",
    authors: "Fernando Pérez-García, Rachel Sparks, John Duncan, and Sebastien Ourselin",
    venue: "",
    year: 2018,
  ),
  (
    title: "Learning-based attenuation correction for Head and Neck PET/MR",
    authors: "Maya Khalifé, Romain de Laroche, Sandeep Kaushik, Brian Sgard, Fernando Pérez-García, Melika Sahli Amor, Didier Dormont, Marie-Odile Habert, Florian Wiesinger, and Aurélie Kas",
    venue: "International Society for Magnetic Resonance in Medicine",
    year: 2018,
  ),
  (
    title: "ZTE-based attenuation correction in head and neck PET/MR",
    authors: "Maya Khalifé, Romain de Larocheyz, Dirk Bequé, Brian Sgard, Fernando Pérez-García, Marine Sorety, Melika Sahli Amor, Marie-Odile Habert, Florian Wiesinger, and Aurélie Kas",
    venue: "2017 IEEE Nuclear Science Symposium and Medical Imaging Conference (NSS/MIC)",
    year: 2017,
  ),
  (
    title: "ZTE-based attenuation correction in head and neck PET/MRI",
    authors: "R de Laroche, M Khalife, D Beque, B Sgard, F Perez-Garcia, M Soret, M Habert, F Wiesinger, and A Kas",
    venue: "EUROPEAN JOURNAL OF NUCLEAR MEDICINE AND MOLECULAR IMAGING",
    year: 2017,
  ),
  (
    title: "ZTE-based attenuation correction in PET/MR: application to head and neck cancer",
    authors: "Maya Khalifé, Romain de Laroche, Dirk Bequé, Brian Sgard, Fernando Pérez-García, Marine Soret, Marie-Odile Habert, Florian Wiesinger, and Aurélie Kas",
    venue: "IEEE NSS-MIC",
    year: 2017,
  ),
  (
    title: "Prone to supine surface-based registration for surgical planning in breast cancer treatment",
    authors: "F Alfano, F Pérez-García, JE Ortuño Fisac, M Herrero Conde, O Bueno Zamora, Felipe A Calvo, S Lizarraga, A Santos, J Pascau, and MJ Ledesma Carbayo",
    venue: "Congreso Anual de la Sociedad Española de Ingeniería Biomédica",
    year: 2017,
  ),
  (
    title: "Automatic Segmentation Of Depth Electrodes Implanted In Epileptic Patients: A Modular Tool Adaptable To Multicentric Protocols",
    authors: "Fernando Pérez-­García, Katia Lehongre, Eric Bardinet, Pierre Jannin, Vincent Navarro, Dominique Hasboun, and Sara Fernández-Vidal",
    venue: "Epilepsia",
    year: 2015,
  ),
  (
    title: "Localización de lesiones de mama en posición quirúrgica utilizando deformación laplaciana de mallas poligonales",
    authors: "Fernando Pérez-García, Juan Enrique Ortuño Fisac, Mercedes Herrero Conde, O Bueno Zamora, F Calvo, S Lizarraga, Javier Pascau, and MJ Ledesma Carbayo",
    venue: "Ingeniando la medicina del futuro. XXXIII Congreso Anual de la Sociedad Española de Ingeniería Biomédica. CASEIB 2015: Libro de Actas",
    year: 2015,
  ),
  (
    title: "Localization of breast cancer lesions in surgical position using laplacian deformation of polygonal meshes",
    authors: "Fernando Pérez-García, Juan Enrique Ortuño Fisac, Mercedes Herrero Conde, Óscar Bueno Zamora, Felipe Calvo, Santiago Lizarraga, Javier Pascau, and María Jesús Ledesma Carbayo",
    venue: "Congress of the Spanish Society Of Biomedical Engineering (CASEIB)",
    year: 2015,
  ),
  (
    title: "Clinical Validation of the InnerEye Hippocampal Segmentation Tool",
    authors: "Anna Schroder, Hamza A Salhab, James Moggridge, Caroline Micallef, Jiaming Wu, Sjoerd Vos, Melissa Bristow, Fernando Pérez-García, Javier Alvarez-Valle, Tarek A Yousry, John S Thornton, Frederik Barkhof, Daniel C Alexander, and Matthew Grech-Sollars",
    venue: "",
    year: none,
  ),
)
