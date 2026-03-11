// CV — Ramzan Bekbulatov
// Single-column, ATS-optimized, 2 pages
// Compile: make pdf (or: typst compile main.typ Bekbulatov-Ramzan-CV.pdf)
// Live:    make watch
// Preview: make preview (PNG at 200 PPI)
// Served at: rmbk.me/Bekbulatov-Ramzan-CV.pdf (rmbk.me/cv.pdf redirects here)
// See cv/CLAUDE.md for design rationale and content strategy.

// ─── Auto-computed dates ─────────────────────────────────────
// These update automatically at compile time — no manual edits needed.
#let today = datetime.today()
#let years-since(year, month) = calc.floor((today.year() - year) + (today.month() - month) / 12)
#let total-years = years-since(2015, 2)   // career start: Feb 2015
#let meta-years = years-since(2021, 8)    // Meta start: Aug 2021

// ─── Colors ──────────────────────────────────────────────────
// Blue palette matched to the website (rmbk.me) accent colors.
#let blue = rgb("#0F6688")
#let dark-blue = rgb("#00425C")
#let grey = rgb("#6D6E71")
#let medium-grey = rgb("#4D4D4F")
#let light-grey = rgb("#B0B3B8")

// ─── Page setup ──────────────────────────────────────────────
#set page(paper: "a4", margin: (left: 1.5cm, right: 1.5cm, top: 1.3cm, bottom: 1.3cm))
#set text(font: "Avenir Next", size: 10pt, fill: medium-grey)
#set par(leading: 0.5em, spacing: 0.6em)
#set list(marker: text(size: 0.7em, fill: light-grey)[•], indent: 0pt, body-indent: 0.5em, spacing: 0.5em)
#show link: set text(fill: blue)
// Bold in body text uses medium weight + darker color for subtle emphasis.
// Role titles and section headings keep full bold via explicit weight: "bold".
#show strong: it => text(weight: "medium", fill: rgb("#333333"))[#it.body]

// ─── Reusable components ────────────────────────────────────
// Section heading: uppercase, tracked, with short accent underline (~3em).
#let cv-section(title) = {
  v(0.7em)
  text(size: 13pt, weight: "bold", fill: blue, tracking: 0.5pt)[#upper(title)]
  v(1pt)
  line(length: 3em, stroke: 1.5pt + blue)
  v(0.3em)
}

// Job entry: bold role on left, light date on right, org line below.
#let cv-event(role, org, dates) = {
  grid(
    columns: (1fr, auto),
    gutter: 4pt,
    text(weight: "bold", size: 10.5pt, fill: medium-grey)[#role],
    align(right, text(size: 9pt, fill: light-grey, weight: "regular")[#dates]),
  )
  v(-0.15em)
  text(size: 9.5pt, fill: grey)[#org]
  v(0.15em)
}

// Thin separator between roles.
#let divider() = {
  v(0.3em)
  line(length: 100%, stroke: 0.3pt + grey.lighten(70%))
  v(0.3em)
}

// Skills grid row: uppercase blue category label + comma-separated items.
#let skills-row(category, items) = {
  grid(
    columns: (7em, 1fr),
    column-gutter: 8pt,
    text(weight: "bold", size: 9pt, fill: blue, tracking: 0.3pt)[#upper(category)],
    text(size: 9.5pt, fill: medium-grey)[#items],
  )
}

// ─── Header ──────────────────────────────────────────────────
#align(center)[
  #text(size: 32pt, weight: "bold", tracking: 2pt)[Ramzan Bekbulatov]
  #v(0pt)
  #text(size: 11.5pt, fill: blue, weight: "medium", tracking: 1pt)[Software Engineer · Tech Lead]
  #v(5pt)
  #text(size: 8.5pt, fill: grey)[
    London, UK
    #h(8pt) #text(fill: light-grey)[|] #h(8pt)
    #link("mailto:ramzan.bekbulatov@pm.me")[ramzan.bekbulatov\@pm.me]
    #h(8pt) #text(fill: light-grey)[|] #h(8pt)
    #link("https://linkedin.com/in/rmbk")[linkedin.com/in/rmbk]
    #h(8pt) #text(fill: light-grey)[|] #h(8pt)
    #link("https://github.com/uburuntu")[github.com/uburuntu]
    #h(8pt) #text(fill: light-grey)[|] #h(8pt)
    #link("https://rmbk.me")[rmbk.me]
  ]
]

#v(0.2em)

// ─── Summary ─────────────────────────────────────────────────
// Keep to 3–4 lines. Lead with years + domain, then 2 concrete achievements, then leadership.
#cv-section("Summary")

Software Engineer and Tech Lead with *#total-years+ years of experience* in distributed systems and platform infrastructure, including #meta-years+ years at Meta. Designed and built *0→1 platform solutions* adopted across organizations — from a real-time avatar rendering framework delivering 1B+ daily artifacts to *AI-powered code modernization tools* deployed company-wide. Led backend teams through multiple re-orgs, mentored engineers to promotions, and influenced technical roadmaps across 3+ organizations.

// ─── Work Experience ─────────────────────────────────────────
// Each bullet: bold lead-in phrase + one bold metric. Grounded in perf review data.
#cv-section("Work Experience")

#cv-event(
  "Software Engineer, Tech Lead",
  [#link("https://meta.com/")[Meta] — Avatars infrastructure across Messenger, Instagram, Facebook, WhatsApp],
  "Aug 2021 — Present",
)

#list(
  [*Built Artifacto from scratch* — a reusable framework for on-demand avatar artifact rendering on Messenger. Presented to VP of Engineering to secure buy-in. Delivers *1B+ daily artifacts* and saves 2–3 weeks of engineering effort per new use-case],

  [*Unified 4 fragmented APIs* (Facebook, Instagram, Messenger, Bloks) into the Unlockables Platform, replacing scattered implementations. Achieved *90% p50 latency improvement* (sub-500ms vs 2.5s legacy), powers 8+ clients across Meta apps],

  [*Built an AI-powered codemod* to address 11K+ silent exception catches masking reliability issues across the entire codebase. Adopted company-wide and continuously running, *7K+ issues resolved* to date],

  [*Sole backend DRI for Avatar Style 2.0 launch* (7M Avatar DAU). Maintained the entire avatar backend when the team contracted from *4 engineers to 1*, delivering a Company priority on time],

  [*\#1 code reviewer year over year* (2,500+ reviews with substantive comments), using reviews as a coaching tool to teach architectural patterns and best practices. Authored 50+ wiki pages and team code standards],

  [*Mentored 8+ engineers* (IC4–IC5) and conducted 60+ hiring interviews. Re-organized engineering practices, lifting satisfaction from *24% to 82%* in team surveys. Drove roadmap planning across 3+ organizations, aligning partner teams on architectural direction],
)

#divider()

#cv-event(
  "Software Engineer, Independent Consultant",
  "Self-Employed — key engagements",
  "Mar 2020 — Aug 2021 (1y 6m)",
)

