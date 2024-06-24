
# Docker compose - Laravel - MySQL - NGINX PROJECT


### Requirements (this project was created with the next specs):

- **PHP >= 8.2**
- **Composer >= 2.2.18**
- **Docker >= 26.1.4**
- **Docker-compose >= 2.27.1**
- **Linux Mint 21 or equivalent UNIX system**

## Install instructions
### Clone the project repository to your machine

### Install the necessary packages
execute the command 
- ```composer install```

### Copy the env variables to a .env file
execute the command
- ```cp .env.example .env```

Disclaimer!!
Because this is a test project the full configuration is in the .env.example file. Never place credentials/passowrds/sensitive information in the code. It should be added afterwards in the .env file and never share that file. 

### build the containers
Now you have two choices either start it with random profile or without it
-    Start the services without random profile
    execute the command
    ```docker-compose up --build ```

-   Start the services with the random profile
    execute the command
    ```docker-compose --profile random up --build ```

You are ready when everything is up and the console shows ```nginx-with-proxy     | STARTING NGINX```

### Set domains in local hosts
open a new console and retrieve the list of the docker containers. execute the command
- ```docker container ps```

Get the associated ip to the nginx container. execute the command
- ```docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <<replace this with the id of your nginx container>>```

Because we are doing this locally we need to configure the hosts list. execute the command
- ```sudo nano /etc/hosts```

A text editor will open now add below the 127.0.0.1 localhost line the ip of the nginx container then devops.test sub.devops.test

it should look like this (lets assume your nginx container ip is 179.29.0.5)
``` 
127.0.0.1   localhost
179.29.0.5  devops.test 
179.29.0.5  otherhost.test 
179.29.0.5  subhost.devops.test
```

### Load pages
-   Open your browser and navigate to ```devops.test:3000``` to show the welcome page where you will see the current users in the database
-   Open your browser and navigate to ```subhost.devops.test:3000``` to be redirected to the main page.

if you started the container with the random profile 
-   Open your browser and navigate to the url ```devops.test:3000/thiio``` where you will find the text "Hello, this is the random HTTP service!"
-   Open your browser and navigate to the url ```otherhost.test:3000/thiio``` where you will be redirected to devops.test:3000/thiio and find the text "Hello, this is the random HTTP service!"