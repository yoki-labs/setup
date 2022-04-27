#!/bin/sh
printf "\nSetting up docker!\n"
if [ -x "$(command -v docker)" ]; then
    echo -e "Docker already installed. Skipping..."
else
    sudo apt update -y
    sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
    sudo apt update -y
    sudo apt-get install docker-ce -y 
    sudo usermod -aG docker ${USER}
    su - ${USER}
    printf "\nDocker has been set up!\n"
fi
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
