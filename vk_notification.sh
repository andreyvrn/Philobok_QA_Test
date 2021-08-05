#!/bin/sh

BOT_URL_VK="https://api.vk.com/method/messages.send?"

send_msg () {
    curl -s -X POST ${BOT_URL_VK} -d peer_id=$VK_PEER_ID \
        -d random_id=$RANDOM -d message="$1" -d access_token=$VK_TOKEN -d v=5.131
}
$a = [char]0xf12
if [ $job_status == "success" ]; then
send_msg "
$a
🎉 The job was automatically triggered by a ${event_name} event.
🐧 This job is now running on a ${runner_os} server hosted by GitHub!
💡 Python version ${repository_git} .
🖥️ Architecture: ${architecture} .
🍏 This job's status is ${job_status}.
"
else
 send_msg "
$a
😭😭😭😭😭😭
🎉 The job was automatically triggered by a ${event_name} event.
🐧 This job is now running on a ${runner_os} server hosted by GitHub!
💡 Python version ${repository_git} .
🖥️ Architecture: ${Architecture} .
🚨 This job's status is ${job_status}.
😭😭😭😭😭😭
"
fi
