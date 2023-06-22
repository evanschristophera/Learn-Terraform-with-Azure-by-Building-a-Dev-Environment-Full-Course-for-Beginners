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
sudo usermod -aG docker jalvarez &&
id -nG &&
sudo usermod -aG docker jalvarez  && 
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
sudo apt-get install openjdk-8-jdk -y && 
echo java8 >> /tmp/diditwork

sudo apt-get install openjdk-11-jdk -y && 
echo "java11" >> /tmp/diditwork 
sudo apt install openjdk-17-jdk -y && 
echo "java-17" >>  /tmp/diditwork 

# Node stuff
sudo apt install nodejs -y &&
echo nodejs >> /tmp/diditwork

sudo apt install npm -y &&
echo npm >> /tmp/diditwork
