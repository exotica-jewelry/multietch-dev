# Development site for https://multietch.com

Multi-Etch is created with the static site generator [Hugo](http://gohugo.io).
This repo also uses Node and yarn for some helper scripts, so everything
Hugo-related is in the `hugo` directory.

## Editing site variables

- `hugo/config/_default/config.toml` (main configuration)

## Hugo modules

The site imports components like the theme as
[Hugo modules](https://gohugo.io/hugo-modules/) rather than as git submodules
(as in the past).
[More information about this approach.](https://github.com/rootwork/hugo-module-site)

The `go.mod` file is in the `hugo` directory of the repository, and modules are
loaded in `hugo/config/_default/config.toml`.

## Editing the theme

Customizing a theme is done by
[overriding theme files](https://gohugo.io/hugo-modules/theme-components/).
Because themes are loaded dynamically using Hugo modules, go to the themes'
original repos to see what files to override and their initial content.

Add notes at the top of any overridden files using Go comments (`{{/* */}}`) to
note what has been changed -- this vastly eases integrating new changes to the
overridden files from upstream.

## Fresh installation

### This repo

- `git clone git@github.com:exotica-jewelry/multietch-dev.git`
- `cd multietch-dev`
- `yarn install --immutable --immutable-cache`

Tested with Node 16.x and yarn 1.22.x.

## Updating dependencies

### Hugo

Hugo extended is installed via
[hugo-bin](https://www.npmjs.com/package/hugo-bin). To update to the newest
version, run `yarn install`.

### Hugo modules

From the `./hugo` subdirectory:

- Update all modules: `hugo mod get -u`
- Update all modules recursively: `hugo mod get -u ./...`
- Update a single module: `hugo mod get -u <repo_path>`
- Update a single module to a specific branch:
  `hugo mod get <repo_path>@<branch>`
- Update a single module to a specific version (tag
  [must use semver](https://go.dev/doc/modules/version-numbers)):
  `hugo mod get <repo_path>@<git_tag>`

For more, see [Hugo Module Site](https://github.com/rootwork/hugo-module-site)
and the [overview of Hugo modules](https://gohugo.io/hugo-modules/).

### Node modules

- `yarn outdated`, then:
  - `yarn upgrade [package]` to upgrade to the newest version satisfied by the
    version range in `package.json`
  - `yarn upgrade [package@version]` to upgrade to a specific version,
    disregarding `package.json`
  - `yarn upgrade [package] --latest` to upgrade to the newest version,
    disregarding `package.json`

## Licenses

Code portions including any Bash scripts, HTML, Sass/CSS, Javascript, and Go
templates are licensed AGPLv3. See [LICENSE-code](LICENSE-code).

Content of web pages, including text in `hugo/content` and its subdirectories,
and images/logos in the `hugo/content` and `hugo/static` directories and their
subdirectories, are © All Rights Reserved by Multi-Etch, LLC, or their
respective copyright-holders as noted. See [LICENSE-content](LICENSE-content).

"Multi-Etch" is a registered trademark of Exotica Jewelry, Inc.
