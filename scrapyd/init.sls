scrapy-repo:
  pkgrepo.managed:
    - name: deb http://archive.scrapy.org/ubuntu scrapy main
    - file: /etc/apt/sources.list.d/scrapy.list
    - keyid: 627220E7
    - keyserver: hkp://keyserver.ubuntu.com:80

scrapyd:
  pkg:
    - installed
    - name: scrapyd
