FROM node:20
EXPOSE 8080
ENV DB_HOST="mysql"
RUN mkdir /opt/server
WORKDIR /opt/server
COPY package.json .
COPY *.js .
RUN npm install 
CMD ["node", "index.js"]
https://github.com/daws-81s/expense-docker/blob/main/frontend/Dockerfile