# Onboarding to the Backport Bot

## Requirements:
- You must be an admin on the repository that you're onboarding.

## Process:
1) You will need to add the Backport Trigger GitHub action to your repository. This can be done by following the steps [here](https://docs.github.com/en/free-pro-team@latest/actions/learn-github-actions/sharing-workflows-with-your-organization#using-a-workflow-template). The template is set up to work out of the box, but you can configure it to create backport branches on forks instead of the main repository by changing [this line](https://github.com/xamarin/.github/blob/main/.github/workflows/backport-trigger.yml#L24) to true.

2) Invite the [`vs-mobiletools-engineering-service2`](https://github.com/vs-mobiletools-engineering-service2) account to the repository with `Write` access. This is a special service account that cannot belong to any GitHub organization. This request will need to be approved manually -- please reach out to VSEng for help if it does not get accepted in a timely fashion.

And that's it :)

# Invoking the Backport Bot
Similar to v1, the backport bot can be invoked by writing the following command as a comment on the PR you wish to backport:
```
@vs-mobiletools-engineering-service2 backport $TARGET_BRANCH
```

Tab complete is your friend for the service account name.

This will then trigger the GitHub Action. If successful, the service account will say it launched an ADO job.

The ADO job will link back and say whether or not it succeeded with a link to the build.

If the action is unsuccessful at launching the job, you will see a comment mentioning that there were issues. There will be additional information in the Actions tab.

Please reach out to VSEng in Teams if you experience any issues.

**If there is no comment, it is likely that the command entered is not right.**
Check the summary for the action by clicking on the Actions tab on the home page of the repository.


The GitHub Action itself does not perform the backport, but launches an ADO job that performs the git magic. The yml pipeline for that can be found [here](https://github.com/xamarin/mono-github-trigger/blob/yaml-pipeline/backport-bot.yml).

The corresponding Azure DevOps pipeline can be found [here](https://devdiv.visualstudio.com/DevDiv/_build?definitionId=13834).
