# HipChatCronJob
Here's to never forgetting to ask Michael how his day is going.

## Setup
### Generate a HipChat access token
Log into your [HipChat account](https://www.hipchat.com/account/api), select "Send Notification" in the scope, give it a label, and hit "create".

### Set that environment variable
Next save the HipChat token into an environment variable in your .bash_profile (or wherever you keep these things):
`export HIPCHAT_AUTH_TOKEN="h1Pch4TAuTHt0k3n"`

### Add a cron job
Next `cd` into this directory and run:
`ruby cli/add_cronjob "0 14 * * *" "/path/to/HipChatCronJob/message_scripts/status_query.rb"`

### Remove a cron job
Run `crontab -e` and delete whichever crontabs you're sick of.

### Change the message
Just change the message in `message_scripts/status_query.rb` to whatever you'd like to send [Michael Zemel](https://github.com/mzemel).

If you want to send a message to someone else, just add their name to your .bash_profile (it will override Michael):
`export HIPCHAT_RECIPIENT="@UserName"`

### Result
If—by some miracle—everything works, then every day at 2:00 you will automatically send [Michael Zemel](https://github.com/mzemel) a message asking how his day is going!

### Send Michael a HipChat from the command line.
Run `ruby send_message.rb "your message here"` to send Michael a message from the command line. Better yet, add an alias to your .bash_profile:
`alias hey_mike="ruby /path/to/HipChatCronJob/cli/send.rb"`

### Read your conversation with Michael from the command line.
Run `ruby recieve_message.rb` to read your conversation history with Michael. Better yet, add an alias to your .bash_profile:
`alias what_did_mike_say="ruby /path/to/HipChatCronJob/cli/read.rb"`
