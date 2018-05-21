#!/bin/bash

set -e

(setfacl -Rn -m u:www-data:rwX -m u:`whoami`:rwX -m mask:rwX /srv/notification/var/cache /srv/notification/var/logs /srv/notification/var/sessions || true) &>/dev/null
(setfacl -dRn -m u:www-data:rwX -m u:`whoami`:rwX -m mask:rwX /srv/notification/var/cache /srv/notification/var/logs /srv/notification/var/sessions || true) &>/dev/null
(setfacl -dRn -m u:www-data:rwX -m u:`whoami`:rwX -m mask:rwX /srv/notification/var/sessions /srv/notification/var/sessions || true) &>/dev/null

/usr/local/bin/composer config -g github-oauth.github.com "$COMPOSER_GITHUB_OAUTH_TOKEN"

exec "$@"
