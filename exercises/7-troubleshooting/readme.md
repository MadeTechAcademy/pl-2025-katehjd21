# Trouble shooting

Not everything will be plain sailing. What do you do when it doesn't go green?
You might have already hit issues in previous exercises. If so, you will have already learned some techniques to help you out now.

## Tasks
1. Trigger the `7 Run Link Check` pipeline
   - Check if it passes or fails. If it fails, why does it fail, is there a real problem? If so, what action should be taken? 
   - Don't fix anything right now.
  
2. Trigger the Exercise 7.1 pipeline
   - check if it passes or fails
   - what should we do next?
   - lets do that, how has that worked out?
   - clear down any resources you have deployed

3. Trigger the Exercise 7.2 pipeline
   - check if it passes or fails
   - what should we do next?
   - lets do that, how has that worked out?
   - clear down any resources you have deployed

## Notes
# Task 1
The pipeline fails due to a broken link. In this case, that’s intentional. We want the failure to occur so that it alerts an engineer to review the repository and make the necessary changes to allow for a passing pipeline. This approach can help ensure that issues like broken links aren’t ignored and are addressed promptly.
If the pipeline only displayed a warning and continued to pass (i.e. still showed green), the broken link would likely go unnoticed and remain unfixed.


# Task 2
The pipeline fails due to a missing directory. In this example, the workflow is looking for:
`/home/runner/work/pl-2025-katehjd21/pl-2025-katehjd21/exercises/7-troubleshooting/deploy`
However, the deploy folder doesn't exist currently, which is why the pipeline fails. Because this folder is missing, there is also no Terraform files contained within it. Consequently, when the pipeline runs terraform init, there are no configuration files for Terraform to initialize, causing the failure.

To make the pipeline pass, we would need to create a deploy folder and add the necessary Terraform files (e.g., main.tf with the backend configuration for our S3 bucket) so that Terraform actually has a valid working directory to initialise.


# Task 3
