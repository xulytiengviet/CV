# Long Ngo — Academic, GIS/GeoAI & Open-Source Portfolio

This repository powers **Long Ngo's academic and research portfolio** at:

**https://xulytiengviet.github.io/CV/**

## Architecture

This repository is a lightweight downstream of [al-folio](https://github.com/alshedivat/al-folio):

- al-folio is pinned in `AL_FOLIO_VERSION`.
- `scripts/prepare_site.sh` clones that exact upstream release.
- `site/` contains only Long Ngo's content and page overrides.
- `config/branding.yml` replaces upstream identity/SEO/site settings.
- GitHub Actions builds the merged site and deploys it to GitHub Pages.

This keeps the repository small, makes upstream upgrades auditable, and prevents demo content from leaking into the public portfolio.

## Site sections

About · Research · GeoAI/GIS · Projects · Open Source · Publications · CV

## Update content

Most routine edits only require Markdown/YAML:

- Biography: `site/_pages/about.md`
- Research: `site/_pages/research.md`
- GeoAI/GIS: `site/_pages/geoai.md`
- Projects: `site/_pages/projects.md`
- Software: `site/_pages/software.md`
- Publications: `site/_pages/publications.md`
- BibTeX: `site/_bibliography/papers.bib`
- Social links: `site/_data/socials.yml`
- Site identity/SEO: `config/branding.yml`

## Local build

Prerequisites: Git, Ruby 3.3+, Bundler, Node 20+, Python 3.13+, and ImageMagick.

```bash
bash scripts/prepare_site.sh
cd .build/al-folio
bundle install
npm ci
JEKYLL_ENV=production bundle exec jekyll build --destination ../../_site
```

## Deployment

Pushes to `main` trigger `.github/workflows/pages.yml`.

Pull requests run the full build but do not deploy, so changes can be reviewed safely before publication.

## Licensing

Repository-authored code and content are released under the MIT license unless otherwise noted. The site uses al-folio as an upstream dependency; attribution and its MIT license notice are retained in `THIRD_PARTY_NOTICES.md`.
