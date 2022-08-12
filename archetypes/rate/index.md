---
title: "{{ replace .Name "-" " " | lower }}"
date: {{ .Date }}
lastmod: {{ .Date }}
draft: true # Set to false to publish

featured_image: "images/{{ .Name | lower }}.jpg"
featured_image_caption: ""

# Content below this line will be used as introductory text on the page.
---
