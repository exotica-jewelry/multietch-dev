---
title: "{{ replace .Name "-" " " | title }}"
date: '{{ .Date | dateFormat "2006-01-02" }}'
# lastmod: '{{ .Date | dateFormat "2006-01-02" }}' # Appends 'edited on' to the publish date

slug: '{{ .Name }}' # Recommended length is 3 to 5 words.
# aliases:

# For the post as it appears in lists.
excerpt: >
  Summary

# For SEO and social media snippets (recommended 150-200 characters).
description: >
  Description

draft: true # Change to 'false' to publish this post.
sitemap_exclude: false # Change to 'true' to exclude from sitemaps submitted to search engines.
feed_exclude: false # Change to 'true' to exclude from RSS etc.

# Archive taxonomy terms (auto-generated)
year: '{{ .Date | dateFormat "2006" }}'
month: '{{ .Date | dateFormat "2006-01" }}'

featured_image:
  file: '' # Recommended. Used as a header, and when sharing on social media.
  caption: '' # Markdown can be included here

---
