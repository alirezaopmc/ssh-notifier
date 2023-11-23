#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Variables
if [ -f "$SCRIPT_DIR/.env" ]; then
    while IFS= read -r line; do
        export "$line"
    done < "$SCRIPT_DIR/.env"
else
    echo "Error: The .env file is missing."
    exit 1
fi

# Determine if the event is a login or logout
if [ "$PAM_TYPE" == "open_session" ]; then
    IN_OR_OUT="in"
else
    IN_OR_OUT="out"
fi

# Check if the current user matches the target user
IP_ADDRESS="$PAM_RHOST"
HOSTNAME="$(hostname)"
MESSAGE="User $PAM_USER logged $IN_OR_OUT IP=$IP_ADDRESS HOSTNAME=$HOSTNAME via SSH."

"$SCRIPT_DIR/scripts/send_message.sh" "$CHAT_ID" "$TELEGRAM_BOT_TOKEN" "$MESSAGE" true
