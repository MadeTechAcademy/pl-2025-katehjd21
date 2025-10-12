# Configure and run your first app related pipelines

This is a set of deployment pipelines running terraform
1. create and manage the infrastructure to deploy to
2. build and deploy the container image
3. create and manage the app runner


They will need the tf state s3 bucket and github aws link to already exist. You will need the outputs from exercise 4.

## Task

1. Get your infrastructure pipeline up and running
   - Set up variables and secrets in your github repo in the settings section. This means anything listed as var.x or secrets.x in the iac yml file.
   - Update the terraform state block in the correct folder with the details for your s3 state bucket and key alias, commit and push
   - Predict what the pipeline will do
   - Trigger the iac pipeline and confirm it has run correctly

2. Get your app runner pipeline up and running
   - Set up new variables and secrets in your github repo in the settings section. This means anything listed as var.x or secrets.x in the app runner yml file.
   - Update the terraform state block in the correct folder with the details for your s3 state bucket and key alias, commit and push
   - Predict what the pipeline will do
   - Trigger the deploy pipeline and confirm it has run correctly (it might take a few minutes to take affect after terraform has completed).

3. Get your container image deploy pipeline up and running
   - Set up new variables and secrets in your github repo in the settings section. This means anything listed as var.x or secrets.x in the deploy yml files.
   - Update the terraform state block in the correct folder with the details for your s3 state bucket and key alias, commit and push
   - Predict what the pipeline will do
   - Trigger the deploy pipeline and confirm it has run correctly (it might take a few minutes to take affect after terraform has completed).

4. Trigger the clean up pipeline and confirm it has run correctly

## Hints 
There could be more than one way to check a pipeline has completed, what ways can you think of?
What happens to any log groups or traces that get created? What about after clean up?

Aws has a developer guide for *everything*. Heres the one for [App Runner](https://docs.aws.amazon.com/apprunner/latest/dg/what-is-apprunner.html)

## Notes

# There could be more than one way to check a pipeline has completed, what ways can you think of?


# What happens to any log groups or traces that get created? What about after clean up?
