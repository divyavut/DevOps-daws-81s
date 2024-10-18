#### Docker 
- image ---> Official image will be like this
- username/image:version --> custom images should be in this format while pushing to docker hub.

#### CMD command
- CMD instruction run at the time of container of creation. it represents startup program for the container. It keeps the conatiner running.
- run nginx manually --> nginx -g daemon off;

#### RUN command 
- it is used to install packages and configure the images. Run command executes when image is created from docker file.

#### Systemctl 
- systemctl only works for full server, it will not work for containers.

   /etc/systemd/system/nginx.service
####  what diorectory the systemctl services will be present?
- /etc/systemd/system/nginx.service.
- command of nginx will be there in nginx.service. this command will be runned by Systemctl.
#### Docker commands
- docker tag <oldimage> <newimage> --> retag
- docker login -u <username>
- docker push <image_name>:<version>
- docker pull <image_name>:<version>
- docker logs -f <container_name/Container_id>


### RUN VS CMD
- RUN instruction will run at the time of image is creation
- CMD instaruction will run at time of container creation.


### Note: 
The command given in the CMD instruction should always infinite times

#### LABELS
It adds meta data to the image like description, who id the owner of the image. used to filter the images.

#### EXPOSE 
EXPOSE instruction used to let the image user knows that what ports will open when container runs. it only gives the container port information for the image user.

#### ENV 
- Set the environment variables to the container, this can be used inside the container.

#### ADD
- ADD Instruction is same as COPY , but it has to extra capabilities. 
    1. It can get files from internet
    2. It can extract the tar files and place the untar file into the container.

#### CMD VS ENTRYPOINT
- CMD can be overridne at runtime
- we can't override the ENTRYPOINT at runtime. If you try to do it, it will go and append to the entrypoint command.
- for better results and best practices,  CMD can provide an <Arguments> to the ENTRYPOINT, so we can mention default arguments through CMD and can override them at runtime.


#### USER 
For security you should not run the container using the root user, it must be the normal user. Atleasst last instruction should be USER <Some-user>.

#### WORKDIR
- cd will not work in the docker, we have to use WORKDIR instruction to change the directory.
- WORKDIR instruction is used to set the current working directory inside the docker image

#### ARG
- ARG is used as a Variables at image build time only, not inside the container.

#### ARG VS ENV
1. ENV variables is accessed at image build time and inside the container, ENV variables can be ovverriden  at container runtime

         docker run -d  -e APP_ENV=staging- --name container_name <image_name>  .
    
2. ARG  variables is accessed at the time of image creation. ARG values can be override at runtime while building the image with an option.
  
            docker build -t <image_name> --build-arg <key>=<value> .

3. we can use ARG Instruction before the FROM instrcution to supply the version to the base image.
4. ARG instruction before FROM instruction is valid until From Instruction, it can't be accessed  after FROM.


#### How can I access ARG values inside container
- We can assign the ARG value to the ENV variables.

     ENV var_name=$var_name

#### ONBUILD 
- Onbuild instruction will trigger only, when user is using the image which has Onbuild instruction as base image.

#### Docker Networking
- Three type of networking 
1. Host Networking
 - If container is  created using host network, it dont get container IP.
 - Conatainer only gets IP from host
 - If we launch all containers using host network, all containers(mysql,backend,frontend) communicate each other within the host using localhost
2. Bridge Networking
 - 
3. Overlay networking --> networking between multiple hosts

##### Expense Project

#### Mysql
1. Take one base os like almalinux:9, install mysql server
2. Take mysql server Official image (Dont bother about OS and packages(software), just run the application just placing the code) --> best option


Mysql ---> Administrator team will run sql scritps to configure the database server --->  best option
Backend ---> backend team can connect to mysql server and run the sql queries( here backend team requires the database root password to connect and run the sql scripts) 
