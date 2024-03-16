#!/bin/sh

# Get the token from Travis environment vars and build the bot URL:

BOT_URL_VK="https://api.vk.com/method/messages.send?"


# Define send message function. parse_mode can be changed to
# HTML, depending on how you want to format your message:
send_msg () {
    curl -s -X POST ${BOT_URL_VK} -d peer_id=$PEER_ID \
        -d random_id=0 -d message="$1" -d access_token=$VK_TOKEN -d v=5.199
}

# Send message to the bot with some pertinent details about the job
# Note that for Markdown, you need to escape any backtick (inline-code)
# characters, since they're reserved in bash
if [ $job_status == "success" ]; then
send_msg "
🎉 The job was automatically triggered by a ${event_name} event.
🐧 This job is now running on a ${runner_os} server hosted by GitHub!
💡 Python version ${repository_git} .
🖥️ Architecture: ${architecture} .
🍏 This job's status is ${job_status}.
"
else
 send_msg "
😭😭😭😭😭😭
🎉 The job was automatically triggered by a ${event_name} event.
🐧 This job is now running on a ${runner_os} server hosted by GitHub!
💡 Python version ${repository_git} .
🖥️ Architecture: ${Architecture} .
🚨 This job's status is ${job_status}.
😭😭😭😭😭😭
"
fi
