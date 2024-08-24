### Nginx

#### nginx default configuration location

     /etc/nginx/nginx.conf

#### nginx looks for (root(DocumentRoot in Apache)) in the nginx configuration

we are telling nginx go and search for .html files in this location. development code will be placed in this folder.

        /usr/share/nginx/html

#### nginx additional configuration files

without changes the default configuration of nginx, we can add extra configuration files in this location

    include /etc/nginx/conf.d/*.conf;

### Define which servers to include in the load balancing scheme.

#### It's best to use the servers' private IPs for better performance and security.

#### You can find the private IPs at your UpCloud control panel Network section.

Add the upstream in the http stection of /etc/nginx/nginx.conf cofiguration file

        http {
        upstream backend {
        server 172.31.6.5;
        server 172.31.6.78;
        }

#### This server accepts all traffic to port 80 and passes it to the upstream.

#### Notice that the upstream name and the proxy_pass need to match.

Add loadbalancer.conf file in /etc/nginx/default.d/loadbalancer.conf

        server {
        listen 80;

            location / {
                proxy_pass http://backend;
            }

        }
        }

#### How Nginx works

User send Ip request to the Nginx(reverse proxy) which balance the incoming request and distribute the traffic across the multiple server.

1. Nginx server first look at the /etc/nginx/nginx.conf configuration file. read the servername, location of the index file(root) i.e .. /usr/share/nginx/html path.

2. now index.html file exexuted and display the content in the brower.

But here we are using nginx as reverse proxy. Multiple backend servers are added to the upstream in the http section of /etc/nginx/ngnix.conf.

Added loadbalance.conf file in the /usr/share/nginx/html/loadbalance.conf

            proxy_http_version 1.1;

            location / { proxy_pass http://backend/; }

            location /health {
            stub_status on;
            access_log off;
            }

#### Linux folder structure

---

/ --> root directory of the OS
/bin(binaries) --> essential commands are here. ls, cat, grep, etc.
/sbin(system binaries) --> admin commands, reboot, iptables, etc.
/boot --> when linux server started, it refers boot directory for system configuration
/dev(devices) --> monitor/terminal, keyboard, printers, etc.
/etc(extra configuration) --> system configuration files, service configurations, etc.
/home(home directory of users) --> all users directory are here, their personal files, user related configs..
/lib(Libraries) --> libraries/dependencies required by OS equal to .dll in windows
/lib64(64 bit libs)
/media(Media devices) --> CD, DVC, USB, etc.
/mnt(mount) --> adding extra disks
/opt(optional) --> if you want third party applications, custom applications you can keep here
/proc(processor) --> /proc/cpuinfo /proc/meminfo
/root (Root user) --> home directory of root user
/run (Running information of server)
/srv(service files) --> When you use your server to serve as file server, you can use this
/swap(Swap space) --> 1GM ram, OS will use this swap space for extension of RAM. Reserver space
/sys --> system kernal info, devices info, etc
/tmp --> temporary directory, not at all important
/usr --> shared files and docs between all users...
/var(variables) --> logs and messages
