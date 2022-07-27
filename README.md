# Development site for https://multietch.com

Multi-Etch is created with the static site generator [Hugo](http://gohugo.io).
This repo also uses Node and yarn for some helper scripts, so everything
Hugo-related is in the `hugo` directory.

## Local development

### Installation

- `git clone git@github.com:exotica-jewelry/multietch-dev.git`
- `cd multietch-dev`
- `yarn install --immutable --immutable-cache`
- `cd hugo && npm ci`

Tested with Node 16.x and yarn 1.22.x.

### Serving the site

`yarn serve`

Because the theme makes use of Hugo's `.Scratch` function, `fastRender` is
turned off.

By default, the site is served in development mode:

- Drafts are included
- Future-scheduled posts are included
- Asset fingerprinting, CDNs and comment systems are disabled

Alternatively, use `yarn serve:prod` to preview the production mode:

- Drafts are not included
- Future-scheduled posts are not included
- Asset fingerprinting, CDNs and comment systems are enabled.

### Creating a new post

`yarn run create <path>` or `hugo new <path>`.

### Editing site variables

- `hugo/config/_default/config.toml` (main configuration)

### Editing the theme

Customizing a theme is done by
[overriding theme files](https://gohugo.io/hugo-modules/theme-components/).
Because themes are loaded dynamically using Hugo modules, go to the themes'
original repos to see what files to override and their initial content.

Add notes at the top of any overridden files using Go comments (`{{/* */}}`) to
note what has been changed -- this vastly eases integrating new changes to the
overridden files from upstream.

## Generating the site for production

`yarn build`

This will generate the Hugo site in `public` with minification turned on. It's
equivalent to running:

```sh
hugo --source='./hugo' --minify --gc
```

Note that `public` is excluded from the repo in `.gitignore`, so this command
should be run from a GitHub Action or other CI to build the site.

If you want to build a flat version of the development site, with drafts and
future-scheduled posts included and minification disabled, use:

`yarn build:dev`

This is equivalent to running:

```sh
hugo --source='./hugo' --buildDrafts --buildFuture
```

## Updating dependencies

### Hugo

Hugo extended is installed via
[hugo-bin](https://www.npmjs.com/package/hugo-bin). To update to the newest
version, run `yarn install`.

### Hugo modules

`yarn modup`, which is equivalent to running `hugo mod get -u ./...`.

### Node modules

- `yarn outdated`, then:
  - `yarn upgrade [package]` to upgrade to the newest version satisfied by the
    version range in `package.json`
  - `yarn upgrade [package@version]` to upgrade to a specific version,
    disregarding `package.json`
  - `yarn upgrade [package] --latest` to upgrade to the newest version,
    disregarding `package.json`

Because the theme itself has a separate set of Node packages, you also need to
`cd hugo` and run the corresponding `npm` commands (Yarn is incompatible with
the theme) like `npm outdated` and `npm upgrade`

## Licenses

Code portions including any Bash scripts, HTML, Sass/CSS, Javascript, and Go
templates are licensed AGPLv3. See [LICENSE-code](LICENSE-code).

Content of web pages, including text in `hugo/content` and its subdirectories,
and images/logos in the `hugo/content` and `hugo/static` directories and their
subdirectories, are © All Rights Reserved by Multi-Etch, LLC, or their
respective copyright-holders as noted. See [LICENSE-content](LICENSE-content).

"Multi-Etch" is a registered trademark of Exotica Jewelry, Inc.
