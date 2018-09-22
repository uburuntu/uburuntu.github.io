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

## Профиль на LinkedIn
<div class="LI-profile-badge"  data-version="v1" data-size="large" data-locale="ru_RU" data-type="horizontal" data-theme="light" data-vanity="ramzan-bekbulatov-0b78b999"><a class="LI-simple-link" href='https://ru.linkedin.com/in/ramzan-bekbulatov-0b78b999?trk=profile-badge'>Ramzan Bekbulatov</a></div>

## Другое

* [Мой wish-list](http://rmbk.me/wishlist) — для друзей
