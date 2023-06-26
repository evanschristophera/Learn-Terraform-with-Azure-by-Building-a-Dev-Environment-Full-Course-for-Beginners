#! /bin/bash
 sudo apt-get update -y &&
 sudo apt-get install -y \
 apt-transport-https \
 ca-certificates \
 curl \
 gnupg-agent \
 software-properties-common &&
echo basic > /tmp/diditwork && 

curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/v1.39.13/skaffold-linux-amd64 && 
chmod +x skaffold && 
sudo mv skaffold /usr/local/bin &&
echo skaffold >> /tmp/diditwork 

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" &&
sudo apt-get update &&
apt-cache policy docker-ce &&
sudo apt-get install -y docker-ce &&
sudo systemctl status docker &&
sudo usermod -aG docker cevans &&
id -nG &&
sudo usermod -aG docker cevans  && 
echo docker >> /tmp/diditwork

# kubectl https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
sudo apt-get update  &&
sudo apt-get install -y ca-certificates  &&
sudo apt-get install -y apt-transport-https &&
sudo mkdir -p /etc/apt/keyrings/ &&
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg &&
ls -al /etc/apt/keyrings &&
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list &&
sudo apt-get update &&
sudo apt-get install -y kubectl &&
echo kubectl  >> /tmp/diditwork

# Minikube https://minikube.sigs.k8s.io/docs/start/
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 &&
sudo install minikube-linux-amd64 /usr/local/bin/minikube &&
echo minikube >> /tmp/diditwork


# Database worked when done by hand.


# Java 8 for netextender
sudo apt install openjdk-8-jre -y &&
sudo apt install openjdk-8-jdk -y &&
echo "java8" >> /tmp/diditwork

# cevans@example-machine:~$ javac -version
# Command 'javac' not found, but can be installed with:
# sudo apt install openjdk-11-jdk-headless  # version 11.0.19+7~us1-0ubuntu1~22.04.1, or
# sudo apt install default-jdk              # version 2:1.11-72build2
# sudo apt install openjdk-17-jdk-headless  # version 17.0.7+7~us1-0ubuntu1~22.04.2
# sudo apt install openjdk-18-jdk-headless  # version 18.0.2+9-2~22.04
# sudo apt install openjdk-19-jdk-headless  # version 19.0.2+7-0ubuntu3~22.04
# sudo apt install openjdk-8-jdk-headless   # version 8u372-ga~us1-0ubuntu1~22.04
# sudo apt install ecj                      # version 3.16.0-1

sudo apt install openjdk-17-jdk-headless -y && 
sudo apt install openjdk-17-jre-headless -y &&
echo java17 >> /tmp/diditwork 



# Node stuff
sudo apt install nodejs -y &&
echo nodejs >> /tmp/diditwork &&
sudo apt install npm -y &&
echo npm >> /tmp/diditwork

sudo apt install dos2unix &&
echo dos2unix /tmp/diditwork



echo hi >> /tmp/diditwork
