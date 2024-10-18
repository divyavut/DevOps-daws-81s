FROM nginx 
COPY code /usr/share/html/index.html
# Existing Nginx official image is having two nginx configuration , 1. /etc/nginx/nginx.conf. 2. /etc/nginx/conf.d/default.conf. So we are remving both ocnfiguration and placing it in only one place.
RUN rm -rf //etc/nginx/nginx.conf
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf

