## Q4. Explain the troubleshooting steps you would use on a failing pipeline, either those you learned on this course or those you have used on your delivery.

During the Pipelines course, we had quite a few interesting discussions around whether a pipeline should always show a green tick or whether showing errors can be beneficial. The conclusion was that it really depends on the context. Sometimes, a failing pipeline can act as a valuable prompt for engineers to investigate issues before they escalate, whereas a pipeline that always goes green may hide underlying problems.

When troubleshooting a failing pipeline, the first step is to determine the severity of the error and whether the workflow
should stop. Examples of errors that usually require stopping the workflow include failing tests, merge conflicts, and
compiler errors. On the other hand, the workflow may not need to stop for non-critical warnings, such as outdated packages.

Once this is decided, some of the troubleshooting steps I would take may include:
- Ensuring setup and use of secrets and variables is correct and accessible to the pipeline.
- Reading logs, metrics and YAML definitions to locate errors.
- Designing certain pipeline steps to fail intentionally in order to test error handling or prompt investigation.
- Consider separating recoverable errors into their own workflow or as a secondary job within the same pipeline, 
so that non-critical issues do not block the main workflow.