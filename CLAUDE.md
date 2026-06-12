# CLAUDE.md — Portfolio site

Static portfolio site for Niklas Savonheimo. No build step, no framework, no dependencies. One HTML file per page, one shared CSS file.

**Live URL:** `https://portfolio-site-5bt.pages.dev/`
**Hosting:** Cloudflare Pages (auto-deploys on push to `main`)
**Repo:** `github.com/Nickeniklas/portfolio-site`

---

## File structure

```
index.html              landing page — hero → now strip → about → shelf → selected work → writing → footer
style.css               all CSS — OKLCH design tokens, no Tailwind utilities
live/
  └─ index.html         Projects page — § 01 Running now (live demos, 2-col grid, repo+live links), § 02 More projects (repo-only cards)
writing/                one .html file per post; bilingual posts are separate files cross-linked with hreflang
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
og.png                  1200×630px Open Graph / Twitter card image (root, same level as favicon)
cv.docx                 downloadable CV — linked from nav, footer, and the About CV row; disallowed in robots.txt
favicon.svg
robots.txt
sitemap.xml             update <loc> entries when new pages are added
```

---

## Design system

Colors (OKLCH):
- `--bg` `oklch(18% 0.014 60)` — warm coffee-black background
- `--green` `oklch(75% 0.09 125)` — sage-olive accent
- `--ink` `oklch(92% 0.015 80)` — primary text
- `--ink-mute` / `--ink-faint` — secondary / tertiary text

Type:
- `--serif` Fraunces (variable: SOFT, WONK, opsz axes) — headings, article body
- `--sans` IBM Plex Sans — UI, body copy
- `--mono` IBM Plex Mono — labels, meta, nav, dates

All type and spacing uses `clamp()` for fluid sizing. Breakpoint at 760px.

---

## Key CSS classes

| Class | Purpose |
|---|---|
| `.shell` | Max-width wrapper (1100px, centered) |
| `.section` | Content section with standard padding |
| `.sec-head` | Section header row (number + title + sub) |
| `.card` | Project card — `<div class="card">` with a `.card-links` row (repo / live links) inside `.card-body`. Horizontal 280px-thumb layout in `.projects-grid` (index.html `#work`), or compact vertical layout in `.projects-grid.more-projects-grid` (live/index.html § 02) |
| `.sec-lede` | Section intro line below `.sec-head` (IBM Plex Sans, `--ink-mute`, ~15px) |
| `.writing-row` | Single writing list entry — 3-col grid: date · title · `.row-tags` |
| `.row-tags` | Flex container for tag badges inside `.writing-row` |
| `.tag` | Topic tag pill (faint border, mono) |
| `.lang` | Language badge pill (green accent, mono) — `EN`, `SV`, etc. |
| `.writing-lang-wrap` | Flex wrapper in writing `.sec-head` that holds the EN/SV toggle |
| `.lang-toggle` | Segmented EN \| SV button group — filters writing list by `data-lang` attribute |
| `.lang-btn` | Individual button inside `.lang-toggle`; `aria-pressed="true"` = active (filled green) |
| `.prose` | Long-form serif text (18px Fraunces, text-indent on `p + p`); `h2` inside it gets a smaller serif section-heading style for posts with multiple sections |
| `.post-head` | Writing post page header (eyebrow + h1) |
| `.post-title` | Writing post h1 (56px Fraunces, `max-width: 22ch`) |
| `.post-body` | Writing post body wrapper (use with `.prose`) |
| `.live-grid` | 2-column grid container for live cards in `live/index.html` (1 column ≤760px) |
| `.live-card` | Live site card — thumbnail on top, body below, ends with a `.card-links` row (`repo →` / `live →`) |
| `.live-thumb` | Wide thumbnail region (16/7 aspect); holds stripes or `<img>` + `.live-thumb-marker` |
| `.live-thumb-stripes` | Diagonal stripe placeholder (no image available) |
| `.live-thumb-marker` | "live" badge pill in top-right of thumbnail; has own dark backdrop |
| `.live-body` | Text body below the thumbnail in a `.live-card` |
| `.live-meta` | Mono meta line (year · category · tech) inside `.live-body` |
| `.live-blurb` | Description paragraph inside `.live-body` |
| `.work-footnote` | Mono footnote below `.projects-grid` — currently holds "see all projects →" link to `live/` |
| `.more-projects-grid` | Modifier on `.projects-grid` for `live/index.html` § 02 — 2-column grid (1 column ≤760px) of compact `.card`s for repo-only projects (`.card-links` shows just `repo →`) |
| `.card-links` | Row of "repo →" / "live →" pill-style links inside `.card-body` — bordered chips that fill green on hover |
| `.cv-row` | Full-width row in `#about`, below the `.about` grid — holds `.cv-btn` + `.cv-links` |
| `.cv-btn` | Primary CV download button (filled green pill, mono uppercase) — `<a href="cv.docx" download>` |
| `.cv-links` | Secondary mono/uppercase link group beside `.cv-btn` (GitHub, LinkedIn) |

