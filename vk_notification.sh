#!/bin/sh

# Get the token from Travis environment vars and build the bot URL:

BOT_URL_VK="https://api.vk.com/method/messages.send?"
RANDOM=date + %s

# Define send message function. parse_mode can be changed to
# HTML, depending on how you want to format your message:
send_msg () {
    curl -s -X POST ${BOT_URL_VK} -d peer_id=$VK_PEER_ID \
        -d random_id=${RANDOM} -d message="$1" -d access_token=$VK_TOKEN -d v=5.126
}

# Send message to the bot with some pertinent details about the job
# Note that for Markdown, you need to escape any backtick (inline-code)
# characters, since they're reserved in bash
send_msg "
🎉 The job was automatically triggered by a ${event_name} event. <br>
🐧 This job is now running on a ${runner_os} server hosted by GitHub! <br>
🔎 The name of your branch is ${github_ref} and your repository is ${repository_git}. <br>
💡 The ${repository_git} repository has been cloned to the runner. <br>
🖥️ The workflow is now ready to test your code on the runner. <br>
🍏 This job's status is ${job_status}. <br>
"
