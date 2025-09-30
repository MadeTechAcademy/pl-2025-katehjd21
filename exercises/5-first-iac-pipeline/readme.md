# Configure and run your first iac pipeline

This is a very simple pipeline running terraform to create an s3 bucket.
It will need the tf state s3 bucket and github aws link to already exist. You will need the outputs from exercise 4.

## Task

Get your first pipeline up and running
1. Update the bucket and key alias in the `provider.tf` file
2. Set up variables and secrets in your github repo in the settings section. This means anything listed as var.x or secrets.x in the yml files.
3. Copy the two yml files into the .github/workflows folder, commit and push
4. Trigger the simple pipeline and confirm it has run correctly
5. Trigger the simple_cleanup_pipeline and confirm it has run correctly

## Hint 
There could be more than one way to check the pipeline has completed, what ways can you think of?

## Notes
The variables created in the simple.yml file are what is used later on in the pipeline. 
Don't forget to change provider.tf if you need to rename or change anything!
