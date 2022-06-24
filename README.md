# Development site for https://multietch.com

Multi-Etch is created with the static site generator [Hugo](http://gohugo.io).
This repo also uses Node with yarn for some helper scripts, so everything
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
- `npm i`

Tested with Node 16.x, npm 8.x, and yarn 1.22.x.

### Go

- [Follow the instructions](https://golang.org/doc/install)

### Hugo

- Get the `hugo_extended_VERSION_OS-64bit.*`
  [package from GitHub releases](https://github.com/gohugoio/hugo/releases)
  (e.g. `hugo_extended_0.81.0_Linux-64bit.deb`). On Debian-based Linux systems,
  ignore the alert that
  [an older package is available in the channel](https://gohugo.io/getting-started/installing#debian-and-ubuntu).
- Install the package, which will place it in `/usr/local/bin/hugo`.

## Updating dependencies

### Go

- Check version: `go version`
- [Remove old version and install new version](https://gist.github.com/nikhita/432436d570b89cab172dcf2894465753)

### Hugo

- Check version: `hugo version`
- `sudo rm -rf /usr/local/bin/hugo`
- Get the `hugo_extended_VERSION_OS-64bit.*`
  [package from GitHub releases](https://github.com/gohugoio/hugo/releases)
  (e.g. `hugo_extended_0.81.0_Linux-64bit.deb`) and install.

### Hugo modules

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

`npm outdated`

Then `npm up <module>` as necessary, and commit.

## Licenses

Code portions including any Bash scripts, HTML, Sass/CSS, Javascript, and Go
templates are licensed AGPLv3. See [LICENSE-code](LICENSE-code).

Content of web pages, including text in `hugo/content` and its subdirectories,
and images/logos in the `hugo/content` and `hugo/static` directories and their
subdirectories, are © All Rights Reserved by Multi-Etch, LLC, or their
respective copyright-holders as noted. See [LICENSE-content](LICENSE-content).

"Multi-Etch" is a registered trademark of Exotica Jewelry, Inc.
