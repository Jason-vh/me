// Compile with: typst compile --font-path fonts resume.typ jason-van-hattum.pdf

#let accent = rgb("#c4421e")
#let ink = rgb("#111111")
#let ink-soft = rgb("#2a2a2a")
#let ink-muted = rgb("#666666")
#let rule = rgb("#c8c8c8")

#set document(
  title: "Jason van Hattum — Staff Engineer",
  author: "Jason van Hattum",
)

#set page(
  paper: "a4",
  margin: (top: 14mm, bottom: 14mm, left: 16mm, right: 16mm),
)

#set text(
  font: "Inter",
  size: 10.25pt,
  fill: ink,
  lang: "en",
)

#set par(leading: 0.55em, justify: false)

// ---------- helpers ----------

#let serif(weight: "regular", style: "normal", size: none, fill: auto, body) = {
  set text(font: "Fraunces", weight: weight, style: style)
  if size != none { set text(size: size); body } else { body }
}

#let eyebrow(label) = {
  set text(font: "Inter", size: 8.5pt, weight: "medium", fill: accent, tracking: 1.4pt)
  block(below: 3mm)[
    #box(width: 6mm, baseline: -3pt)[#line(length: 100%, stroke: 0.7pt + accent)]
    #h(1.5mm)
    #upper(label)
  ]
}

#let display-name(first, last) = {
  set text(font: "Fraunces", size: 26pt, weight: "semibold", fill: ink)
  block(below: 3mm, above: 0pt)[
    #first #h(0.15em) #text(style: "italic", weight: "medium", fill: accent)[#last]
  ]
}

#let intro(body) = {
  set text(font: "Inter", size: 10pt, fill: ink-soft)
  set par(leading: 0.5em)
  block(below: 8mm)[#body]
}

#let section-heading(label) = {
  set text(font: "Fraunces", size: 9pt, style: "italic", weight: "regular", fill: ink-muted, tracking: 1.6pt)
  block(above: 6mm, below: 3mm)[#upper(label)]
}

#let role-line(title, company, dates, sub: none) = {
  block(below: 1.5mm)[
    #grid(
      columns: (1fr, auto),
      column-gutter: 6mm,
      align: (left + top, right + top),
      [
        #text(font: "Fraunces", size: 11pt, weight: "semibold")[#title]
        #text(font: "Fraunces", size: 11pt, style: "italic", weight: "regular", fill: ink-muted)[ at ]
        #text(font: "Fraunces", size: 11pt, weight: "semibold", fill: accent)[#company]
      ],
      [
        #text(font: "Fraunces", size: 9pt, style: "italic", fill: ink-muted)[#dates]
        #if sub != none [
          #linebreak()
          #text(font: "Fraunces", size: 8pt, style: "italic", fill: ink-muted)[#sub]
        ]
      ],
    )
  ]
}

#let bullet(body) = {
  block(below: 1mm)[
    #grid(
      columns: (4mm, 1fr),
      align: (left + top, left + top),
      [
        #v(0.45em)
        #box(width: 2mm)[#line(length: 100%, stroke: 0.9pt + accent)]
      ],
      text(size: 10pt, fill: ink-soft)[#body],
    )
  ]
}

#let tools(items) = {
  v(2mm)
  block[
    #line(length: 100%, stroke: (paint: rule, thickness: 0.5pt, dash: "dashed"))
    #v(1.5mm, weak: true)
    #set text(size: 8.75pt, fill: ink-muted)
    #text(weight: "semibold", fill: ink)[Tools & technologies]
    #h(1.5mm) · #h(1.5mm)
    #items
  ]
}

#let role(title, company, dates, sub: none, bullets: (), tech: none) = {
  block(breakable: false, below: 4mm, above: 1mm)[
    #role-line(title, company, dates, sub: sub)
    #v(1mm, weak: true)
    #for b in bullets [#bullet(b)]
    #if tech != none [#tools(tech)]
  ]
}

