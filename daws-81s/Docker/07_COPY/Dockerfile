FROM almalinux
RUN dnf install nginx -y 
RUN rm -rf /usr/share/nginx/html/index.html
COPY index.html /usr/share/nginx/html/
CMD ["nginx", "-g", "daemon off;"]

