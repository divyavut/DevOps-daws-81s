#### Docker 
- image ---> Official image will be like this
- username/image:version --> custom images should be in this format while pushing to docker hub.

#### CMD command
- CMD instruction run at the time of container of creation. it represents startup program for the container. It keeps the conatiner running.

#### RUN command 
- Run command executes when image is created from docker file.

#### Systemctl 
- systemctl only works for full server, it will not work for containers.

   /etc/systemd/system/nginx.service

#### Docker commands
- docker tag <oldimage> <newimage> --> retag
- docker login -u <username>
- docker push <image_name>:<version>
- docker pull <image_name>:<version>


### RUN VS CMD
- RUN instruction will run at the time of image is creation
- CMD instaruction will run at time of container creation.


### Note: 
The command given in the CMD instruction should always infinite times

#### LABELS
It adds meta data to the image like description, who id the owner of the image. used to filter the images.

#### EXPOSE 