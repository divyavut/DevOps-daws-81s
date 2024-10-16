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
- Set the environment variables, these can be used inside the container

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

