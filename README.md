# Niklas Savonheimo – Personal Site

Static portfolio site. Hosted on Cloudflare Pages at `https://portfolio-site-5bt.pages.dev/`.

## Local development

**No build step required.** Open `index.html` directly in a browser (`file://`). Fonts load from Google Fonts.

`style.css` is pure hand-authored custom CSS — no Tailwind utilities.

## File structure

```
index.html              main page — hero → now strip → about → selected work → writing → shelf → footer
style.css               custom CSS with OKLCH design tokens (committed directly, no build)
live/
  └─ index.html         Projects page — live demos (§ 01) + the rest of the repos (§ 02)
writing/                writing post pages — one HTML file per post (bilingual = separate files + hreflang)
  ├─ the-tool-moves-faster-than-i-do.html    English, April 2026
  └─ verktyget-ror-sig-snabbare-an-jag.html  Swedish, April 2026
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
| `#work` | § 02 Selected work — project cards |
| `#writing` | § 03 Writing — article list with EN/SV toggle |
| `#stack` | § 04 The shelf — tools & stack |
| `#contact` | Footer — CTA, email, socials, CV |

## Adding content

### Link convention

- **`#work` cards (front page)** → `.card-links` row with a GitHub repo link (`repo →`) and, where one exists, a live demo link (`live →`)
- **`live/index.html` § 01 Running now** → whole `.live-card` links to the deployed/live URL (GitHub Pages, Render, etc.)
- **`live/index.html` § 02 More projects** → whole `.card` links to the GitHub repo URL

### New project card

- **`#work` (front page picks):** duplicate a `<div class="card">` block. No arrow span on `h3`. Body ends with a `.card-links` row (`repo →` and, optionally, `live →`).
- **`live/index.html` § 02 More projects:** duplicate an `<a class="card" href="...github repo...">` block — single click-through, `h3` keeps its arrow span, no `.card-links`.

Both variants: update `card-thumb-marker`, `card-thumb-label`, `card-meta`, `h3`, `card-blurb`. For a screenshot thumbnail replace the stripes div with `<img class="card-thumb-img">` + `<div class="card-thumb-scrim">`. Update the `sec-sub` count and `sec-lede` if needed.

### New live demo card (`live/index.html` § 01 Running now)

Duplicate an `<a class="live-card">` block. Update `href`, `live-meta`, `h3`, `live-blurb`, `live-tags`. Update `sec-sub` count. For a screenshot thumbnail replace the stripes div with `<img src="../img/your-image.jpg" alt="">`. If the project also has a repo, add a card for it in § 02 More projects too.

### New writing post

1. Duplicate `writing/verktyget-ror-sig-snabbare-an-jag.html`, rename with a slug
2. Update `<title>`, `<meta name="description">`, `og:url`, `og:title`, `og:description`, and `lang` in `<head>`
3. Update the `post-eyebrow` date and tag, and `post-title`
4. Replace body paragraphs in `.post-body.prose`
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

## Stack

- HTML + custom CSS (OKLCH, variable fonts: Fraunces, IBM Plex Sans/Mono)
- Minimal inline JS (Helsinki clock, GitHub API last-push, Konami easter egg, EN/SV writing toggle — no dependencies)
- Hosting: Cloudflare Pages (auto-deploys on push to `main`)
- Fonts: Google Fonts (Fraunces variable + IBM Plex family)
