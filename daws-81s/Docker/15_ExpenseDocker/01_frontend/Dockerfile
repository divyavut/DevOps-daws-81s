# This image  (nginx:mainline-alpine3.20-slim ) doesn't have all directories which needs nginx  so we have created them 
# https://medium.com/kocsistem/how-to-run-nginx-for-root-non-root-5ceb13db6d41
FROM nginx:mainline-alpine3.20-slim
RUN rm -rf /usr/share/nginx/html/* && \
    rm -rf /etc/nginx/nginx.conf   && \
    rm -rf /etc/nginx/conf.d/default.conf && \
    mkdir -p /var/cache/nginx/client_temp && \
    mkdir -p /var/cache/nginx/proxy_temp && \
    mkdir -p /var/cache/nginx/fastcgi_temp && \
    mkdir -p /var/cache/nginx/uwsgi_temp && \
    mkdir -p /var/cache/nginx/scgi_temp && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /etc/nginx/ && \
    chmod -R 755 /etc/nginx/ && \
    chown -R nginx:nginx /var/log/nginx && \
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid /run/nginx.pid
COPY nginx.conf /etc/nginx/nginx.conf 
COPY code /usr/share/nginx/html/
USER nginx

 # This is before Best practices
# FROM nginx
# RUN  rm -rf /usr/share/nginx/html/*
# COPY code /usr/share/nginx/html/
# RUN rm -rf /etc/nginx/nginx.conf
# RUN rm -rf /etc/nginx/conf.d/default.conf 
# COPY nginx.conf /etc/nginx/nginx.conf 
