
Docker compose - Laravel - MySQL - NGINX PROJECT

INSTALL INSTRUCTIONS
- first clonse the project repository to your machine

INSTALL the necessary packages
execute the command 
- ```composer install```

copy the env variables to a .env file
execute the command
- ```cp .env.example .env```

Disclaimer!!
Because this is a test project the full configuration is in the .env.example file. Never place credentials/passowrds/sensitive information in the code. It should be added afterwards in the .env file and never share that file. 

Now you have two choices either start it with random profile or without it
-    Start the services without random profile
    execute the command
    ```docker-compose up --build ```

-   Start the services with the random profile
    execute the command
    ```docker-compose --profile random up --build ```

after everything is up and the console shows everything is up and nginx started

retrieve the list of the docker containers. execute the command
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

Open your browser and navigate to ```devops.test:3000``` to show the welcome page where you will see the current users in the database
navigate to ```sub.devops.test:3000``` to be redirected to the main page.

if you started the container with the random profile navigate to the url ```devops.test:3000/thiio``` where you will find the text "Hello, this is the random HTTP service!"