#list(
  [*bhyve.cloud* — Built a Kubernetes cluster management platform from scratch, from architecture to production, with automated billing and provisioning workflows. Enabled the startup to acquire its first paying customers],
  [*#link("https://l-charge.net/")[l-charge.net]* — Built full-stack platform with integrated CRM, enabling an EV charging startup's market entry and securing first hundreds of paying customers],
)

#divider()

#cv-event(
  "Software Engineer → CTO",
  "Centurion Capital — algorithmic trading",
  "Oct 2018 — Mar 2020 (1y 6m)",
)

#list(
  [*Promoted to CTO* — built a team of 6 engineers from scratch, owning all technical strategy and architecture decisions],
  [*Built the entire trading platform from zero* — real-time data pipeline processing terabytes per day, ML-driven trading engine, and fault-tolerant Kubernetes-based microservices (*14 services*) with 24/7 uptime],
)

#divider()

#cv-event(
  "Software Engineer",
  [#link("https://rfdyn.com/")[Rock Flow Dynamics] — petroleum industry simulation software],
  "Feb 2015 — Oct 2018 (3y 9m)",
)

#list(
  [*Architected Python API framework* embedded in C++ simulation engine, enabling domain experts to build custom workflows],
  [*Achieved 3x performance gains* via Jacobian matrix restructuring, cutting computation from *16 to 5 hours*],
  [*Led asphaltene modeling* implementation for two tier-1 clients, expanding commercial opportunities],
)

// ─── Skills & Expertise ──────────────────────────────────────
// Centralized keywords for ATS. No per-role tags — looks more senior.
#cv-section("Skills & Expertise")

#skills-row("Systems", "Distributed Systems, System Design, Event-Driven Architecture, Platform Engineering, Reliability")
#v(0.15em)
#skills-row("Languages", "Python, Hack/PHP, C++, TypeScript, SQL")
#v(0.15em)
#skills-row("Infrastructure", "Kafka, Redis, PostgreSQL, ClickHouse, Kubernetes, Docker, GraphQL")
#v(0.15em)
#skills-row("AI", "Gemini API, Claude API, OpenAI API, OpenRouter, AI-powered code modernization at scale")
#v(0.15em)
#skills-row("Leadership", "Technical roadmapping, cross-org alignment, mentorship, hiring")

// ─── Projects & Open Source ──────────────────────────────────
// Lead with AI-relevant projects (targeting AI companies).
#cv-section("Projects & Open Source")

#list(
  [*#link("https://github.com/uburuntu/compeek")[compeek]* — AI desktop automation agent that enables Claude to control any desktop app through a browser interface. Built for the Anthropic Claude Code Hackathon (Feb 2026). TypeScript, Docker. #link("https://compeek.rmbk.me")[(live)]],

  [*#link("https://github.com/uburuntu/derp")[DerpRobot]* — AI-powered Telegram bot with *60K+ users*. Web search, image/video/audio generation via Gemini API. Python, PostgreSQL, Docker],

  [*#link("https://github.com/uburuntu/throttler")[throttler]* — Zero-dependency Python rate-limiting library. 105 stars, *386 PyPI dependents*. Async-first design for production workloads],
)

// ─── Education ───────────────────────────────────────────────
#cv-section("Education")

#grid(
  columns: (1fr),
  text(weight: "bold", size: 10.5pt, fill: medium-grey)[Mechanics and Mathematics — Computational Mathematics],
)
#v(-0.1em)
#text(size: 9.5pt, fill: grey)[Lomonosov Moscow State University — Russia's top-ranked university (\#1 nationally)]

// ─── Teaching ────────────────────────────────────────────────
#cv-section("Teaching")

#cv-event(
  "Python Course Instructor",
  "Lomonosov Moscow State University",
  "Jan — Jun 2019",
)

Delivered the official Python programming #link("https://rmbk.me/mm_python/")[curriculum] at Russia's top research university. Guided 26 students to course completion with emphasis on practical software engineering.
