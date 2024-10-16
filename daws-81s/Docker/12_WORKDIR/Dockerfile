FROM almalinux
RUN mkdir /tmp/docker
# RUN cd /tmp/docker --> cd will not work in continer , instead use WORKDIR
WORKDIR /tmp/docker
RUN echo "Hello" > hello.txt
RUN pwd
CMD ["sleep", "100"]
