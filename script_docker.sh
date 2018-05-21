#!/bin/bash

ls $HOME/docker/*.tar.gz | xargs -I {file} sh -c "zcat {file} | docker load";

docker build --pull --cache-from maresidencefr/nginx --tag maresidencefr/nginx nginx
docker build --pull --cache-from maresidencefr/node --tag maresidencefr/node node
docker images -a --format '{{.Repository}}:{{.Tag}} {{.ID}}' | xargs -n 2 -t sh -c 'test -e $HOME/docker/$1.tar.gz || docker save $0 | gzip -2 > $HOME/docker/$1.tar.gz'

docker login -u "$REGISTRY_USER" -p "$REGISTRY_PASS"
docker push maresidencefr/node
docker push maresidencefr/nginx
