#!/bin/sh

# Get the token from Travis environment vars and build the bot URL:

BOT_URL_VK="https://api.vk.com/method/messages.send?"
RANDOM=date +%s

# Use built-in Travis variables to check if all previous steps passed:
if [ $TRAVIS_TEST_RESULT -ne 0 ]; then
    build_status="failed"
else
    build_status="succeeded"
fi

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
-------------------------------------
Travis build *${build_status}!*
\`Repository:  ${TRAVIS_REPO_SLUG}\`
\`Branch:      ${TRAVIS_BRANCH}\`
\`Job Name:      ${TRAVIS_JOB_NAME}\`
\`Job Number:      ${TRAVIS_JOB_NUMBER}\`
\`Dist:      ${TRAVIS_DIST}\`
\`Cpu Arch:      ${TRAVIS_CPU_ARCH}\`
\`Python Version:      ${TRAVIS_PYTHON_VERSION}\`

*Commit Msg:*
${TRAVIS_COMMIT_MESSAGE}
[Job Log here](${TRAVIS_JOB_WEB_URL})
--------------------------------------
"
