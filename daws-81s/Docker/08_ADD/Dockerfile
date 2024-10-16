FROM almalinux:9
RUN dnf install nginx -y 
RUN rm -rf /usr/share/nginx/html/index.html
ADD https://raw.githubusercontent.com/divyavut/DevOps-daws-81s/refs/heads/main/daws-81s/Notes/Session-01.md /usr/share/nginx/html/
CMD ["nginx", "-g", "daemon off;"]