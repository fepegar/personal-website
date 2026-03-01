#import "common.typ": *
#import "data.typ": *

#show: cv-setup

#set page(margin: (x: 1.6cm, y: 1.4cm))
#set text(size: 9.5pt)
#set par(leading: 0.55em)

#cv-header()

#section("Profile")
#cv-profile-short

#section("Experience")
#for exp in experience {
  let bullets = exp.bullets.map(b => [- #b]).join()
  entry(
    [*#exp.title* #if exp.org-loc != "" [(_#exp.org-loc _)]],
    [_#exp.dates _],
    description: if exp.bullets.len() > 0 { bullets },
  )
}

#section("Education")
#for edu in education {
  entry(
    [*#edu.degree* — _#edu.institution _],
    [_#edu.dates _],
  )
}

#section("Technical Skills")
*Languages:* #skill-languages \
*Tools:* #skill-tools

#section("Languages")
#languages

#section("Selected Publications")
#set text(size: 9pt)
#for pub in selected-publications {
  let year-str = if pub.year != none [#pub.year] else []
  [- #pub.authors. *#pub.title.* _#pub.venue _ #year-str.]
}
