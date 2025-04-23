# Semantic versioning

## Generating Tags
- To see tags in the repo, it's easy, run the command: `git tag`
- Generating a tag is just as easy, run the command: `git tag -a v<version number>`. Example - `git tag -a v3.8.1`
- To push a tag, run the command: `git push origin <tag>`. Example - `git push origin v3.8.1`

## Semantic Versioning Container images with github actions

- My new workflow will now execute the job based on when a git tag is pushed instead of when something is pushed to main branch. It still builds a docker image, but now it tags the image with the specified version. Before, it was always tagged with "latest". Then the image gets pushed to DockerHub same as before.

- The steps are similar, but there are a couple new steps and some old ones were changed. The job now executes upon tag push. The code gets pulled into the runner (same as before). The tag will get generated using the metadata-action, this will generate either major, minor, patch, or latest (this is new). Login into DockerHub using github secrets (same as before). Build and push the image with the generated tags (the tags are new, before was always latest).

- The values in the yaml file that would need to updated if used in a different repository: images would require a new repo name. Context would require the new directory where the Dockerfile is. The DOCKERHUB_TOKEN would need to be different as well because it's connected to the current repo using a PAT.
- If it's a new project then the Dockerfile would need updated, and the workflow file itself would need to exist in the new repo as well.

- Workflow link: https://github.com/WSU-kduncan/ceg3120-cicd-OHill26/tree/main/.github/workflows


## Testing

- There are several ways to test if the workflow did it's tasking. I will visually show it by pushing a tag, then taking a screenshot of the logs success.

- To verify if the DockerHub Image works you can pull the image, using a specified existing tag, and run it. Then you can see if the correct version is running on your local system.

![image_description](images/Semantics.png)



# Continuous deployment

## EC2 details
- AMI Details: I switched my AMI to Ubuntu version 20.04. Previously, I used Amazon-Linux 2 for my projects but this was not fun to use.
- InstanceType info: I switched my instance type from t2.micro to t2.medium to meet the requirements of 2 CPU Core and 4 GB RAM.
- VolumeSize: I specified to allocate 30gb of disk space. Honestly, I'm not sure why 30 is picked. I didn't think the docker files were that large. But this is would I did because it follows the lab document.
- SecurityGroup config: I left everything that I had previously from project 2, but I added access anywhere from and to port 9000 from anywhere.
- SecurityGroup Justification: This is so I can have my script implement the continuous development. Port 9000 is where I have my site set up so it is where the webhook listening is implemented. Now I allowed my ec2 instance to get post requests from port 9000 so my script can run when it receives the request.

## Docker Setup for the instance
- Installing Docker: To install docker on the instance, I was able to use apt instead of dnf now, but in my yaml file I was able to run `apt install -y docker.io`. The 'y' automatically answers yes to any installation questions. I also started and enabled docker and had it pull my image from DockerHub and run it.
- Dependencies: I didn't install any dependencies like angulor or node because I pulled my image from my repo which contains everything I need to run the container.

# References for Project 5

- For part 1, I used generative AI to make the new additions of my yaml file. The prompt I gave was my current yaml file, and I said to make these changes, then I pasted the task#2 to the prompt.
- Asked ChatGPT how to test that the DockerHub Image works using the specified versions.

