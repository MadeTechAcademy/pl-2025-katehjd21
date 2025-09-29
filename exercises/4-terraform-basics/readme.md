# Terraform basics

In later exercises we will be using aws s3 as a state provider for our terraform

**NB.** 
- If your github handle is longer than 19 characters, speak up as this might cause issues for task 2
- The aws sandbox account gets cleared down every Friday, re-running exercises after that will fail unless you run these 2 tasks again first

## Tasks

1. Set up a state bucket. Local terraform state for this bootstrap task is fine.
   - Clone this repo: https://github.com/tess-barnes-uk/terraform-s3-bootstrap
   - Follow the readme instructions to create an s3 bucket for your own statefiles, we will use these in later exercises.
2. Set up a github/aws link, This will allow your github repo to act on the aws sandbox account via pipelines, using the restricted permission role given. 
   - In the `github_aws/` folder, update variables file with the values matching the comments  
   - Validate, plan and apply the terraform in `github_aws/` to the sandbox account from your machine. The inner readme will help.

## Outputs

Keep a note of the following to use later:
- the state bucket name = kates-s3-bucket,
- the name of your key alias for your state bucket = kates-s3-bucket
- the role *arn* that the github/aws link can assume = arn:aws:iam::261219435789:role/GHAction_AssumeRole_MadeTechAcademy_pl-2025-katehjd21

## Notes
Check for .auto and what it does.


