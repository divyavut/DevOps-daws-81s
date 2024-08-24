### Frontend

The frontend is the service in Expense to serve the web content over Nginx. This will have the web frame for the web application.

This is a static content and to serve static content we need a web server. This server

Developer has chosen Nginx as a web server and thus we will install Nginx Web Server.

#### Install Nginx

     dnf install nginx -y

#### Enable nginx

      systemctl enable nginx

#### Start nginx

      systemctl start nginx

Try to access the service once over the browser and ensure you get some default content

#### Remove the default content that web server is serving.

     rm -rf /usr/share/nginx/html/*

#### Download the frontend content

    curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip

#### Extract the frontend content.

    cd /usr/share/nginx/html
    unzip /tmp/frontend.zip

Try to access the nginx service once more over the browser and ensure you get expense content.

#### Create Nginx Reverse Proxy Configuration.

     vim /etc/nginx/default.d/expense.conf

#### Add the following content

          proxy_http_version 1.1;

          location /api/ { proxy_pass http://localhost:8080/; }

          location /health {
          stub_status on;
          access_log off;
          }

#### Ensure you replace the localhost with the actual ip address of backend component server. Word localhost is just used to avoid the failures on the Nginx Server.

##### Restart Nginx Service to load the changes of the configuration.

     systemctl restart nginx

### Forward Proxy

Forwrad Proxy is a server that acts as intermediary between client and internet.

When Cilent requests a web page from the internet, the request first sent to forward proxy. the proxy then forward the request to target server,retrieves the resource,and send it back to client

#### features:

1. Client side proxy
2. Hide client side IP adress
3. Block the acess to certain websites or filtering content
4. caches frequently requested resources(web sites,.. etc)

#### Example

University has a strict internet policy and control what websites student can access. So They use forward proxy in the cilent side machine.

Corporate office install the software vpn(Cisco) in the client side laptop to strict the some website acess for the client.

### Reverse Proxy

Reverse proxy is a servers that sits between client devices(web server) and the backend servers, forwarding the client reuqests to the appropriate backer server based on the various factors like load, geo location of user, specific rules( path based routing , etc)

#### Features

0. Server side ProxyS
1. Distribute the incoming cinet requests across multiple backend server, thus improving the reliability and performance
2. Handles SSL Encryption and decryption on behalf of backend servers.
3. cache frequent acess content and serve it faster to user.

4. Application firewall
5. handle authentication and Authorisation before forwarding request to backend.

#### Example

Laod balancer, Nginx, CDN, Service mesh, Ingress controller....etc.
