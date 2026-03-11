# CV — Design & Content Guide

This document captures the design decisions and content strategy for the CV, built with [Typst](https://typst.app/).

## Compile

```bash
make pdf       # → build/Bekbulatov-Ramzan-CV.pdf
make preview   # → build/Bekbulatov-Ramzan-CV-{p}.png (200 PPI)
make watch     # live reload during editing
```

Requires `typst` (`brew install typst`). Build output is gitignored. Font files are bundled in `cv/fonts/`.

## Content Strategy

**Target audience:** Staff/Senior Staff engineering roles at AI companies (Anthropic, OpenAI, DeepMind), FAANG, trading firms, and high-growth startups.

**Positioning:** Software Engineer and Tech Lead at Meta with 11+ years of total experience across distributed systems, platform infrastructure, and technical leadership. Do NOT claim "Staff" level explicitly — let the achievements speak for themselves ("show, don't tell"). The summary should make specific architectural claims and demonstrate scope without labeling the level.

**Key differentiators to surface:**
- 0→1 platform building (Artifacto, Unlockables Platform, trading system, startup products)
- Company-wide impact (AI Codemod, engineering excellence)
- AI-applied engineering (codemod, DerpRobot, compeek) — critical for AI company applications
- Technical leadership without a manager title (backend TL, roadmap ownership, mentorship)
- Algorithmic trading experience (Centurion Capital) — relevant for trading firms

**Section order:** Summary → Work Experience → Skills & Expertise → Projects & Open Source → Education → Teaching. Experience leads because at this seniority, impact is the selling point — not a skills keyword list.

**Bullet structure:** Bullets highlight key metrics with `*bold*`, not lead-in phrases. Only the most impressive metric per bullet gets emphasis. This creates a scannable rhythm without a wall of bold text.

**Meta bullets include the "how":** Not just outcomes but architectural insights (e.g., "event-driven rendering framework with on-demand artifact generation and real-time sync", "via consolidated endpoints, smart pagination, and image caching"). This signals Staff-level systems thinking.

**CTO title:** Show team size inline — "Software Engineer → CTO · 6-person team" — to neutralize title inflation concerns. Don't repeat team size in bullets.

## Typography & Visual Design

**Font pairing:** Roboto Slab (serif) for name, section headings, role titles, and skills labels. Lato (sans) for body text. This matches the original LaTeX CV design. All fonts bundled in `cv/fonts/` with FontAwesome 6 for icons.

**Font size scale (7 tiers):**
- 32pt: Name (Roboto Slab, bold, tracked)
- 13pt: Section headings (Roboto Slab, bold, uppercase, tracked)
- 11.5pt: Tagline (Lato, medium weight)
- 10.5pt: Role titles, education title (Roboto Slab, regular — NOT bold)
- 10pt: Body text (Lato, base size)
- 9pt / 9.5pt: Secondary text — contacts, dates, skills items. Org lines at 9.5pt (slightly larger to serve as visual anchors)
- 8pt: Icons only

Avoid introducing new sizes. If something needs to stand out, use weight or color, not a new size tier.

**Bold strategy:**
- `*emphasis*` in body text renders as Lato bold + #444 fill (via `show strong` override)
- Use bold only on key metrics, not lead-in phrases
- Role titles are NOT bold (Roboto Slab regular is distinct enough)
- Org names are bold in accent-blue via `cv-org` component
- Section headings are bold (Roboto Slab)

**Icons:** FontAwesome 6 via `@preview/fontawesome:0.5.0` Typst package. OTF font files bundled. Icons render in `icon-grey` (#999) at 8pt with 2pt trailing space. Used for:
- Contact line: location, envelope, LinkedIn, GitHub, globe
- Dates: calendar icon (in `cv-event`)
- Org names: contextual icons via `cv-org` (Meta logo, briefcase, chart-line, industry, graduation-cap)

**Section headings:** Roboto Slab, bold, uppercase, letter-spacing 0.5pt, full-width dark-blue rule underneath.

**Color palette:**
- `blue` (#0F6688): section headings, heading rules, links, skills labels
- `dark-blue` (#00425C): section underline rule
- `accent-blue` (#228FBD): org names — brighter blue to visually split the wall of text
- `medium-grey` (#4D4D4F): body text
- `grey` (#6D6E71): dates, org descriptions
- `icon-grey` (#999999): all icons
- `light-grey` (#B0B3B8): bullet markers, pipe separators
- `#444444`: bold emphasis in body text

**Formatting conventions:**
- No parentheses `()` — use middle dots `·` for durations and qualifiers, em dashes `—` for inline clarifications, commas for lists
- Full month names: "August 2021" not "Aug 2021"
- Durations spelled out: "1 year 6 months" not "1y 6m"
- Links are blue (inherited from `show link`) — do NOT make non-link text blue except org names via `cv-org`

**ATS compatibility:** Single-column layout, standard section headings, real text (no images), bundled fonts. Verify with `pdftotext build/Bekbulatov-Ramzan-CV.pdf -` — check that "Software" is one word (tracking can cause text splits at high values; keep tagline tracking ≤ 0.5pt).

## Reusable Components

- `cv-section(title)` — section heading with uppercase title and full-width rule
- `cv-org(name, desc, icon: none)` — org name in accent-blue with optional FA icon and grey description
- `cv-event(role, org, dates)` — role title + org line + date with calendar icon
- `divider()` — thin grey separator between roles
- `skills-row(category, items)` — skills grid row with blue category label
- `icon(body)` — subtle grey FontAwesome icon wrapper
- `plural(n, word)` — auto-pluralization helper ("1 year" vs "4 years")

## Auto-Updating Fields

Several fields are auto-computed from `datetime.today()` at compile time — no manual updates needed:
- Total years of experience (career start: February 2015)
- Meta tenure in years and months (start: August 2021), with auto-pluralization
- CI runs monthly (1st of each month) to keep dates fresh

See the `years-since()`, `months-since()`, and `plural()` functions at the top of `main.typ`.

## Content Sources

Bullet points are grounded in Meta performance reviews (H2 2021 through Year-end 2025) and public LinkedIn profile. All metrics are from official review documentation. The CV avoids internal Meta terminology (e.g., "BE Champion" → "engineering practices", "Family of Apps" → "Meta apps", "Metaverse" → "Platform infrastructure").

## CI/CD

The GitHub Actions workflow (`../.github/workflows/deploy.yml`) compiles `main.typ` with `--font-path cv/fonts` using `typst-community/setup-typst@v4`, and outputs:
- `Bekbulatov-Ramzan-CV.pdf` — proper download filename ("B" sorts early in recruiter folders)
- `cv.pdf` — short URL (same file, copy not redirect)
- `images/cv-preview.png` — OG preview image (page 1, 150 PPI)
- `images/cv-page-{p}.png` — per-page images for mobile viewer (200 PPI)
- `_data/cv.yml` — last modified date from `git log` + page count for Jekyll

Available at:
- `rmbk.me/Bekbulatov-Ramzan-CV.pdf` — direct PDF download
- `rmbk.me/cv.pdf` — short URL
- `rmbk.me/cv` — viewer page with embedded PDF (desktop) or rendered pages (mobile)

Note: `_config.yml` excludes `cv/` (with trailing slash) so the source directory is not published, but root-level `cv.pdf` is not excluded.

## Viewer Page

`pages/cv.html` serves the CV at `rmbk.me/cv`:
- Desktop: PDF embedded via `<embed>` tag
- Mobile: all pages rendered as images (auto-discovered via `site.data.cv.pages` from `_data/cv.yml`), with "Download PDF" button
- OG tags with auto-computed years via Jekyll Liquid
- "Updated March 2026" from `site.data.cv.last_modified`
- Header: `← rmbk.me` left, download + updated date right. No redundant title.
