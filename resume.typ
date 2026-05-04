// Compile with: typst compile --font-path fonts resume.typ jason-van-hattum.pdf

#let accent = rgb("#c4421e")
#let ink = rgb("#1a1714")
#let ink-soft = rgb("#4a4137")
#let ink-muted = rgb("#897f72")
#let rule = rgb("#d8d0c2")

#set document(
  title: "Jason van Hattum - Resume",
  author: "Jason van Hattum",
)

#set page(
  paper: "a4",
  margin: (top: 16mm, bottom: 16mm, left: 18mm, right: 18mm),
)

#set text(
  font: ("Helvetica Neue", "Inter"),
  size: 10.25pt,
  fill: ink,
  lang: "en",
)

#set par(leading: 0.6em, justify: false)

// ---------- helpers ----------

#let eyebrow(label) = {
  set text(size: 8.25pt, weight: "medium", fill: accent, tracking: 1.4pt)
  block(below: 4mm)[
    #box(width: 1.4mm, height: 1.4mm, fill: accent, radius: 0.7mm)
    #h(2mm)
    #upper(label)
  ]
}

#let display-name(first, last) = {
  set text(size: 28pt, weight: "bold", fill: ink)
  block(below: 4mm, above: 0pt)[
    #first #h(0.18em) #text(fill: accent)[#last]
  ]
}

#let intro(body) = {
  set text(size: 10pt, fill: ink-soft)
  block(below: 4mm)[#body]
}

#let contact(..items) = {
  set text(size: 8.75pt, fill: ink-muted)
  let entries = items.pos()
  let sep = box[#h(2.5mm) #text(fill: accent, weight: "bold")[·] #h(2.5mm)]
  block(below: 9mm, entries.intersperse(sep).sum(default: []))
}

#let section-heading(label) = {
  set text(size: 7.75pt, weight: "medium", fill: ink-muted, tracking: 1.7pt)
  block(above: 8mm, below: 5mm)[#upper(label)]
}

#let role-line(title, company, dates, sub: none) = {
  block(below: 2mm)[
    #grid(
      columns: (1fr, auto),
      column-gutter: 8mm,
      align: (left + top, right + top),
      [
        #text(size: 11.5pt, weight: "bold")[#title]
        #text(size: 11.5pt, weight: "regular", fill: ink-muted)[ at ]
        #text(size: 11.5pt, weight: "bold", fill: accent)[#company]
      ],
      [
        #text(size: 9pt, fill: ink-soft)[#dates]
        #if sub != none [
          #linebreak()
          #v(0.4mm, weak: true)
          #text(size: 8.5pt, fill: ink-muted)[#sub]
        ]
      ],
    )
  ]
}

#let bullet(body) = {
  block(below: 2.5mm)[
    #grid(
      columns: (5mm, 1fr),
      align: (left + top, left + top),
      [
        #v(0.55em)
        #box(width: 2.2mm)[#line(length: 100%, stroke: 0.9pt + accent)]
      ],
      text(size: 10pt, fill: ink-soft)[#body],
    )
  ]
}

#let tools(items) = {
  v(3mm)
  block[
    #line(length: 100%, stroke: (paint: rule, thickness: 0.5pt, dash: "dashed"))
    #v(2.5mm)
    #set text(size: 8.5pt, fill: ink-muted)
    #text(weight: "bold", fill: ink)[Tools]
    #h(1.5mm) #text(fill: accent, weight: "bold")[·] #h(1.5mm)
    #items
  ]
}

#let role(title, company, dates, sub: none, bullets: (), tech: none) = {
  v(6mm)
  line(length: 100%, stroke: 0.5pt + rule)
  v(6mm)
  block(breakable: false)[
    #role-line(title, company, dates, sub: sub)
    #v(2mm)
    #for b in bullets [#bullet(b)]
    #if tech != none [#tools(tech)]
  ]
}

