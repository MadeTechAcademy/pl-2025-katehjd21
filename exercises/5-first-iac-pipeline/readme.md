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

# Running Terraform Commands in a Pipeline
When using Terraform in a pipeline, Terraform commands should be executed within the pipeline rather than manually in your local terminal. Running commands locally could cause a number of issues including:

- Accidental misconfigurations: Local changes may not follow the pipeline’s validation and review processes.
- Environmental drift: Differences between your local environment and the target infrastructure can cause inconsistencies.
- Unapproved changes: Local execution can bypass code review, approvals, or automated checks defined in the pipeline.

Therefore, using the pipeline to run the Terraform commands ensures consistent and safe application of infrastructure changes.


# In the `simple.yml` & `simple_cleanup.yml` files:
- `-backend-config` = Overrides the backend configuration. In this case, it tells Terraform to use the S3 bucket specified by the environment variable $BUCKET_TF_STATE as the remote terraform state storage.
- `-no-color` = Disables colour codes in command output.
- `input=false` = Prevents Terraform from asking for interactive input. This is required in pipelines so Terraform doesn't hang waiting for user input.
- `auto-approve` = Skips the interactive approval prompt and instead auto approves it.
