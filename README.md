## For what is that?

This script sends a message to your Discord server via webhook with the names and URLs from your running Ngrok process at every server restart. As a prerequisite for this script to work, an ngrok systemd process must exist which is automatically executed at startup.  

To have ngrok as a systemd process you could use this script: https://github.com/vincenthsu/systemd-ngrok

## Install Guide:
1. Clone this repository or download it to your server:
`git clone https://github.com/NoahEliasFeldt/ngrok-discord-webhook.git && cd ngrok-discord-webhook`

2. Add your webhook link from Discord in the sendHook.sh file in the variable WEBHOOK=""

3.  Copy all files to the right folder
`sudo cp ngrokwebhook.service /etc/systemd/system/ngrokdiscord.service`
`sudo mkdir /etc/ngrokdiscord`
`sudo cp sendHook.sh /etc/ngrokdiscord/sendHook.sh`

4. Enable and start your systemd process so that the script is executed when the server is started
`sudo systemctl enable ngrokdiscord.service`
`sudo systemctl start ngrokdiscord.service`
