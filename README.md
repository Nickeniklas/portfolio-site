# Niklas Savonheimo – Personal Site

Static portfolio landing page. Links out to separate projects. Hosted on Cloudflare Pages at `https://portfolio-site-5bt.pages.dev/`.

## Local development

**No build step required.** Open `index.html` directly in a browser (`file://`). Fonts load from Google Fonts.

`style.css` is pure hand-authored custom CSS — no Tailwind utilities.

## File structure

```
index.html              main page (all sections: hero, work, writing, shelf, about, footer)
style.css               custom CSS with OKLCH design tokens (committed directly, no build)
writing/                writing post pages — one HTML file per post (bilingual = separate files + hreflang)
  ├─ the-tool-moves-faster-than-i-do.html    English, April 2026
  └─ verktyget-ror-sig-snabbare-an-jag.html  Swedish, April 2026
img/                    project card screenshots (two-tier thumbnail system)
  ├─ AntiAI-AIClub-form.png
  ├─ tech-digest-cover.png
  ├─ geofill-img.jpg
  └─ gdp-data-pipeline-img.jpg
og.png                  1200×630px Open Graph / Twitter card image
favicon.svg             logo mark
robots.txt              allow all crawlers; points to real sitemap URL
sitemap.xml             covers homepage + all writing posts
portfolio-site-designV1.zip  design export reference (keep for reference)
```

## Page sections

| Anchor | Section |
|---|---|
| `#top` | Hero — name, tagline |
| `#work` | § 01 Selected work — project cards |
| `#writing` | § 02 Writing — article list |
| `#stack` | § 03 The shelf — tools & stack |
| `#about` | § 04 About — prose + meta |
| `#contact` | Footer — CTA, email, socials |

## Content to update

Content is inline in `index.html` — one edit per item to add a project, writing entry, or stack item.

- **`#work`** — add a project card by duplicating an `<a class="card">` block
- **`#writing`** — add a writing row; create `writing/your-slug.html`, then add an `<a class="writing-row">` pointing to it
- **`#stack`** — add/edit items within the relevant `<ul>` in a `.stack-cell`
- **Now strip** — four cells: Helsinki (live clock, don't touch), Status (static), Building (static), Last push (live GitHub API — JS in inline `<script>` at bottom of `index.html`)

### Adding a writing post

1. Duplicate `writing/verktyget-ror-sig-snabbare-an-jag.html`, rename with a slug
2. Update `<title>`, `<meta name="description">`, `og:url`, `og:title`, `og:description` in `<head>`
3. Update `lang` attribute if the post language differs
4. Update the `post-eyebrow` date and tag, and `post-title`
5. Replace the body paragraphs in `.post-body.prose`
6. Add a matching `<a class="writing-row" data-lang="EN">` in `index.html` — `data-lang` (uppercase) is required for the EN/SV toggle to filter the row; include `.row-tags` with a `.tag` (topic) and `.lang` (language) badge
7. Add the URL to `sitemap.xml`
8. If the post is a translation of an existing post, add `hreflang` `<link>` tags in `<head>` of both files

## Outstanding items

- **Cloudflare Web Analytics** — enable in Cloudflare dashboard (Pages → project → Web Analytics)

## Stack

- HTML + custom CSS (OKLCH, variable fonts: Fraunces, IBM Plex Sans/Mono)
- Minimal inline JS (Helsinki clock, GitHub API fetch for last push, interactive easter egg — no dependencies)
- Hosting: Cloudflare Pages
- Fonts: Google Fonts (Fraunces variable + IBM Plex family)
