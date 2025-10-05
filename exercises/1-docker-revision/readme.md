# Using docker
There's a basic node app in the docker-app folder.

## Tasks

- Build a docker image using the given dockerfile
- Run the image you have built in a local container (in detached mode)
- Visit the site at http://localhost:3000
- Check the logs of the running app in the container
- Stop and remove the container

### Notes
Building the image creates the blueprint for the app and docker run creates a container of that image which is a runnable version of the app. 
Docker logs is a really useful tool to log what is happening with your container, for example, what port it is listening on.

## Stretch task
Consider how you might use `docker compose` tools to locally to build, spin up, shut down and clean up containers



### Record your results

## Task 1
Built the Docker image using the command: `docker build -t pipelines2025/ex1/docker-revision-app -f Dockerfile .`
- `docker build` = tells Docker you want to build a Docker image
- `-t pipelines2025/ex1/docker-revision-app` = naming the image
- `-f Dockerfile .` = specifies the Dockerfile to use for building the image. The '.' meaning in
the current working directory.

I then ran the command: `docker images | grep pipelines2025/` which gave me a list of all the Docker images I have built
with `pipelines2025/` in it. 

A Docker image is a blueprint of your app that is a standardized package including all of the files, libraries, dependencies, and configurations that your app needs to run a Docker container. The Dockerfile contains all the instructions to build the image.


## Task 2
Ran the Docker image inside a newly created Docker container with the command `docker run --name pipelines2025-ex1-task2 -d --rm pipelines2025/ex1/docker-revision-app`
- `docker run` = runs a new Docker container, pulling the Docker image to do this.
- `--name` = assigns a name to the container.
- `-d` = runs the container in the background and prints the container ID (detached mode).
- `--rm` = automatically removes the container and any associated anonymous volumes (persistent data stores for containers) when it exits. 
- `pipelines2025/ex1/docker-revision-app` = this is the name of the image that you want to run in the container

You can also check that the container is running with the `docker ps` command.

A Docker container is a self-contained, runnable software application and is an instance of your Docker image. You can have an endless amount of Docker containers that are all running using the same Docker image.


## Task 4
Checked the logs of the running app in the container with the command: `docker logs pipelines2025-ex1-task2`

This gave me some details about the running Docker container including:
- "Using sqlite database at /tmp/todo.db"
- "Listening on port 3000"


## Task 5
Stopped the running container with the command: `docker stop pipelines2025-ex1-task2`

I didn't need to remove the container manually because we used the `--rm` in the `docker run` command so automatically removes the container when it stops. However, if I did want to remove the docker container manually, I could run the command: `docker rm pipelines2025-ex1-task2`.


## Stretch Task

**Docker compose** is a tool for defining and running multi-container Docker applications. Docker Compose allows you to define your application's services, networks, and volumes in a single YAML file called `docker-compose.yml`, making it easier to manage and orchestrate your containers.

**Building and Running Images/Containers**
1. `docker compose up`: this command is used to start and run the services defined in the `docker-compose.yml` file. It creates and starts the containers based on the specified configurations. Here's how it works:
- If you haven’t created the containers yet, `docker compose up` will build the images (if needed) and create the containers based on the services specified in the `docker-compose.yml` file.
- If the containers already exist (created by a previous `docker compose up` or `docker compose run` command), it will start those existing containers.

**Shutting Down and Removing Containers**
2. `docker compose down`: this command is used to stop and remove the containers created by `docker compose up`. It's a way to clean up and stop the services defined in the `docker-compose.yml`file. Here's how it works:
- It stops the running containers associated with the services defined in the `docker-compose.yml` file.
- It removes the containers (but not the images or volumes) that were created by `docker compose up`.


# The Difference between `docker build` and `docker compose up`
`docker build .` builds a single Docker image from a Dockerfile, while `docker compose up` builds (if necessary) and runs one or more containers based on the configurations in the `docker-compose.yml` file. This makes it ideal for multi-container applications or when your app requires multiple services like a web server and a database.

On my current delivery, we have created a `docker-compose.yml` file which runs a **payload container** (our application) and a **postgres container** (our database) so we have been using the commands `docker compose up` to build/run these, and `docker compose down` to shut down/remove these.