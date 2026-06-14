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
- [x] `projects/index.html` § 02 More projects redesigned: compact 2-column grid (1 column ≤760px) of simplified cards, each with `.card-links`
- [x] `projects/index.html` § 01 Running now: converted from full-width stacked `.live-card`s to a 2-column grid (1 column ≤760px); each card now shows both `repo →` and `live →` via `.card-links` (dropped the old single-link-card pattern and the `.live-tags` "no install / runs in browser" badges)
- [x] Removed duplication between sections: Anti-AI AI Club, Tech Digest, and Geofill (all have live demos) now live only in § 01; § 02 holds just GDP Data Pipeline (repo-only)

### Mobile nav + writing list polish (complete)

- [x] Hamburger menu replaces the overflowing 7-item nav on ≤760px — added `.nav-toggle` (animated hamburger → ×) and an opaque dropdown `.nav-links` panel anchored below the nav; `.nav` is now sticky + blurred at all widths (was desktop-only)
- [x] Toggle button + small inline script (open/close, close on link click, close on Escape) added to every page with a `<nav>`: `index.html`, `projects/index.html`, and all 4 writing posts
- [x] `#writing` list (`.writing-row`) collapses to a single column ≤760px — date and tag/language badges are hidden so the title gets the full row width

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
