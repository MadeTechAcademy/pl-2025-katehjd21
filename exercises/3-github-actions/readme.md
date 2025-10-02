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
pnpm outdate - should we update packages or just use this command to warn us of outdated packages.
