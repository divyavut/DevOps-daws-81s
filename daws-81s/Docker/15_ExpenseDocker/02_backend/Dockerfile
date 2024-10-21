FROM node:20.18.0-alpine3.20 
EXPOSE 8080
ENV DB_HOST="localhost"
RUN mkdir /opt/server
WORKDIR /opt/server
COPY package.json .
COPY *.js .
RUN npm install 
CMD ["node", "index.js"]

# Before Best practice , this code is implemented

# FROM node:20 
# EXPOSE 8080
# ENV DB_HOST="localhost"
# RUN mkdir /opt/server
# WORKDIR /opt/server
# COPY package.json .
# COPY *.js .
# RUN npm install 
# CMD ["node", "index.js"]

