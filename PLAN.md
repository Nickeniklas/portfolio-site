# Personal Site — Build Plan

A single landing page that grows over time. Loose coupling: the landing page links out to separate projects (each hosted on its own, e.g. GitHub Pages for now).

## Goals

- One central place that represents me online
- Showcase projects (Tech Digest under "Blog", Geofill under "Games", etc.)
- Easy to grow — adding a new project = adding a new link/card
- Not over-engineered: static site, fast, cheap, simple
- Looks good (Claude Design will handle visuals)

## Architecture decision

**Loose coupling.** The landing page is a static site that links out to separate project URLs. Each project keeps its own deploy, repo, and stack. No monorepo, no shared build pipeline.

- Landing page = hub
- Projects = independent satellites
- When a project URL changes, update one link

## Stack

- **HTML + custom CSS** (plain, no framework)
- **Hosting:** Cloudflare Pages
- **Repo:** GitHub (public — `github.com/Nickeniklas/portfolio-site`)
- **Domain:** none yet — start with the free `.pages.dev` subdomain. Add a custom domain later.
- **Analytics:** Cloudflare Web Analytics (free, built-in, toggle on after deploy)

If the site ever needs more than static HTML, migrate to Astro. Don't migrate preemptively.

## Phases

### Phase 1 — Build landing page locally

- [x] Set up project folder with `index.html`
- [x] Single landing page with:
  - [x] Short intro / hero section
  - [x] Navigation header (links/icons for project sections — Blog, Games, Contact)
  - [x] Project cards linking out to Tech Digest and Geofill
  - [x] Footer with GitHub, email, LinkedIn
- [x] SEO basics from day one:
  - [x] `<title>` and `<meta name="description">`
  - [x] Open Graph tags (`og:title`, `og:description`, `og:image`, `og:url`)
  - [x] Twitter card tags
  - [x] Favicon — `favicon.svg` (SVG, modern browsers; raster sizes deferred until design)
  - [x] `robots.txt`
  - [x] `sitemap.xml` *(placeholder URL — update `<loc>` values in Phase 3 once Cloudflare `.pages.dev` URL is known)*
  - [x] Semantic HTML (`<header>`, `<nav>`, `<main>`, `<footer>`, real `<h1>`)
  - [x] `lang` attribute on `<html>`
- [x] Responsive (mobile + desktop)
- [x] Tested locally (opened in browser)

### Phase 2 — Push to GitHub

- [x] Create new GitHub repo
- [x] Commit and push the site
- [x] Add a basic `README.md` describing the project

### Design v0.1 — Visual redesign (complete)

- [x] Full redesign via Claude Design export (forest-study / reading-room aesthetic)
- [x] Implemented in plain HTML + custom CSS (OKLCH tokens, no Tailwind utilities)
- [x] Type: Fraunces variable (slab serif) + IBM Plex Sans/Mono
- [x] Live Helsinki clock (Intl.DateTimeFormat, Europe/Helsinki)
- [x] Hidden keyboard easter egg
- [x] Responsive (single breakpoint 760px)
- [x] Reduced-motion support

### Phase 3 — Deploy to Cloudflare Pages (complete)

- [x] Create Cloudflare account (free)
- [x] In Cloudflare dashboard: Pages → Connect to Git → select the repo
- [x] Configure build settings (for plain HTML: build command empty, output directory = root)
- [x] Deploy → live at `https://portfolio-site-5bt.pages.dev/`
- [x] Verify everything works on the live URL
- [x] Replace `placeholder.pages.dev` in `sitemap.xml`, `robots.txt`, and `og:url` in `index.html`
- [x] Writing post infrastructure: `writing/` directory, first post published
- [x] `projects/` sub-page added — separate page for web apps/sites you can open and try; linked from nav and from a footnote below `#work`; 3 cards (Geofill, Anti-AI AI Club, Tech Digest); `sitemap.xml` updated *(superseded — see "Site restructure" below: `projects/` is now a "Projects" page with 4 live cards + 4 more-projects cards, and `#work` is trimmed to 2 picks)*

