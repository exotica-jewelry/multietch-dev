---
title: "{{ replace .Name "-" " " | title }}"
description: ""
excerpt: ""
date: {{ .Date }}
lastmod: {{ .Date }}
draft: false # Set to false to publish
weight: 50
images: ["{{ .Name | urlize }}.jpg"]
categories: [""]
---
