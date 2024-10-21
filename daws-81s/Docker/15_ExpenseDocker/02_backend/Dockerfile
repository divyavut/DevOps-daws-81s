FROM node:20.18.0-alpine3.20 
EXPOSE 8080
ENV DB_HOST="mysql"
# Create a group and user , -S (System user)
RUN addgroup -S expense && adduser -S expense -G expense
RUN mkdir /opt/server
RUN chown -R expense:expense /opt/server
WORKDIR /opt/server
COPY package.json .
COPY *.js .
RUN npm install 
USER expense
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

