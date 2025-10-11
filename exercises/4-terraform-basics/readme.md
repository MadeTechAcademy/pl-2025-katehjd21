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
- the state bucket name 
- the name of your key alias for your state bucket
- the role *arn* that the github/aws link can assume 

## Notes

# Terraform State files and why they are needed
Terraform must store state about your managed infrastructure and configuration. This state is used by Terraform to:
- Map real world resources (e.g. in this case, our AWS S3 bucket we created) to your configuration.
- Keep track of metadata e.g. dependencies.
- Improve performance for large infrastructures by allowing Terraform to quickly determine which resources need to be updated.

By default, this state is stored in a local file named: `terraform.tfstate`.

Terraform uses state to determine which changes to make to your infrastructure when the `terraform apply` command is run. Before making any changes, Terraform performs a refresh to update the state with the current status of the real infrastructure. This ensures that the planned changes are accurate and reflect the true state of your resources.

# Storing Terraform State file in S3 bucket
There are a number of different reasons why we might want to store Terraform state in a remote backend like an AWS S3 bucket, such as, for team environments and CI/CD pipelines.
In CI/CD pipelines, a remote state ensures that Terraform always operates on the latest infrastructure state, which helps make deployments consistent and predictable. It also allows multiple engineers to work on the same infrastructure without overwriting each other’s changes. By keeping the state in a shared S3 bucket, all team members and CI/CD pipelines have a single source of truth, preventing conflicts/issues with Terraform state.


# Terraform Commands Used

- `terraform init` = Prepares your working directory for other commands.
- `terraform validate` = Checks whether the configuration is valid.
- `terraform plan` = Shows changes required by the current configuration.
- `terraform apply` = Creates or updates infrastructure.
- `terraform destroy` = Destroys previously-created infrastructure


## Added Task - Check for `.auto.tfvars` and what it does.

In Terraform, an `.auto.tfvars` file is a special file used to automatically assign values to variables without needing to specify them on the command line. This makes it easy to define default values for variables in your Terraform configuration and simplifies managing different environments.

These files are often used to store sensitive information, such as access keys, secret keys, or other credentials as is the case in this exercise. Typically, `.auto.tfvars` files are included in .gitignore to prevent them from being committed to version control, helping keep sensitive information secure.

