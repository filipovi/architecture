FROM nginx:1-alpine

EXPOSE 80 443

COPY ./vhosts/api-read.conf /etc/nginx/tmp/api-read.conf
COPY ./vhosts/api-write.conf /etc/nginx/tmp/api-write.conf
COPY ./vhosts/front.conf /etc/nginx/tmp/front.conf
COPY ./vhosts/notification.conf /etc/nginx/tmp/notification.conf
COPY ./vhosts/es-sync.conf /etc/nginx/tmp/es-sync.conf

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
