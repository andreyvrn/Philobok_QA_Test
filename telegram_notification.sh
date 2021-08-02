#!/bin/sh

# Get the token from Travis environment vars and build the bot URL:
BOT_URL="https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendMessage"

# Set formatting for the message. Can be either "Markdown" or "HTML"
PARSE_MODE="Markdown"


# Define send message function. parse_mode can be changed to
# HTML, depending on how you want to format your message:
send_msg () {
    curl -s -X POST ${BOT_URL} -d chat_id=$TELEGRAM_CHAT_ID \
        -d text="$1" -d parse_mode=${PARSE_MODE}
}

# Send message to the bot with some pertinent details about the job
# Note that for Markdown, you need to escape any backtick (inline-code)
# characters, since they're reserved in bash
VAR1 = ${job_status}
if [[VAR1 == "success"]]; then
            send_msg "
🎉 The job was automatically triggered by a ${event_name} event.
🐧 This job is now running on a ${runner_os} server hosted by GitHub!
💡 Python version ${repository_git} .
🖥️ Architecture: ${Architecture} .
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

