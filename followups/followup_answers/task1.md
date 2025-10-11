## Q1. Explain how the code on your delivery is packaged and deployed.

In the delivery I am working on, our deployment pipeline is defined using Terraform, which provisions an AWS CodePipeline pipeline.
There are many other pipelines in the project that run earlier, mainly in GitHub workflows, which ensure that all code is tested and passes required checks before it can be merged into the main branch. However, to answer this question, I will just be talking specifically about our deployment pipeline.

Please see the steps below for the deployment pipeline on the project I am currently working on:

* Step 1:
An AWS CodePipeline is created as a resource and is set to run **when triggered**. An S3 bucket is also set up to act as the
artifact store which stores artifacts produced at each stage of the pipeline.

* Step 2 - **SOURCE STAGE**:
The source stage is defined and this initially sets the pipeline to be triggered when there has been a commit to the GitHub 
repository (defaulted to the main branch). This pulls the latest code from GitHub and stores this as an artifact in the artifact store that was created in the step above. If not pulling the latest code from GitHub, the pipeline is also set to pull the latest Docker image from ECR instead.

* Step 3 - **BUILD STAGE**:
The build stage is then defined and has a couple of different tasks to complete:
- It first of all builds the App Docker Image which is where the code or image that was stored in the artifact store from the source stage is built using AWS CodeBuild. The information about the image is then stored in an artifact so that the deploy stage of the pipeline knows what to deploy to ECS.
- There is also an optional build smoke test image which builds a docker image specifically for smoke tests.
- The build stage then finalises with preparing the deployment artifacts by creating the files needed for deployment 
(e.g. task definitions, container name, ports, etc.) based on the built images. These are then passed on to the deploy stage so that it knows what image, container, and environment to use. 

* Step 4 - **DEPLOY STAGE**:
The deploy stage is created and uses the deployment artifacts created in the build stage. CodeDeploy is used to deploy a 
containerized app to ECS using these deployment artifacts.There is also an optional action in this stage that allows static 
files to be uploaded to an S3 bucket or synced from another S3 bucket.



*Optional Steps/Stages*:
1. Tests stage
If this condition is set to true, a Test stage is created in the pipeline which runs Lighthouse tests via CodeBuild on the project.

2. Promote Images stage
If set to true, this stage is created in the pipeline to promote Docker images between different ECR repo's using CodeBuild. 
This is used to move Docker images from the dev environment to the prod environent.

3. Tag & Release stage 
This is also a conditional stage so is only created if the condition is set to true. The aim of this stage is to finalise the
release process. It basically runs a CodeBuild job to tag Docker images in ECR with version labels. It also runs another CodeBuild job to created a GitHub release from the deployment artifacts. This stage helps make the deployment reproducible and visible in both AWS and GitHub.