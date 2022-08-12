---
title: "{{ replace .Name "-" " " | lower }}"
date: {{ .Date }}
lastmod: {{ .Date }}
draft: true # Set to false to publish

featured_image:
  file: "images/{{ .Name | lower }}.jpg"
  caption: ""

# Content below this line will be used as introductory text on the page.
---
