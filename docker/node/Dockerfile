FROM node:9-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        git-core \
        ssh-client \
        python \
        vim \
        libfreetype6 \
        libfontconfig \
        bzip2 \
        netcat-openbsd \
        curl \
        build-essential \
        g++ \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN yarn global add eslint eslint-plugin-html

RUN mkdir /home/node/.ssh \
    && ssh-keyscan github.com >> /home/node/.ssh/known_hosts \
    && chown -R node:node /home/node \
    && chmod 700 /home/node/.ssh \
    && chmod 600 /home/node/.ssh/known_hosts

USER node
WORKDIR /srv

CMD ["node"]
