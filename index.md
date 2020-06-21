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

## My repos

{% for repository in site.github.public_repositories %} 
{% if repository.fork == false %} 
- [{{ repository.name }}]({{ repository.html_url }}) — {{ repository.description }}, :star: **{{ repository.stargazers_count }}**
{% endif %}
{% endfor %}

## Interactive projects

* [Математичные книги](http://rmbk.me/math_books) — math books
* [Math Clicker](http://rmbk.me/math-clicker) — remake of cookie clicker

## LinkedIn
<div class="LI-profile-badge"  data-version="v1" data-size="large" data-locale="ru_RU" data-type="horizontal" data-theme="light" data-vanity="ramzan-bekbulatov-0b78b999"><a class="LI-simple-link" href='https://ru.linkedin.com/in/ramzan-bekbulatov-0b78b999?trk=profile-badge'>Ramzan Bekbulatov</a></div>
