#import "common.typ": *
#import "data.typ": *

#show: cv-setup

#cv-header()

#section("Profile")
#cv-profile-long

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
  let bullets = edu.bullets.map(b => [- #b]).join()
  entry(
    [*#edu.degree* — _#edu.institution _],
    [_#edu.dates _],
    description: if edu.bullets.len() > 0 { bullets },
  )
}

#section("Technical Skills")
*Languages:* #skill-languages \
*Tools:* #skill-tools

#section("Languages")
#languages

#section("Selected Publications")
#for pub in selected-publications {
  let year-str = if pub.year != none [#pub.year] else []
  [- #pub.authors. *#pub.title.* _#pub.venue _ #year-str.]
}
