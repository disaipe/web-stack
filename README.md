# Web stack

> Basic LEMP/LAMP web stack for web developers

Docker-compose script what runs basic LEMP or LAMP stack with single command line!

|Service|LEMP|LAMP|
|-|-|-|
|[nginx](https://hub.docker.com/_/nginx "nginx on docker hub")|+| |
|[httpd](https://hub.docker.com/_/httpd "httpd on docker hub")| |+|
|[php-fpm](https://hub.docker.com/_/php "php-fpm on docker hub")|+|+|
|[mariadb on docker hub](https://hub.docker.com/_/mariadb "mariadb on docker hub")|+|+|
|\**[adminer](https://hub.docker.com/_/adminer "adminer on docker hub")*| | |

\* *optional service*

## Usage example

Before working create and edit `.env` file
```bash
cp .env.example .env
```

#### LEMP
1. Check configuration files if needed
2. Start services
```bash
docker-compose up -d lemp
```

#### LAMP
1. Check configuration files if needed
2. Start services
```bash
docker-compose up -d lamp
```

#### Optional services
To start optional service, e.g. *adminer* (it will be available on http://hostname:8081 by default)
```basj
docker-compose up -d adminer
```

## Configure
By default, stack are ready  to basic work, but you can edit your configuration for each service.


#### Compose environment

Environment file helps to configure services base options:
- APP_NAME - application name, uses as prefix for services containers names
- HTTP_PORT - public port for chosen web server
- HTTP_HOST - hostname for web servers internal usage
- HTTPD_VERSION - httpd version from hub tags (*latest* as default)
- PHP_VERSION - php version from hub tags
- DB_VERSION - mariadb varsion from hub tags
- DB_ROOT_PASSWORD - default root password for mariadb
- DB_DATABASE - database name
- DB_USER - database user name
- DB_PASSWORD - database user password
- DB_ADMINER_PORT - public port for adminer

If you changes environment after service start, you need stop and rebuild changed containers, e.g.:
```bash
docker-compose stop
docker-compose rm php
docker-compose build php
docker-compose start -p lemp
```

#### Configuration files
You can edit services configuration files as you wish.

After changes you need stop and recreate changed containers, e.g.:
```bash
docker-compose stop
docker-compose rm -f nginx
docker-compose up -d nginx
```

Service | Configuration files
-|-
nginx| etc/nginx/conf.d/default.conf
httpd |  etc/httpd/httpd.conf<br>etc/httpd/conf.d/vhosts.conf
php | etc/php/php.ini
mariadb | etc/mariadb/conf.d/default.cnf
adminer | *nothing to configure*