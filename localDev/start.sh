#/bin/bash

sudo docker ps -a
sudo docker stop server_local
sudo docker rm server_local
sudo docker build ./ -f Dockerfile -t server_local_image
sudo docker run --name server_local -p 2800:80 -p 8080:8080 -it -v $PWD/../../:/home/user/ -d server_local_image
sudo docker exec -it server_local bash
