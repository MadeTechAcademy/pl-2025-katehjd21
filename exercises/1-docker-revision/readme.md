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
Docker compose runs one or multiple containers.