---
title: RMBK
---

# Это заготовка моего сайтика

Приветики :new_moon_with_face: :full_moon_with_face:

## Мои репозитории

{% for repository in site.github.public_repositories %} 
{% if repository.fork == false %} 
- [{{ repository.name }}]({{ repository.html_url }}) — {{ repository.description }}, :star: **{{ repository.stargazers_count }}**
{% endif %}
{% endfor %}

## Что можно потыкать

* [Математичные книги](http://rmbk.me/math_books) — математичный список полезных книг
* [Math Clicker](http://rmbk.me/math-clicker) — кликер интегралов
* [Flappy Matan](http://rmbk.me/flappymatan) — аналог Flappy Bird 

## Другое

* [Мой wish-list](http://rmbk.me/wishlist) — для друзей
