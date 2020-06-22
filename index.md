---
layout: page
title: Ramzan Bekbulatov
description: 
sitemap:
    priority: 1.0
    lastmod: 2020-06-21
    changefreq: weekly
---

# Hello!

It's me. 

:new_moon_with_face: :full_moon_with_face:

## My repos

{% for repository in site.github.public_repositories %} 
{% if repository.fork == false %} 
- [{{ repository.name }}]({{ repository.html_url }}) — {{ repository.description }}, :star: **{{ repository.stargazers_count }}**
{% endif %}
{% endfor %}

## Interactive projects

* [Математичные книги](https://rmbk.me/math_books) — math books list
* [Math Clicker](https://rmbk.me/math-clicker) — remake of cookie clicker

## LinkedIn

<div class="LI-profile-badge"  data-version="v1" data-size="large" data-locale="en_US" data-type="horizontal" data-theme="light" data-vanity="rmbk"><a class="LI-simple-link" href='https://ru.linkedin.com/in/rmbk/en-us?trk=profile-badge'>Ramzan Bekbulatov</a></div>
