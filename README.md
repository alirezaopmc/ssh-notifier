Telegram SSH Notifier

<img width="752" alt="image" src="https://github.com/alirezaopmc/ssh-notifier/assets/35873101/d7093063-d949-4568-9ed0-4dcee8c20b24">


# Overview
This is a simple Telegram SSH notifier script written in Bash. It sends notifications to a specified Telegram chat whenever an SSH session is initiated on the server.

# Installation
## Step 1: Copy the Directory
Copy the ssh-notifier directory to the /usr/local/ directory to make it accessible publicly.

```bash
cp -r ssh-notifier /usr/local/
```

## Step 2: Update PAM Configuration
Open the /etc/pam.d/sshd file and add the following line at the end. This line invokes the notifier script with relevant parameters.

```bash
session required pam_exec.so /usr/local/ssh-notifier/app.sh "$PAM_USER" "$PAM_RHOST"
```

## Step 3: Restart SSH Service
Restart the SSH service to apply the changes.

```bash
service ssh restart
```

# Configuration
Prior to utilizing the notifier, ensure that you create a .env file containing the necessary variables:

```bash
TELEGRAM_BOT_TOKEN="YOUR_BOT_TOKEN"
TELEGRAM_CHAT_ID="YOUR_CHAT_ID"
```
Replace YOUR_BOT_TOKEN and YOUR_CHAT_ID with your actual Telegram bot token and chat ID.

# Usage
Once configured, the notifier will send a Telegram message whenever a user logs into the server via SSH.

# Additional Notes
Ensure that the necessary permissions are set for the script and that it is executable. You can use the following command:

```bash
chmod +x /usr/local/ssh-notifier/app.sh
```

Feel free to customize the script further to suit your needs.