---

## Adding content

### New writing post

1. Duplicate `writing/verktyget-ror-sig-snabbare-an-jag.html`
2. Rename: ASCII slug, e.g. `writing/my-post-title.html`
3. Update in `<head>`: `<title>`, `description`, `og:url`, `og:title`, `og:description`, `lang`
4. Update `post-eyebrow` (date + tag pill) and `post-title`
5. Replace paragraphs in `.post-body.prose` — first word of first `<p>` gets `<span class="first">word</span>`. For longer posts, break it into sections with plain `<h2>Section title</h2>` between paragraphs — styled automatically via `.prose h2`
6. In `index.html`, add an `<a class="writing-row">` in the `.writing-list`. Include `data-lang` (uppercase: `EN`, `SV`, etc.) so the language toggle filters it correctly:
   ```html
   <a class="writing-row" data-lang="EN" href="writing/my-post-title.html">
     <span class="date">2026 · 05</span>
     <span class="ttl">Post title here</span>
     <span class="row-tags">
       <span class="tag">AI</span>
       <span class="lang">EN</span>
     </span>
   </a>
   ```
7. Update `sitemap.xml` with the new URL
8. **If the post is a translation of an existing post:** add `hreflang` `<link>` tags in `<head>` of both files pointing at each other

### New live demo card (`live/index.html` § 01 Running now)

Duplicate a `<div class="live-card">` block inside `.live-grid` (2-column grid, 1 column ≤760px). Update `live-thumb` image/marker, `live-meta`, `h3`, `live-blurb`, and the `.card-links` row: `repo →` (always) and `live →` (the deployed URL).

**Live card thumbnails — same two-tier system as project cards:**

- **Default (stripes):** `<div class="live-thumb-stripes" aria-hidden="true"></div>` inside `.live-thumb`
- **Screenshot:** replace the stripes div with `<img src="../img/your-image.jpg" alt="">` — the `.live-thumb img` CSS handles positioning. Add `style="object-position:center top"` if needed.

Update the `sec-sub` count ("1 live", "2 live", etc.). Add a `<url>` entry to `sitemap.xml` only if the live app has its own page on this domain (usually not — the card links externally). A project with a live demo lives only in § 01 — don't also add it to § 02 More projects.

### New project card

Both variants of `.card` follow the same dual-link pattern now — they differ only in grid layout (`.projects-grid` 280px-thumb horizontal vs `.projects-grid.more-projects-grid` 2-col compact grid):

- **`#work` (front page, highlighted picks):** duplicate a `<div class="card">` block inside `.projects-grid`. `h3` has no arrow span. The body ends with a `.card-links` row:
  ```html
  <div class="card-links">
    <a href="https://github.com/Nickeniklas/your-repo" target="_blank" rel="noopener noreferrer">repo →</a>
    <a href="https://your-live-url" target="_blank" rel="noopener noreferrer">live →</a>
  </div>
  ```
  Omit the `live →` link if there's no live demo.
- **`live/index.html` § 02 More projects:** repo-only projects with no live demo — duplicate a `<div class="card">` block inside `.projects-grid.more-projects-grid` (2-column grid on desktop, 1 column ≤760px). `h3` has no arrow span, and the body ends with a `.card-links` row containing just `repo →`. If the project later gets a live demo, move it to § 01 Running now instead (with `repo →` and `live →`) and remove it from here.

