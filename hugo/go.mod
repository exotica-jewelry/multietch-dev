module github.com/exotica-jewelry/multietch

go 1.18

// For local theme development, you can use replace directives to change the
// location of a loaded module. For instance, to change the location of the
// exotica-jewelry/purple-prism module, uncomment the next section and change
// the local path to a valid directory relative to this file. Then run
// `hugo mod get` on the command line. More info:
// https://github.com/rootwork/hugo-module-site#local-theme-development

replace github.com/exotica-jewelry/purple-prism => ../../purple-prism

require github.com/exotica-jewelry/purple-prism v0.0.0-20220706013216-ced53b56e261 // indirect
