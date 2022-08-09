# Development site for https://multietch.com

Multi-Etch is created with the static site generator [Hugo](http://gohugo.io)
using the [Hyas](https://gethyas.com/)
[child theme](https://github.com/h-enk/hyas-child-theme) forked into this repo.
The original Hyas child theme readme is located at [`hyas.md`](hyas.md).

## Prerequisites

[Node v16.x](https://nodejs.org/en/download/) (currently LTS) must be installed.
The project installs Hugo itself, so Node is all you need to install manually.

## Quick-start for editing and adding content

1. Clone the repo and enter the directory.
2. `npm install` to get Hugo and other dependencies set up.
3. `npm start` to begin serving the website. Once it spins up, you can load the
   site in your web browser at `http://localhost:1313/`
4. All pages and posts are located in the `content` directory, which represents
   the root of the website -- i.e. `content/about/` will appear on the website
   at `https://www.multietch.com//about/`, `content/about/team/` will appear at
   `https://www.multietch.com//about/team/`, etc.
5. Page content is written in
   [Markdown](https://www.markdownguide.org/getting-started), which takes a
   small amount of learning but then is much easier to write than HTML. Each
   file begins with
   [front matter](https://gohugo.io/content-management/front-matter/) that
   establishes things like the page's title.
6. As you edit pages, the website in your browser will automatically reload.
7. To add an image to a page, put the image in the same folder as the page and
   then
   [reference the image in Markdown](https://www.markdownguide.org/basic-syntax/#images).
   For instance, to add an image called `image.jpg` to the page
   `content/contact`, save the image as `content/contact/image.jpg` and then in
   the `content/contact/image.md` file write: `![image alt text](image.jpg)`
8. To create a new page, run `npm create new` followed by the web path and
   `/index.md`. For instance, to create a page at
   `https://www.multietch.com/hello`, run `npm create new hello/index.md`. To
   create the same page below the existing `/about/` page, run
   `npm create new about/hello/index.md`.
9. When finished, commit your changes and push the repo. GitHub Actions will
   automatically rebuild the site.

See [local development](#local-development) for details.

## Features

Apart from the general design of the website, there are several built-in
features to note:

### Image minification and modern format generation (in development)

Images will be automatically minified and transformed into modern formats like
[WebP](https://en.wikipedia.org/wiki/Webp) and
[AVIF](https://en.wikipedia.org/wiki/AVIF) for browsers that support them. Save
your images as normal in JPEG, PNG or GIF format and the site will do the rest.

### Content filters

These filters act automatically on all content (title and page body):

- All instances of "Multi-Etch" in are replaced with a version that includes the
  `®` character, and won't break on the hyphen when wrapping. See the `wordmark`
  parameter in
  [`params.toml`](https://github.com/exotica-jewelry/multietch-dev/blob/main/config/_default/params.toml)
  and the
  [`wordmark.html` function](https://github.com/exotica-jewelry/multietch-dev/blob/main/layouts/partials/function/wordmark.html).
- Fractions written in long form, like "1/2" are replaced with HTML entities
  like "½" when possible, and if not then formatted to look similar.

## Local development

This theme requires Node to run, and has been tested with Node 16.x. It does not
appear to work with Yarn.

### Local installation

- `git clone` the repo
- `npm install`

The latest version of Hugo "extended" is installed as part of `npm install`, so
you don't need to install it separately. (If it's already installed on your
machine, this project will nonetheless use its own version.)

### Viewing the development site locally

- `npm start` (or `npm run start`)

Serves the site with LiveReload, accessible in the browser at
`http://localhost:1313/`

Because the theme makes use of Hugo's `.Scratch` function, `fastRender` is
turned off.

**By default, the site is served in development mode:**

- Drafts are shown
- Future-scheduled posts are shown
- Asset fingerprinting, CDNs and third-party embedded apps like commenting are
  disabled

Alternatively, use `npm run build:preview` to see the site **exactly as it will
appear on the web**:

- Drafts are **not shown**
- Future-scheduled posts are **not shown**
- Asset fingerprinting, CDNs and third-party embedded apps like commenting are
  **enabled** (though note third-party systems like commenting may not work
  locally)

### Editing an existing page

Pages in Hugo are contained in the `content` directory, which maps to the root
of the website domain.

We use [Hugo Page Bundles](https://gohugo.io/content-management/page-bundles/),
so a page and its assets (most commonly images) are contained in the same
directory.

If a page has no children, its content file is `index.md`; e.g. the `about/team`
page's content file is located at `content/about/team/index.md`. If the page has
children of its own, then its content file is `_index.md` (note leading
underscore), e.g. the `about` page's content file is located at
`content/about/_index.md`.

### Creating a new page

`npm run create [web-path]`

For example, `npm run create about/foo/index.md` will create a file at
`content/about/foo/index.md`. Because we use Page Bundles, we must use the
`dir/page/index.md` format rather than `dir/page.md` format; unfortunately it
requires a little extra typing in the command.

### Editing site variables

- `config/_default/config.toml`: main configuration and Hugo setup
- `config/_default/params.toml`: site information and Hyas theme options
- `config/_default/markup.toml`: Markdown rendering options
- `config/_default/menus.toml`: navigation menus

### Editing the theme

CSS (Sass) and Javascript files are located in the `assets` directory. The
`app.*` files load the other partial files into one object, so be sure to update
them if adding new files.

Customizing the Hugo theme layer is done by
[overriding theme files](https://gohugo.io/hugo-modules/theme-components/).
Consult the [main Hyas theme](https://github.com/h-enk/hyas) to see what theme
files exist (and therefore can be overridden) and their initial contents.

Add notes at the top of any overridden files using Go template comments
(`{{/* */}}`) to note what has been changed -- this vastly eases integrating new
changes to the overridden files from upstream, which unfortunately has to be
done manually.

## Generating the site for production

`npm run build`

This will generate the Hugo site in `public` with minification turned on.

Note that `public` is excluded from the repo in `.gitignore`, so this command
should be run from a GitHub Action or other CI to build the site.

To build a version optimized for GitHub Pages, run:

`npm run build:gh-pages`

If you want to build a flat version of the development site, with drafts and
future-scheduled posts included and minification disabled, use:

`npm run build:preview`

## Updating dependencies

### Hugo

Hugo extended is installed via
[hugo-bin](https://www.npmjs.com/package/hugo-bin). To update to the newest
version, run `npm install`.

### Node modules

- `npm outdated`, then:
  - `npm upgrade [package]` to upgrade to the newest version satisfied by the
    version range in `package.json`
  - `npm upgrade [package@version]` to upgrade to a specific version,
    disregarding `package.json`
  - `npm upgrade [package@latest]` to upgrade to the newest version,
    disregarding `package.json`

## Licenses

Hyas is
[licensed](https://github.com/h-enk/hyas-child-theme/blob/master/LICENSE) under
the "MIT" ([Expat](https://directory.fsf.org/wiki/License:Expat)) license.

Code portions specific to _this_ fork, including HTML, Sass/CSS, Javascript, and
Go templates, as well as any Bash scripts, are licensed AGPLv3. See
[LICENSE-code](LICENSE-code).

Content of web pages, including text in `hugo/content` and its subdirectories,
and images/logos in the `hugo/content` and `hugo/static` directories and their
subdirectories, are © All Rights Reserved by Multi-Etch, LLC, or their
respective copyright-holders as noted. See [LICENSE-content](LICENSE-content).

"Multi-Etch" is a registered trademark of Exotica Jewelry, Inc.
