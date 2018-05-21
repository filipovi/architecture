#!/bin/bash

set -e

(setfacl -Rn -m u:www-data:rwX -m u:`whoami`:rwX -m mask:rwX /srv/api-read/var/cache /srv/api-read/var/logs /srv/api-read/var/sessions || true) &>/dev/null
(setfacl -dRn -m u:www-data:rwX -m u:`whoami`:rwX -m mask:rwX /srv/api-read/var/cache /srv/api-read/var/logs /srv/api-read/var/sessions || true) &>/dev/null
(setfacl -dRn -m u:www-data:rwX -m u:`whoami`:rwX -m mask:rwX /srv/api-read/var/sessions /srv/api-read/var/sessions || true) &>/dev/null

/usr/local/bin/composer config -g github-oauth.github.com "$COMPOSER_GITHUB_OAUTH_TOKEN"

exec "$@"
