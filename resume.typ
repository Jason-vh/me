// Compile with: typst compile --font-path fonts resume.typ jason-van-hattum.pdf

#let accent = rgb("#e8552b")
#let ink = rgb("#1a1714")
#let rule = rgb("#bbbbbb")

#set document(
  title: "Jason van Hattum - Resume",
  author: "Jason van Hattum",
)

#set page(
  paper: "a4",
  margin: (top: 18mm, bottom: 18mm, left: 20mm, right: 20mm),
)

#set text(
  font: "Inter",
  size: 11pt,
  fill: ink,
  lang: "en",
)

#set par(leading: 0.6em, justify: false)

#let bullet-mark = text(fill: ink, size: 9pt)[❖]

#let title(name) = {
  align(center)[
    #text(font: "Inter", size: 20pt, weight: "bold", fill: accent)[#name]
  ]
  v(2mm)
}

#let intro(body) = {
  block(below: 6mm)[#body]
}

#let section-heading(label) = {
  v(3mm)
  align(center)[
    #text(font: "Inter", size: 14pt, weight: "bold", fill: accent)[#label]
  ]
  v(2mm)
}

#let role(titles, company, dates, bullets: (), tech: none) = {
  // titles and dates can be a string OR an array (for stacked rows like Sendcloud)
  let title-content = if type(titles) == array {
    stack(spacing: 1mm, ..titles.map(t => text(weight: "bold", size: 11pt)[#t]))
  } else {
    text(weight: "bold", size: 11pt)[#titles]
  }
  let date-content = if type(dates) == array {
    stack(spacing: 1mm, ..dates.map(d => text(style: "italic", size: 10pt)[#d]))
  } else {
    text(style: "italic", size: 10pt)[#dates]
  }

  block(breakable: false)[
    #grid(
      columns: (1fr, 1fr, 1fr),
      align: (left + horizon, center + horizon, right + horizon),
      title-content,
      text(weight: "bold", size: 11pt)[#company],
      date-content,
    )
    #v(1.5mm, weak: true)
    #line(length: 100%, stroke: 0.5pt + rule)
    #v(2mm, weak: true)
    #for b in bullets [
      #grid(
        columns: (5mm, 1fr),
        align: (left + top, left + top),
        [#v(0.1em) #bullet-mark],
        [#b],
      )
      #v(1mm, weak: true)
    ]
    #if tech != none [
      #v(2.5mm)
      #par[*Tools & technologies*: #tech]
    ]
  ]
  v(5mm)
}

#let education-item(body) = {
  grid(
    columns: (5mm, 1fr),
    align: (left + top, left + top),
    [#v(0.1em) #bullet-mark],
    [#body],
  )
}

// ---------- content ----------

#title("Jason van Hattum")

#intro[
  Hi! I'm a highly motivated, outcome-driven engineer with a healthy balance of soft skills and full-stack development. I have experience leading and driving large, cross-team projects, solving dependencies, breaking silos and growing engineers.
]

#section-heading("Work Experience")

#role(
  ("Staff Engineer", "Software Engineer"),
  "Sendcloud",
  ("Aug 2024 - present", "Aug 2022 - Aug 2024"),
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
  tech: [Java, Angular, C\#, Docker, Firebase, Gitlab, GCP, JavaScript, MongoDB, PHP, Swift, Tailwind],
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
#education-item[BSc. (Hons) Computer Science, University of Pretoria, 2015 - 2018]
