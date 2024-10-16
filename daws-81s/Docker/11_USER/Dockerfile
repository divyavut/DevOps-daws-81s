FROM almalinux
RUN dnf install nginx -y 
RUN useradd expense 
USER expense
CMD ["nginx", "-g", "daemon off;"]