#let education-item(degree, school, dates) = {
  v(6mm)
  line(length: 100%, stroke: 0.5pt + rule)
  v(6mm)
  block[
    #grid(
      columns: (1fr, auto),
      column-gutter: 4mm,
      align: (left + bottom, right + bottom),
      [
        #text(size: 10.5pt, weight: "bold")[#degree]
        #text(size: 10.5pt, fill: ink-muted)[ · ]
        #text(size: 10.5pt, weight: "bold", fill: accent)[#school]
      ],
      text(size: 9pt, fill: ink-soft)[#dates],
    )
  ]
}

// ---------- content ----------

#eyebrow("Product Engineer")
#display-name[Jason][van Hattum]
#intro[
  I'm a highly motivated, outcome-driven engineer with a healthy balance of soft
  skills and full-stack development. I have experience leading and driving large,
  cross-team projects, solving dependencies, breaking silos and growing engineers.
]
#contact(
  link("mailto:jason@vhattum.com")[jason\@vhattum.com],
  link("https://www.linkedin.com/in/jason-van-hattum-941951102/")[LinkedIn],
  link("https://github.com/Jason-vh")[GitHub],
  [Netherlands],
)

#section-heading("Work Experience")

#role(
  "Software Engineer",
  "FareHarbor",
  "May 2025 - present",
  bullets: (
    [Travelled to Hawaii to provide on-site support to clients, bridging engineering and the day-to-day reality.],
    [Proposed and introduced continuous deployment, reducing feedback loops.],
    [Drove adoption of AI-powered tooling and product features across the team.],
    [Implemented customer-facing features in collaboration with product, design, and adjacent engineering teams.],
  ),
  tech: [Python, FastAPI, TypeScript, Vue, Postgres, GitLab, OpenAI, Codex, Claude],
)

#role(
  "Staff Engineer",
  "Sendcloud",
  "Aug 2024 - Mar 2025",
  sub: "Software Engineer · Aug 2022 - Aug 2024",
  bullets: (
    [Led a 200k+ LOC migration to TypeScript across 14 teams, introducing tooling, mentoring engineers and securing stakeholder buy-in.],
    [Planned and initiated the move from Elasticsearch to InfluxDB for 10+ years of analytics data, reducing costs and centralising expertise.],
    [Designed and implemented a recommendations engine using a decade of data to help users save costs and improve satisfaction, coordinating amongst multiple feature teams and data engineers.],
    [Introduced regular backend chapter meetings, fostering collaboration among 50+ engineers and contributing to (amongst others) improvements in the ADR process, event-bus architecture, API design, and product alignment.],
    [Redesigned the frontend hiring process, creating new technical assessments and interview questions while conducting numerous interviews.],
    [Provided technical leadership for a number of projects, designing solutions, aligning stakeholders, managing dependencies and shipping code.],
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
  "Jan 2022 - Jul 2022",
  bullets: (
    [Designed and implemented features in a 200+ microservice architecture.],
  ),
  tech: [Java, PHP, JavaScript, Node, AWS, Kafka, Postgres, Vue, HTML, CSS],
)

#role(
  "Senior Software Engineer",
  "EPI-USE",
  "Mar 2021 - Dec 2021",
  bullets: (
    [Extended and maintained the component library used by over 100 engineers at MTN, Africa's largest telecom.],
  ),
  tech: [Angular, TypeScript, Docker, GitLab, Bootstrap, HTML, CSS],
)

#role(
  "Founder & Software Engineer",
  "Verbatic",
  "2019 - 2021",
  bullets: (
    [Designed and executed greenfield projects end-to-end across a diverse set of technologies while managing clients.],
  ),
  tech: [Java, Angular, C\#, Docker, Firebase, GitLab, GCP, JavaScript, MongoDB, PHP, Swift, Tailwind],
)

#role(
  "Software Engineer",
  "Compiax",
  "2016 - 2019",
  bullets: (
    [Designed and implemented projects across multiple domains and technologies.],
  ),
  tech: [Angular, Docker, Firebase, GitHub, GCP, JavaScript, MongoDB, PHP, MySQL, Tailwind],
)

#section-heading("Education")
#education-item(
  "BSc. (Hons) Computer Science",
  "University of Pretoria",
  "2015 - 2018",
)