#let education-item(degree, school, dates) = {
  block(below: 2mm)[
    #grid(
      columns: (1fr, auto),
      column-gutter: 4mm,
      align: (left + bottom, right + bottom),
      [
        #text(font: "Fraunces", size: 10.5pt, weight: "medium")[#degree]
        #text(font: "Fraunces", size: 10.5pt, fill: ink-muted)[ · ]
        #text(font: "Fraunces", size: 10.5pt, weight: "medium", fill: accent)[#school]
      ],
      text(font: "Fraunces", size: 9pt, style: "italic", fill: ink-muted)[#dates],
    )
  ]
}

// ---------- content ----------

#eyebrow("Staff Engineer")
#display-name[Jason][van Hattum]
#intro[
  I'm a highly motivated, outcome-driven engineer with a healthy balance of soft
  skills and full-stack development. I have experience leading and driving large,
  cross-team projects, solving dependencies, breaking silos and growing engineers.
]

#section-heading("Work Experience")

#role(
  "Staff Engineer",
  "Sendcloud",
  "Aug 2024 — present",
  sub: "Software Engineer · Aug 2022 — Aug 2024",
  bullets: (
    [Led a 200k+ LOC migration to TypeScript across 14 teams, introducing tooling, mentoring engineers and securing stakeholder buy-in.],
    [Planned and initiated the move from Elasticsearch to InfluxDB for 10+ years of analytics data, reducing costs and centralising expertise.],
    [Designed and implemented a recommendations engine using a decade of data to help users save costs and improve satisfaction — coordinating amongst multiple feature teams and data engineers.],
    [Introduced regular backend chapter meetings, fostering collaboration among 50+ engineers and contributing to improvements in the ADR process, event-bus architecture, API design, and product alignment.],
    [Redesigned the frontend hiring process, creating new technical assessments and interview questions while conducting numerous interviews.],
    [Provided technical leadership for a number of projects — designing solutions, aligning stakeholders, managing dependencies and shipping code.],
    [Took operational ownership of relevant incidents: resolving the incident, communicating with stakeholders, writing the post-mortem and driving follow-ups.],
    [Collaborated with product managers, designers and other engineers to design and develop user-facing features.],
    [Resolved bugs and provided support on both the frontend and backend.],
    [Mentored, challenged and advocated for engineers across all disciplines, reviewed code, and collaborated with solution design.],
  ),
  tech: [Python, Django, FastAPI, Vue, TypeScript, JavaScript, Vite, Kubernetes, AWS, Docker, GitLab, Terraform, Postgres, Elasticsearch, Figma, DDD],
)

#role(
  "Full-Stack Software Engineer",
  "AXXS",
  "Jan 2022 — Jul 2022",
  bullets: (
    [Designed and implemented features in a 200+ microservice architecture.],
  ),
  tech: [Java, PHP, JavaScript, Node, AWS, Kafka, Postgres, Vue, HTML, CSS],
)

#role(
  "Senior Software Engineer",
  "EPI-USE",
  "Mar 2021 — Dec 2021",
  bullets: (
    [Extended and maintained the component library used by over 100 engineers at MTN, Africa's largest telecom.],
  ),
  tech: [Angular, TypeScript, Docker, GitLab, Bootstrap, HTML, CSS],
)

#role(
  "Founder & Software Engineer",
  "Verbatic",
  "2019 — 2021",
  bullets: (
    [Designed and executed greenfield projects end-to-end across a diverse set of technologies while managing clients.],
  ),
  tech: [Java, Angular, C\#, Docker, Firebase, GitLab, GCP, JavaScript, MongoDB, PHP, Swift, Tailwind],
)

#role(
  "Software Engineer",
  "Compiax",
  "2016 — 2019",
  bullets: (
    [Designed and implemented projects across multiple domains and technologies.],
  ),
  tech: [Angular, Docker, Firebase, GitHub, GCP, JavaScript, MongoDB, PHP, MySQL, Tailwind],
)

#section-heading("Education")
#education-item(
  "BSc. (Hons) Computer Science",
  "University of Pretoria",
  "2015 — 2018",
)

// footer
#place(
  bottom + center,
  dy: 6mm,
  block(width: 100%)[
    #line(length: 100%, stroke: 0.5pt + rule)
    #v(2.5mm, weak: true)
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      text(size: 9pt, fill: ink-muted)[© Jason van Hattum],
      text(size: 9pt, fill: accent)[#link("mailto:jason@vanhattum.xyz")[jason\@vanhattum.xyz]],
    )
  ],
)
