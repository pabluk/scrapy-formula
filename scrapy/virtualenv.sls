{% set user = salt['pillar.get']('scrapy:user', 'scrapy') %}
{% set home = salt['pillar.get']('scrapy:home', '/home/%s' % user) %}
{% set virtualenv = salt['pillar.get']('scrapy:virtualenv', '%s/.virtualenvs/scrapy' % home) %}
{% if salt['pillar.get']('scrapy:version', 'latest') == 'latest' %}
  {% set version = '' %}
{% else %}
  {% set version = '== %s' % salt['pillar.get']('scrapy:version') %}
{% endif %}

scrapy_user:
  user.present:
    - name: {{ user }}
    - fullname: Scrapy User
    - home: {{ home }}

system-packages:
  pkg.installed:
    - pkgs:
      - python-dev
      - python-pip
      - python-virtualenv
      - libxslt1-dev
      - libxml2-dev
      - zlib1g-dev
      - libffi-dev
      - libssl-dev

scrapy_virtualenv:
  virtualenv.managed:
    - name: {{ virtualenv }}
    - system_site_packages: False
    - user: {{ user }}
    - require:
      - pkg: system-packages

scrapy_package:
  pip.installed:
    - name: scrapy {{ version }}
    - bin_env: {{ virtualenv }}
    - user: {{ user }}
    - require:
      - user: scrapy_user
      - virtualenv: scrapy_virtualenv