### Site restructure — About-first layout, CV, Projects page (complete)

- [x] Reordered landing page: About now leads (§ 01), followed by Selected work (§ 02), Writing (§ 03), The shelf (§ 04) *(superseded — see "Projects page reorg" below for the current order)*
- [x] Rewrote About prose (Professio praktik, broad degree, data focus); updated Status to "Open for work · September 2026"
- [x] Added CV download (`cv.docx`) — button in `#about`, plus links in nav and footer; disallowed in `robots.txt`
- [x] `#work` trimmed to two highlighted picks (Finance Fun, Smart Charge), each with explicit `repo →` / `live →` links via new `.card-links`
- [x] `projects/` expanded into a "Projects" page: § 01 Running now (live demos, unchanged) + § 02 More projects (the four cards moved off the front page — Anti-AI AI Club, Tech Digest, Geofill, GDP Data Pipeline) *(superseded — see "Projects page reorg" below)*
- [x] Nav updated across both pages: `about, work, writing, projects, stack, contact, cv` *(superseded — see "Projects page reorg" below for the current nav order)*

### Projects page reorg — link visibility, live-card grid, link consolidation (complete)

- [x] Front-page section order changed to: About (§ 01) → The shelf (§ 02) → Selected work (§ 03) → Writing (§ 04); nav reordered to `about, stack, work, writing, projects, contact, cv` on both pages
- [x] `.card-links` (`repo →` / `live →`) restyled as bordered pill chips that fill green on hover, used consistently across `#work`, `projects/index.html` § 01, and § 02
- [x] `projects/index.html` § 02 More projects redesigned: compact 2-column grid (1 column ≤760px) of simplified cards, each with `.card-links` *(superseded — see "Projects page rename + expansion" below: now 3 columns)*
- [x] `projects/index.html` § 01 Running now: converted from full-width stacked `.live-card`s to a 2-column grid (1 column ≤760px); each card now shows both `repo →` and `live →` via `.card-links` (dropped the old single-link-card pattern and the `.live-tags` "no install / runs in browser" badges)
- [x] Removed duplication between sections: Anti-AI AI Club, Tech Digest, and Geofill (all have live demos) now live only in § 01; § 02 holds just GDP Data Pipeline (repo-only)

### Mobile nav + writing list polish (complete)

- [x] Hamburger menu replaces the overflowing 7-item nav on ≤760px — added `.nav-toggle` (animated hamburger → ×) and an opaque dropdown `.nav-links` panel anchored below the nav; `.nav` is now sticky + blurred at all widths (was desktop-only)
- [x] Toggle button + small inline script (open/close, close on link click, close on Escape) added to every page with a `<nav>`: `index.html`, `projects/index.html`, and all 4 writing posts
- [x] `#writing` list (`.writing-row`) collapses to a single column ≤760px — date and tag/language badges are hidden so the title gets the full row width

### Projects page rename + expansion (complete)

