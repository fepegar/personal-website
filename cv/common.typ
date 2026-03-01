// Shared styling for Fernando Pérez-García's CV

#import "@preview/cv-soft-and-hard:0.1.0": styling, section, entry, python
#import "data.typ": name, email

#let cv-setup(body) = {
  set document(author: name, title: "CV " + name)
  show: styling
  body
}

#let cv-header() = {
  align(center)[
    = #name #text(size: 0.5em, weight: "regular", fill: luma(120))[(he/him)]
    #link("mailto:" + email)[#email] |
    #link("https://linkedin.com/in/fernandoperezgarcia")[LinkedIn] |
    #link("https://github.com/fepegar")[GitHub] |
    #link("https://scholar.google.com/citations?user=Gc2eg3kAAAAJ")[Scholar] |
    #link("https://orcid.org/0000-0001-9090-3024")[ORCID]
  ]
}