**Card thumbnails — two-tier system:**

- **Default (stripes):** keep `<div class="card-thumb-stripes" aria-hidden="true"></div>` — used for repos with no strong visual output.
- **Screenshot (`#work` / `.projects-grid` only):** for projects with a chart, map, or UI worth showing, save a cropped image to `img/` and replace the stripes div with:
  ```html
  <img class="card-thumb-img" src="img/your-image.jpg" alt="">
  <div class="card-thumb-scrim" aria-hidden="true"></div>
  <div class="card-thumb-marker">label</div>
  <div class="card-thumb-label">FILENAME.EXT</div>
  ```
  The scrim (50% dark overlay) + `var(--ink)` text color on `.card-thumb-label` and `.card-thumb-marker` ensures legibility over any image. Add `style="object-position:center top"` on the `<img>` if the subject is near the top of the image.
- **Screenshot (`.more-projects-grid` / `live/index.html` § 02):** simplified thumb — `.card-thumb-img` + `.card-thumb-marker` only, no `.card-thumb-scrim` or `.card-thumb-label`:
  ```html
  <img class="card-thumb-img" src="../img/your-image.jpg" alt="">
  <div class="card-thumb-marker">label</div>
  ```
  The marker gets its own dark backdrop pill (like `.live-thumb-marker`) via `.more-projects-grid .card-thumb-marker`, since there's no scrim for contrast.

Update the `sec-sub` count and `sec-lede` on whichever section changed.

### Now strip

The `.now` section in `index.html` has four cells:

| Cell | Type | Notes |
|---|---|---|
| Helsinki | Live clock | Inline JS — don't touch |
| Status | Static text | Edit the `.val` span directly |
| Building | Static text | Edit the `.val` span directly |
| Last push | Live — GitHub API | Fetches `https://api.github.com/users/Nickeniklas/events/public` on page load, finds first `PushEvent`, displays `repo · Xd ago`. Error state shows a `github ↗` link. JS is in the inline `<script>` block at the bottom of `index.html`. |

### Link convention

- **`#work` cards (front page)** → `.card-links` row with a GitHub repo link (`repo →`) and, where one exists, a live demo link (`live →`)
- **`live/index.html` § 01 Running now** → `.card-links` row with `repo →` and `live →` (to the deployed URL, e.g. GitHub Pages, Render)
- **`live/index.html` § 02 More projects** → repo-only projects (no live demo); `.card-links` row with just `repo →`

### Nav & footer links

Canonical nav order on both pages: `about, stack, work, writing, projects, contact, cv`.

- `index.html`: `#about`, `#stack`, `#work`, `#writing`, `live/`, `#contact`, `cv.docx` (download)
- `live/index.html`: `../#about`, `../#stack`, `../#work`, `../#writing`, `./` (self, labeled "projects"), `../#contact`, `../cv.docx` (download)

The footer link row (github, linkedin, email, cv) only exists on `index.html`'s `#contact` footer — `live/index.html`'s footer is just "← home" + copyright.

### GitHub contribution calendar

Sits in `§ 01 About`, below the `.about` grid, as a `.stack-cell` wrapper with `width: fit-content` so the cell hugs the image rather than stretching full-width. Image served from `https://ghchart.rshah.org/2D6A4F/Nickeniklas` (third-party service, color `2D6A4F` close to `--green`). Has `max-width: 100%; height: auto; display: block` on the `<img>`.

---

## Voice and copy rules

- Plain everyday language. No marketing speak, no filler.
- Short sentences. One idea per sentence.
- Writing posts can be in any language (Swedish, English, Finnish) — set `lang` on `<html>` per page.

---

## Outstanding items

- **Cloudflare Web Analytics** — enable in Cloudflare dashboard under the Pages project
- **Custom domain** — Phase 5 in PLAN.md, optional
- **Mobile nav overflow** — the 7-item nav (`about · stack · work · writing · projects · contact · cv`) overflows on narrow phones (~390px); consider wrapping, condensed labels, or a menu toggle

---

## What not to do

- Don't add a build step or bundler
- Don't add a CMS
- Don't add JS dependencies
- Don't use Tailwind utilities in `style.css`
- Don't add comments explaining what the code does — only add one if the WHY is non-obvious
