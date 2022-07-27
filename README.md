# Development site for https://multietch.com

Multi-Etch is created with the static site generator [Hugo](http://gohugo.io)
using the [Hyas](https://gethyas.com/)
[child theme](https://github.com/h-enk/hyas-child-theme) forked into this repo.
The original Hyas child theme readme is located at [`hyas.md`](hyas.md).

## Local development

This theme requires Node to run, and has been tested with Node 16.x. It does not
appear to work with Yarn.

### Installation

- `npm install`

### Serving the development site

- `npm run start`

Serves the site LiveReload, accessible in the browser at
`http://localhost:1313/`.

Because the theme makes use of Hugo's `.Scratch` function, `fastRender` is
turned off.

By default, the site is served in development mode:

- Drafts are included
- Future-scheduled posts are included
- Asset fingerprinting, CDNs and comment systems are disabled

Alternatively, use `npm run build:preview` to preview the production mode:

- Drafts are not included
- Future-scheduled posts are not included
- Asset fingerprinting, CDNs and comment systems are enabled.

### Creating a new post

`npm run create [path]`

For example, `npm run create foo.md` will create a file at `content/foo.md`.

All instances of "Multi-Etch" are automatically replaced with a version that a) includes the `®` character, and b) won't break on the hyphens when wrapping. This is done behind the scenes; just write `Multi-Etch` as normal and Hugo will do the work :)

### Editing site variables

- `hugo/config/_default/config.toml`: main configuration and Hugo setup
- `hugo/config/_default/params.toml`: site information and Hyas theme options
- `hugo/config/_default/markup.toml`: Markdown rendering options
- `hugo/config/_default/menus.toml`: navigation menus

### Editing the theme

Customizing a theme is done by
[overriding theme files](https://gohugo.io/hugo-modules/theme-components/).
Consult the [main Hyas theme](https://github.com/h-enk/hyas) to see what theme
files exist (and therefore can be overridden) and their initial contents.

Add notes at the top of any overridden files using Go comments (`{{/* */}}`) to
note what has been changed -- this vastly eases integrating new changes to the
overridden files from upstream, which unfortunately has to be done manually.

## Generating the site for production

`npm run build`

This will generate the Hugo site in `public` with minification turned on.

Note that `public` is excluded from the repo in `.gitignore`, so this command
should be run from a GitHub Action or other CI to build the site. To build a version optimized for GitHub Pages, run:

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
  - `npm upgrade [package] --latest` to upgrade to the newest version,
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
