#!/bin/sh
# -*- coding: UTF-8 -*-

# URL API для отправки сообщений
BOT_URL_VK="https://api.vk.com/method/messages.send?"

# Функция для отправки сообщения
send_msg () {
    curl -s -X POST "${BOT_URL_VK}" \
        -d peer_id="$PEER_ID" \
        -d random_id=0 \
        -d message="$1" \
        -d access_token="$VK_TOKEN" \
        -d v=5.199
}

# Определение версии Python и архитектуры, если они не заданы
PYTHON_VERSION=$(python --version 2>&1) # Извлечение версии Python
RUNNER_ARCH=$(uname -m) # Определение архитектуры

# Проверка статуса и формирование сообщения
if [ "$job_status" = "success" ]; then
    STATUS_EMOJI="🎉"
else
    STATUS_EMOJI="🚨😭"
fi

# Формирование сообщения для отправки
MESSAGE="
${STATUS_EMOJI} Job triggered by a ${GITHUB_EVENT_NAME} event.
🐧 OS: ${RUNNER_OS}
💻 Python Version: ${PYTHON_VERSION}
🖥️ Architecture: ${RUNNER_ARCH}
Status: ${job_status}.
"

# Отправка сообщения
send_msg "$MESSAGE"
