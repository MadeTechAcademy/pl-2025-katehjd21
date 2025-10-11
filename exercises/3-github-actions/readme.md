# Build and test an app

## Task Instructions
There is a basic node app provided in the `app` folder. It gets all its dependencies publically from nodejs.

We need a pipeline to 
- checkout the code, 
- install the dependencies, 
- check for outdated packages
- prettify the code and 
- run the tests.

We would like the pipeline to run on each push to `main`

- Create the configuration for the pipeline in the `exercise_3_app_build.yaml` file including name, trigger, and job that runs on ubuntu-latest.
- Add steps to the job which check out the code, support the node environment and run the necessary commands.
- Move the config file into `.github/workflows` folder and commit & push your code.
- Use the github web interface to find the pipeline and trigger it, then check it has run correctly.

## Hints
- Check which folder the commands need to run in
- Check the version of node for the project in the `.nvmrc` file
- Be aware that for safety, you will want to use pnpm to install and manage packages and scripts
- Check the available runnable pnpm `scripts` in the `package.json` file

## If you're stuck
- Review the helpful resources in the documentation folder
- Look at the `example.yaml` in the workflows folder, this will not solve it all but might get you started

## Stretch tasks
How would you temporarily suspend the pipeline so it didn't run on a push?
For discussion: What else is missing from this pipeline? (no need to add it right now)

## Notes

# Explaining the Pipeline Created

```yaml
name: Exercise 3 Pipeline
``` 
This gives the Pipeline a name so when you look at the 'Actions' section in your GitHub repo, you should see this name as it runs the pipeline.

```yaml
on:
  push:
    branches:
      - main
```
This ensures the pipeline runs every time there is a commit/push to the main branch.

```yaml
jobs:
  ex3-pipeline-jobs:
    runs-on: ubuntu-latest
    defaults:
      run:
        working-directory: ./exercises/3-github-actions/app
```
Defines a 'jobs' block that has 'steps' within this which I will go through what each step does below. 
- `ex3-pipeline-jobs` is the name of this specific job.
- `runs-on: ubuntu-latest` specifies the environment the job runs on which in this case is the latest ubuntu virtual machine.
- `defaults run: working-directory: ./exercises/3-github-actions/app` means any **run** commands inside this job will by default execute in the folder **./exercises/3-github-actions/app,** so you don’t have to cd there manually in each step.

```yaml
    steps:
```
Jobs are made up of multiple steps. These are executed in the order that you write them.

```yaml
      - name: Checkout the code
        uses: actions/checkout@v5
```
This tells GitHub to use the pre-made action actions/checkout, specifically version 5. This action checks out the repo’s code into the runner (the virtual machine) where the workflow is running. This means all subsequent steps can access the files in the repo.

```yaml
      - name: Install pnpm
        uses: pnpm/action-setup@v4
        with:
          version: 10
```
This installs version 10 of pnpm which means 'performant node package manager'. Once this has been installed, it can be used in all subsequent steps.

```yaml
      - name: Install dependencies 
        run: pnpm install 
```
Reads the package.json and pnpm-lock.yaml files, and uses pnpm to install all the dependencies required for the project. This ensures that subsequent steps in the workflow can use the installed packages.

```yaml
      - name: Check for outdated packages
        run: pnpm run outdated_check 
        continue-on-error: true
```
Runs the outdated_check script defined in package.json. This checks if any project dependencies are outdated. If outdated packages are found, it will display a warning but won’t fail or stop the workflow, because `continue-on-error: true` is set.

```yaml
      - name: Prettify code
        run: pnpm prettify .
```
Runs the prettify script defined in package.json, which formats all JavaScript files in the project according to Prettier’s configurations.

```yaml
      - name: Run tests
        run: pnpm test
```
Runs the test script defined in package.json, which executes all Jest tests in the project.

Had an interesting discussion on when we would want the workflow to stop on an error, and when we would want the workflow to continue on an error but just give us a warning. We spoke about `pnpm outdated` and whether this command should stop the workflow and we have to update packages or just use this command to warn us of outdated packages.

1. Purpose of `pnpm outdated`
- Checks for newer versions of the dependencies used in your project.
- Does not update anything but just reports outdated packages.
- Can be configured so that it just gives warning and continues the workflow rather than completely stopping the pipeline entirely.

2. Pros of Just Warning about Outdated Packages (Not Updating Automatically) 
- The workflow continues with a warning but doesn't completely stop the pipeline entirely.
- Prevents breaking changes that might occur if new package versions are installed automatically.
- Gives engineers the opportunity to review updates, check logs, and test changes before updating the dependencies.

3. Pros of Updating Packages Automatically
- Keeps dependencies consistently up to date.
- Reduces the risk of security vulnerabilities in outdated packages.
- Can be automated with tools like Dependabot in GitHub actions.