- [x] `live/` directory renamed to `projects/` (`git mv`); updated nav/footer links, `og:url`, `sitemap.xml`, `style.css` comments, and all path references across `CLAUDE.md`, `README.md`, `PLAN.md`. `.live-*` CSS classes and "live →"/"Live URL"/"Live clock" wording left as-is — those describe the live-demo concept, not the folder.
- [x] Geofill's `live-thumb-marker` changed from "live" to "game" (matches its `live-meta` category; all four § 01 cards are live, so "live" was redundant)
- [x] `.more-projects-grid` (§ 02) expanded from 2 to 3 columns on desktop, with a new ≤980px breakpoint stepping down to 2 columns before the existing ≤760px single-column breakpoint
- [x] § 02 grew from 1 card to 11: Smart Charge (also on front page `#work`), plus 9 new repos — Car Hybrid Recommender, Finnish Fuel Price EDA, Knapsack Algorithms Comparison, Stockdata Analytical System, Streamlit FinData Explorer, NHL Stats App, Tracklock Scraper, Atari Assault RL, Browser Startpage. NHL Stats App ordered ahead of Finnish Fuel Price EDA. `sec-sub` updated to "11 projects"
- [x] Tracklock Scraper's thumbnail marker changed from "broken" to "scraper"; the blurb still notes it's currently broken
- [x] All 11 § 02 cards now have real screenshot thumbnails in `img/` (named `<project>-thumbnail.{png,jpg}`) — `object-position:center top` used where the header/title sits at the top of a taller-than-16/9 image (Stockdata Analytical System, Streamlit FinData Explorer); `object-fit:contain` used for Atari Assault RL's single-line code screenshot (much wider/shorter than 16/9)

### Projects page hero + about footnote (complete)

- [x] Replaced `img/AntiAI-AIClub-form.png` with an updated screenshot (same filename, no markup changes needed — checked the new 1178×501 image against `.live-thumb`'s 16/6 box, crop is negligible)
- [x] Added a `.work-footnote` link ("see what I've been building →" → `projects/`) at the end of the About prose in `index.html`, reusing the same class as the `#work` section's "see all projects →" footnote. Used a `<div>` instead of `<p>` to avoid `.prose p + p`'s text-indent/margin rules
- [x] `projects/index.html` hero rewritten: h1 "Everything I've built" → "What I've been building"; the all-caps `.hero-lede` ("Live demos you can open and try right now, plus the rest of the code") removed entirely
- [x] Added `.hero-compact` modifier (in `style.css`, applied only to `projects/index.html`'s `<header class="hero hero-compact">`) — shrinks h1 and hero padding so the first row of live cards is visible on a 1920×1080 screen without scrolling. Homepage hero (`index.html`) is unaffected
- [x] `.live-thumb` aspect ratio reduced from 16/7 to 16/6 (slightly shorter live-card thumbnails, part of the same fit-on-screen pass)
- [x] § 02 `sec-lede` shortened: "More repos — code only, no live demos yet." → "With links to the repos."

### Phase 4 — Analytics

- [ ] In Cloudflare dashboard, enable Web Analytics for the Pages project
- [ ] Confirm it's tracking visits

### Phase 5 — Custom domain (later, optional)

- [ ] Decide on a name (sit with it for a day)
- [ ] Buy domain
  - For `.fi`: Finnish registrar (Louhi, Domainkeskus). Then point DNS at Cloudflare.
  - For `.com`/`.dev`/`.me`: buy directly from Cloudflare Registrar (no markup)
- [ ] Add custom domain in Cloudflare Pages settings
- [ ] Wait for DNS propagation, verify HTTPS works

## Open questions to revisit later

- Domain name choice
- Writing posts live as static HTML files in `writing/` — simple, no CMS. Works until volume gets unwieldy (20+ posts). Revisit then.
- Whether projects should eventually move to subdomains (`geofill.mysite.fi`) for cleaner URLs
- Design system: shared visual language across projects, or let each project drift?
- **Language switch:** Add Finnish/English toggle so the site can serve both languages. Decided site starts English-only; Finnish version is a future addition. Note: writing posts may be in Swedish — that's fine, `lang` attribute set per page.

## Things to avoid

- Don't add a CMS. Markdown files are fine.
- Don't pick a framework before you need one.
- Don't worry about the domain to ship Phase 1.
- Don't set up newsletters, contact forms, or backend stuff yet — the site is static for a reason.

## Notes for Claude Code

- The voice on the site (any written copy) should be plain everyday language. No filler, no marketing speak.
- Design will be handled separately via Claude Design — don't over-style with arbitrary choices in code.
- Keep the file structure flat and obvious. One person maintains this; it should be readable in 30 seconds.
