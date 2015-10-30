# HipChatCronJob
Here's to never forgetting to make conversation with Peter.

## Setup
### Generate a HipChat access token
Log into your [HipChat account](https://www.hipchat.com/account/api), select "Send Notification" in the scope and hit "create".

### Set that environment variable
Next save the HipChat token into an environment variable in your .bash_profile (or wherever you keep these things):
`export HIPCHAT_AUTH_TOKEN="h1Pch4TAuTHt0k3n"`

### Add a cron job
Next `cd` into this directory and run:
`ruby cli/add_cronjob "0 14 * * *" "/path/to/HipChatCronJob/message_scripts/peter_query.rb"`

### Remove a cron job
Run `crontab -e` and delete whichever crontabs you're sick of.

If you want to send a message to someone else, just add their name to your .bash_profile (it will override Peter):
`export HIPCHAT_RECIPIENT="@UserName"`

### Result
Every day at 2:00 you will automatically make conversation with [Peter Kagey](https://github.com/peterokagey)!

