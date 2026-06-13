# Niklas Savonheimo – Personal Site

Static portfolio site. Hosted on Cloudflare Pages at `https://portfolio-site-5bt.pages.dev/`.

## Local development

**No build step required.** Open `index.html` directly in a browser (`file://`). Fonts load from Google Fonts.

`style.css` is pure hand-authored custom CSS — no Tailwind utilities.

## File structure

```
index.html              main page — hero → now strip → about → shelf → selected work → writing → footer
style.css               custom CSS with OKLCH design tokens (committed directly, no build)
live/
  └─ index.html         Projects page — § 01 Running now (live demos, 2-col grid, repo+live links), § 02 More projects (repo-only cards)
writing/                writing post pages — one HTML file per post (bilingual = separate files + hreflang)
  ├─ maybe-this-was-the-most-open-era-of-ai.html       English, June 2026
  ├─ kanske-var-det-har-den-oppnaste-tiden-for-ai.html Swedish, June 2026
  ├─ the-tool-moves-faster-than-i-do.html              English, April 2026
  └─ verktyget-ror-sig-snabbare-an-jag.html            Swedish, April 2026
img/                    thumbnails shared by project cards and live cards
  ├─ AntiAI-AIClub-form.png
  ├─ tech-digest-cover.png
  ├─ geofill-img.jpg
  ├─ gdp-data-pipeline-img.jpg
  ├─ smartcharge-output.png
  └─ finance_fun_request_lifecycle.svg
og.png                  1200×630px Open Graph / Twitter card image
cv.docx                 downloadable CV (linked from nav, footer, about section; disallowed in robots.txt)
favicon.svg             logo mark
robots.txt              allow all crawlers; points to real sitemap URL
sitemap.xml             covers homepage, live page, and all writing posts
```

## Pages

| URL | Description |
|---|---|
| `/` | Landing page — hero, about, selected work, writing, shelf, contact |
| `/live/` | Projects page — live demos plus the rest of the repos |
| `/writing/*.html` | Individual writing posts |

### Landing page sections

| Anchor | Section |
|---|---|
| `#top` | Hero — name, tagline |
| `#about` | § 01 About — prose, meta, CV + links |
| `#stack` | § 02 The shelf — tools & stack |
| `#work` | § 03 Selected work — project cards |
| `#writing` | § 04 Writing — article list with EN/SV toggle |
| `#contact` | Footer — CTA, email, socials, CV |

## Adding content

### Link convention

- **`#work` cards (front page)** → `.card-links` row with a GitHub repo link (`repo →`) and, where one exists, a live demo link (`live →`)
- **`live/index.html` § 01 Running now** → `.card-links` row with `repo →` and `live →` (to the deployed URL, e.g. GitHub Pages, Render)
- **`live/index.html` § 02 More projects** → repo-only projects (no live demo); `.card-links` row with just `repo →`

### New project card

- **`#work` (front page picks):** duplicate a `<div class="card">` block inside `.projects-grid`. No arrow span on `h3`. Body ends with a `.card-links` row (`repo →` and, optionally, `live →`).
- **`live/index.html` § 02 More projects:** repo-only projects with no live demo — duplicate a `<div class="card">` block inside `.projects-grid.more-projects-grid` (2-column grid, 1 column ≤760px). No arrow span on `h3`. Body ends with a `.card-links` row containing just `repo →`. If the project later gets a live demo, move it to § 01 Running now instead and remove it from here.

Both variants: update `card-meta`, `h3`, `card-blurb`, and the thumbnail marker. See `CLAUDE.md` for the full two-tier thumbnail system (`.projects-grid` uses scrim + label; `.more-projects-grid` uses a simplified marker-only thumb). Update the `sec-sub` count and `sec-lede` if needed.

### New live demo card (`live/index.html` § 01 Running now)

Duplicate a `<div class="live-card">` block inside `.live-grid` (2-column grid, 1 column ≤760px). Update `live-thumb` image/marker, `live-meta`, `h3`, `live-blurb`, and the `.card-links` row (`repo →` always, `live →` to the deployed URL). Update `sec-sub` count. For a screenshot thumbnail replace the stripes div with `<img src="../img/your-image.jpg" alt="">`. A project with a live demo lives only in § 01 — don't also add it to § 02 More projects.

### New writing post

1. Duplicate `writing/verktyget-ror-sig-snabbare-an-jag.html`, rename with a slug
2. Update `<title>`, `<meta name="description">`, `og:url`, `og:title`, `og:description`, and `lang` in `<head>`
3. Update the `post-eyebrow` date and tag, and `post-title`
4. Replace body paragraphs in `.post-body.prose`; for longer posts, split into sections with plain `<h2>` (styled via `.prose h2`)
5. Add a matching `<a class="writing-row" data-lang="EN">` in `index.html` — `data-lang` (uppercase) drives the EN/SV toggle; include `.row-tags` with `.tag` (topic) and `.lang` (language) badges
6. Add the URL to `sitemap.xml`
7. If it's a translation of an existing post: add `hreflang` `<link>` tags in `<head>` of both files

### Now strip (4 cells in `index.html`)

| Cell | Type | How to edit |
|---|---|---|
| Helsinki | Live clock (JS) | Don't touch |
| Status | Static text | Edit `.val` span directly |
| Building | Static text | Edit `.val` span directly |
| Last push | Live — GitHub API | JS in inline `<script>` at bottom of `index.html` |

## Outstanding items

- **Cloudflare Web Analytics** — enable in Cloudflare dashboard (Pages → project → Web Analytics)
- **Custom domain** — Phase 5 in `PLAN.md`, optional

## Stack

- HTML + custom CSS (OKLCH, variable fonts: Fraunces, IBM Plex Sans/Mono)
- Minimal inline JS (Helsinki clock, GitHub API last-push, Konami easter egg, EN/SV writing toggle, mobile nav hamburger toggle — no dependencies)
- Hosting: Cloudflare Pages (auto-deploys on push to `main`)
- Fonts: Google Fonts (Fraunces variable + IBM Plex family)
