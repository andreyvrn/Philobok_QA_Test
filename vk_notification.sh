#!/bin/sh
#!/bin/bash
# -*- coding: UTF-8 -*-

# URL для API ВКонтакте
BOT_URL_VK="https://api.vk.ru/method/messages.send?"

# Функция отправки уведомлений
send_msg () {
    curl -s -X POST "${BOT_URL_VK}" \
        -d peer_id="$PEER_ID" \
        -d random_id=0 \
        -d message="$1" \
        -d access_token="$VK_TOKEN" \
        -d v=5.199
}

# Определение смайликов статуса
if [ "$job_status" = "success" ]; then
    STATUS_EMOJI="🎉"
else
    STATUS_EMOJI="🚨😭"
fi

# Формирование сообщения
MESSAGE="
${STATUS_EMOJI} Job triggered by ${event_name} event.
🐧 OS: ${runner_os}
💻 Python Version: ${python_version}
🖥️ Architecture: ${architecture}
Status: ${job_status}.
"

# Отправка сообщения
send_msg "$MESSAGE"
