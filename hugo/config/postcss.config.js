const autoprefixer = require('autoprefixer')
const purgecss = require('@fullhuman/postcss-purgecss')
const whitelister = require('purgecss-whitelister')

module.exports = {
  plugins: [
    autoprefixer(),
    purgecss({
      content: [
        './node_modules/@hyas/core/layouts/**/*.html',
        './node_modules/@hyas/core/content/**/*.md',
        './layouts/**/*.html',
        './content/**/*.md',
      ],

      safelist: [
        'lazyloaded',
        'table',
        'thead',
        'tbody',
        'tr',
        'th',
        'td',
        'h3',
        'h5',
        'alert-link',
        'container-xxl',
        'container-fluid',
        'offcanvas-backdrop',
        'img-fluid',
        'lazyload',
        'blur-up',
        'figcaption',
        ...whitelister([
          './node_modules/@hyas/core/assets/scss/common/_variables.scss',
          './node_modules/@hyas/core/assets/scss/components/_alerts.scss',
          './node_modules/@hyas/core/assets/scss/components/_code.scss',
          './assets/scss/components/_alerts.scss',
          './assets/scss/components/_buttons.scss',
        ]),
      ],
    }),
  ],
}
