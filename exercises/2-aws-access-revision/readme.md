# aws access

## Tasks

Knowing what you already know about connecting to the aws sandbox and running command line arguments

- review anything in the tips documentation you want to brush up on
- connect to the aws sandbox in a terminal window
- run the aws command line command to retrieve a list of s3 buckets on the account

## Notes

# Connecting to the AWS Sandbox & Running Commands

1. Used my SSO login credentials that I received to allow me access to the Made Tech Sandbox in AWS ensuring MFA was set up.
2. Re-installed AWS vault - a secure, temporary login manager for your AWS CLI credentials.
3. Added the relevant information needed for access to the Made Tech Sandbox in the `~/.aws/config` file on my local machine.
4. Tested everything was working with the command: `aws-vault exec mt-playground -- aws sts get-caller-identity`
5. Ran every AWS CLI command from here onwards in the same way: `aws-vault exec mt-playground -- {command}`. For example, the task asked me to retrive a list of S3 buckets on the account therefore, I ran:
- `aws-vault exec mt-playground -- aws s3 ls`
- `aws-vault exec mt-playground -- aws s3api list-buckets` (for nicely ordered json buckets)

# Explanation for Step 5
For step 5, its basically saying, "Run a command using my mt-playground AWS credentials, but do it securely through AWS Vault.”
- `aws-vault exec` = tells AWS Vault you want to execute a command using one of your stored profiles, which in this case is mt-playground.
- `mt-playground` = the name of my AWS profile. AWS Vault then looks this up in my system keychain and retrieves my Access Key ID and Secret Key.
- `--` = separates AWS Vault’s arguments from my actual AWS or shell command
- `{command}` = whatever command I want to run e.g. `terraform apply`

AWS Vault then runs that command inside a secure, temporary session using valid, short-lived AWS credentials.




