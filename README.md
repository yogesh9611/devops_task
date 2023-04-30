# node-js-getting-started

A barebones Node.js app using [Express 4](http://expressjs.com/).

This application supports the [Getting Started on Heroku with Node.js](https://devcenter.heroku.com/articles/getting-started-with-nodejs) article - check it out.

## Pre requisites setup

```sh
$ install docker and docker-compose on AWS VM
$ git clone https://github.com/heroku/node-js-getting-started.git # or clone your own fork. add code into this local repo
1. Created a VM on aws and installed docker and docker-compose

2. create a dockerfile for the heroku nodejs application

3. create docker image with docker build command

docker build -t demo:latest .

4. run the container with the below command

docker run -it -d -p 5000:5000 demo:latest

5. Now we can see in the browser the application of NodeJS has been deployed successfully with the help of Dockerfile.

6. Once the application is running with dockerfile, we can create the docker-compose and run the same so that it will spin up all the docker containers for the task with loki, grafana, promtail.

7. docker-compose up -d , run this command and see docker ps if all containers are created or not

output of docker ps after running the docker-compose command:-

![image](https://user-images.githubusercontent.com/41733996/235372740-1333eb05-eb99-43ca-9911-b3be54f17b35.png)




```

NodeJS app running on Heroku platform -  http://54.91.231.140:5000/

Your app should now be running on ![image](https://user-images.githubusercontent.com/41733996/235372231-d8f6138a-4ab7-47ce-ac5f-67b539c7c8d5.png).


Logs of the node js application on - http://54.91.231.140:3000/

![image](https://user-images.githubusercontent.com/41733996/235372250-4328651c-83cb-4ef1-b8a7-350ed576d170.png)


## Dockerfile documentation for the task:-

The first line specifies the parent image we're using, which is the official Node.js runtime image based on Alpine Linux.

We set the working directory to /app and copy the package.json and package-lock.json files to the container.

We then run npm install to install the production dependencies.

After that, we copy the rest of the application code to the container.

We set the environment variables for the application, including the port it will listen on and the environment (production).

Finally, we expose port 5000 (the default port for the application) and start the application with npm start command.


## Docker-Compose Documentation for the task:-

We have four services in this docker-compose file: nodejs, promtail, loki, and grafana.

nodejs service is built using the Dockerfile we created earlier. It is set to use the production environment and listen on port 5000. We also configure logging for the application to send logs to Loki.

promtail service uses the official Grafana Promtail image and mounts a local directory with Promtail configuration.

loki service uses the official Grafana Loki image and exposes port 3100 for external access.

grafana service uses the official Grafana image and exposes port 3000 for external access. We set environment variables for the initial admin user and password.
All services are connected to the monitoring network for communication between each other.

Overall, this docker-compose file sets up a complete monitoring stack with Loki, Grafana, Promtail, and our NodeJS application. Logs from the application are 

collected by Promtail and sent to Loki for storage and querying, while Grafana provides a dashboard for visualizing and analyzing the logs.

Here is an explanation of each section of the Compose file:

version: This specifies the version of Docker Compose being used.

services: This is the top-level section that defines the services in the application.

nodejs-app: This service builds a Docker image from the current directory (.) and exposes port 5000 on the host machine. It also adds labels to the container for log collection using Promtail. The logging section specifies that logs should be sent to Loki using the gelf driver.

grafana: This service uses an official Grafana image and exposes port 3000 on the host machine. It mounts a configuration file for data sources and sets environment variables for anonymous authentication. It is also attached to the app network.

loki: This service uses an official Loki image and exposes port 3100 on the host machine. It sets the command to use a local configuration file.

promtail: This service uses an official Promtail image and attaches to the loki service. It mounts configuration files for Promtail and Docker, as well as the Docker socket, to read container logs. It also sets the command to use a local configuration file.

networks: This is a top-level section that defines the networks used by the application. The app network is used by all services and is created with the name specified.

Overall, this Compose file defines a complete logging stack for a simple Node.js application.


## Wordy Numbers

This is a simple shell script that prints the numbers from 0 to 100, and converts every tenth number to a wordy version.

To run the script, navigate to the directory where the script is saved, and execute the following command in your terminal:

bash wordy_numbers.sh

The script defines a function to_word() that takes a number as input and returns its wordy version. The wordy version is stored in a case statement that maps every 

number from 0 to 100 to its wordy version. If the input number is not within this range, the function returns the input number as is.

Next, the script defines the range of numbers to print, from 0 to 100, and uses a for loop to iterate over this range. For every number in the range, the script 

checks if it is a tenth number (i.e. divisible by 10). If it is, the script calls the to_word() function to convert the number to its wordy version, and prints this 

wordy version. Otherwise, the script simply prints the number as is.


## Output of the task:- 

![image](https://user-images.githubusercontent.com/41733996/235372968-08be4bce-e9c7-489b-9f3c-7d246fd0ffb4.png)



## Documentation



For more information about using Node.js on Heroku, see these Dev Center articles:

- [Best Practices for DOCKER Compose](https://docs.docker.com/develop/dev-best-practices/)
- [Best Practices for writing dockerfile](https://devcenter.heroku.com/articles/node-websocketshttps://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
