#!/usr/bin/env bash

# Function to display script usage
display_help() {
    echo "Usage: $0 <CHAT_ID> <TELEGRAM_BOT_TOKEN> <MESSAGE> [NOTIFY]"
    echo "Options:"
    echo "  -h, --help         Display this help message"
}

# Check for the help flag
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    display_help
    exit 0
fi

# Check if all required arguments are provided
if [ "$#" -lt 3 ]; then
    echo "Error: Insufficient number of arguments."
    display_help
    exit 1
fi

# Extract arguments
CHAT_ID="$1"
TELEGRAM_BOT_TOKEN="$2"
MESSAGE="$3"
NOTIFY=${4:-false}

# Check if NOTIFY is "true" or "false"
if [[ "$NOTIFY" == "true" ]]; then
    DISABLE_NOTIFICATION=true
else
    DISABLE_NOTIFICATION=false
fi

curl -X POST \
     -H 'Content-Type: application/json' \
     -d '{"chat_id": "'"$CHAT_ID"'", "text": "'"$MESSAGE"'", "disable_notification": '"$DISABLE_NOTIFICATION"'}' \
     https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage
