FROM openresty/openresty:alpine

COPY nginx/conf/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY nginx/conf/default.conf /usr/local/openresty/nginx/conf/conf.d/default.conf

EXPOSE 8080

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]