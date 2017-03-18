# Apache-php

## How to use this image

Get the docker image by running the following commands:

```bash
docker pull billwilliam/apache-php
```
start the container

```bash
docker run --name apache-php -v /path/to/web:/var/www/html -p 80:80 -d billwilliam/apache-php
```
your web directory must contains a public directory (so /path/to/web/public must exist)
All http request will be redirect to this public directory, and if the page didn't exist il will be redirect to index.php.
