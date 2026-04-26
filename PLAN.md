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

- **HTML + Tailwind CSS** (plain, no framework yet)
- **Hosting:** Cloudflare Pages
- **Repo:** GitHub (private or public, decide later)
- **Domain:** none yet — start with the free `.pages.dev` subdomain. Add a custom domain later.
- **Analytics:** Cloudflare Web Analytics (free, built-in, toggle on after deploy)

If the site ever needs more than static HTML, migrate to Astro. Don't migrate preemptively.

## Phases

### Phase 1 — Build landing page locally

- [ ] Set up project folder with `index.html`, Tailwind via CDN (or a simple build if needed)
- [ ] Single landing page with:
  - [ ] Short intro / hero section
  - [ ] Navigation header (links/icons for project sections — Blog, Games, etc.)
  - [ ] Project cards or sections that link out to the actual projects
  - [ ] Footer with contact / social links
- [ ] SEO basics from day one:
  - [ ] `<title>` and `<meta name="description">`
  - [ ] Open Graph tags (`og:title`, `og:description`, `og:image`, `og:url`)
  - [ ] Twitter card tags
  - [ ] Favicon (use a generator for multiple sizes)
  - [ ] `robots.txt`
  - [ ] `sitemap.xml` *(created with placeholder URL in Phase 1 — update `<loc>` values in Phase 3 once the Cloudflare `.pages.dev` URL is known)*
  - [ ] Semantic HTML (`<header>`, `<nav>`, `<main>`, `<footer>`, real `<h1>`)
  - [ ] `lang` attribute on `<html>`
- [ ] Responsive (mobile + desktop)
- [ ] Test locally

### Phase 2 — Push to GitHub

- [ ] Create new GitHub repo
- [ ] Commit and push the site
- [ ] Add a basic `README.md` describing the project

### Phase 3 — Deploy to Cloudflare Pages

- [ ] Create Cloudflare account (free)
- [ ] In Cloudflare dashboard: Pages → Connect to Git → select the repo
- [ ] Configure build settings (for plain HTML: build command empty, output directory = root or `/dist`)
- [ ] Deploy → get a `something.pages.dev` URL
- [ ] Verify everything works on the live URL

### Phase 4 — Analytics

- [ ] In Cloudflare Pages settings, enable Web Analytics for the project
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
- Whether to add a blog/digest directly on the site or keep linking out
- Whether projects should eventually move to subdomains (`geofill.mysite.fi`) for cleaner URLs
- Design system: shared visual language across projects, or let each project drift?
- **Language switch:** Add Finnish/English toggle so the site can serve both languages. Decided site starts English-only; Finnish version is a future addition.

## Things to avoid

- Don't add a CMS. Markdown files are fine.
- Don't pick a framework before you need one.
- Don't worry about the domain to ship Phase 1.
- Don't set up newsletters, contact forms, or backend stuff yet — the site is static for a reason.

## Notes for Claude Code

- The voice on the site (any written copy) should be plain everyday language. No filler, no marketing speak.
- Design will be handled separately via Claude Design — don't over-style with arbitrary choices in code.
- Keep the file structure flat and obvious. One person maintains this; it should be readable in 30 seconds.
