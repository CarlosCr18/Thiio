
Docker compose - Laravel - MySQL - NGINX PROJECT

INSTALL INSTRUCTIONS
- first clonse the project repository to your machine

Start the services without random profile
execute the command
- docker-compose up --build 

Start the services with the random profile
execute the command
- docker-compose --profile random up --build 

after everything is up and the console shows everything is up and nginx started

retrieve the list of the docker containers. execute the command
- docker container ps

Get the associated ip to the nginx container. execute the command
- docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <<replace this with the id of your nginx container>>

Because we are doing this locally we need to configure the hosts list. execute the command
- sudo nano /etc/hosts

A text editor will open now add below the 127.0.0.1 localhost line the ip of the nginx container then devops.test sub.devops.test

it should look like this (lets assume your nginx container ip is 179.29.0.5)
127.0.0.1  localhost
179.29.0.5 devops.test sub.devops.test

Open your browser and navigate to devops.test:3000 to show the welcome page where you will see the current users in the database
navigate to sub.devops.test:3000 to be redirected to the main page.