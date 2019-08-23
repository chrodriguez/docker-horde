# Horde Groupware docker image

Serves Horde Groupware as docker image. It's installation is PEAR based,
applying docker best practices and official php docker image.

## Configuration

Initial configuration requires a MySQL database to be initialized using
HORDE's `webmail-install` migration script. Its logic is changed because it is
an attended scrpit, so DB configuration is loaded from environment variables and
then populated with corresponding tables.
Once database migrations are run, Apache will start and horde can be tested.

## Sample compose configuration

This repo includes a sample `docker-compose.yml` that will start a Mysql 5.7
database and start Horde. It's iportant to note that Horde will fail to start
until Mysql is started. Using docker restart policy, horde's container will be
flapping until Mysql starts

### About proposed volumes

Horde configuration can be saved from UI once containers are started. If you are
going to configure Horde using its UI, its important to define volumes for
configuration files. If this will be the case, then remember to backup your
volumes.
Propose volumes are listed inside `docker-compose.yml` for each directory
containing Horde's modules configurations.

## TODO

* Explain how to run cron jobs
* DocumentRoot en /var/www/html/horde
* Parameterize `php.ini`:
  * Upload and post max size
  * Memory limit
* Remove static assets: 

```
SetEnvIf Request_URI "\.gif$|\.jpg$" is_static
CustomLog logs/access_log common env=!is_static
```
