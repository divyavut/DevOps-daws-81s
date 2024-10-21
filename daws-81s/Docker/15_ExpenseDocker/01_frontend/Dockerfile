FROM NODE:20
RUN  rm -rf /usr/share/nginx/html/*
COPY code /usr/share/nginx/html/index.html
RUN rm -rf /etc/nginx/nginx.conf
RUN rm -rf /etc/nginx/conf.d/default.conf 
COPY nginx.conf /etc/nginx/nginx.conf 

