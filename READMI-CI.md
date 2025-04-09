# CI PROJECT OVERVIEW
- I'm working with an angular front-end to implement containerization via docker. The purpose of this project is to understand how and why to use containers. We are using containers to create an environment that runs the same of any system despite the local files that exist. That means when someone accesses my website, it runs on the containers angular and node version, and voids whatever local versions are installed. This creates an even playing field for anyone trying to access my site.

# How to containerize
- Docker is the only thing we need to download to containerize. To actually create the code via angular, node.js, typescript etc. is a different problem that is not addressed here.

- To run the container without building an image for it if you for some reason wanted to do this you can use a pre-existing image from dockerhub. After you have that image, you can use the `docker run` command. You will have to add additional flags to the command to specify the working directory, and mount location.

- The instructions that exist inside my Dockerfile include the image to use (node:18-bullseye), the working directory (where commands will get ran), the json files that configure the angular app, npm install to install all dependencies inside of the angular config (.json), all of the rest of the project files, the port to expose the site too, and ng serve to start the app and specify the host so it allows connections from anywhere.

- Now that we have our Dockerfile we can build the image. This is straight-forward, we can just use `docker build -t <image_name> .` The image name is whatever you want to call it, I called it angular-site. The "." is to specify to build it in the current directory.

- Now that we have an image we can run this image to start the site. I used `docker run -p 4200:4200 angular-site` This will run the site and make it accessible in port 4200.

- To view the application go to port 4200 in your web browser using local host.

# DockerHub:
- To create a repo to store images in, go to dockerhub, make an account, create a new repo.

- You can authenticate your dockerhub to your local in several ways, all of which include logging in some fashion. I created a public access token in dockerhub, then in my cli, i ran `docker login -u ohill26`. This would prompt me for a password which is generated when creating the PAT. Now there is an established connection.

- To push an image you can tag it, then push it. In my case, I just rebuilt the original image that was called "angular-site" to "ohill26/hill-ceg3120" and ran `docker push ohill26/hill-ceg3120`. This will also generate a default tag for you.


# Link to dockerhub:
- https://hub.docker.com/repository/docker/ohill26/hill-ceg3120/general
