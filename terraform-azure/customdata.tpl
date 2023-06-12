#!/bin/bash
sudo apt-get update -y &&
sudo apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
software-properties-common &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" &&
sudo apt-get update -y &&
sudo sudo apt-get install docker-ce docker-ce-cli containerd.io -y &&
sudo usermod -aG docker adminuser &&
sudo apt install nodejs-legacy -y &&
sudo apt install npm -y &&
sudo apt-get install openjdk-8-jdk -y && echo "jkd8" >> /tmp/stage &&
sudo add-apt-repository ppa:openjdk-r/ppa -y && echo "repo-update" >> /tmp/stage &&
sudo apt-get update  && echo "update" >> /tmp/stage &&
sudo apt install openjdk-11-jdk -y && echo "java11" >> /tmp/stage &&
sudo apt install openjdk-17-jdk -y && echo "java-17" >>  /tmp/stage &&
echo "done" >> /tmp/stage
# curl -fsSL https://code-server.dev/install.sh | sh &&
# sudo systemctl enable --now code-server@$USER
