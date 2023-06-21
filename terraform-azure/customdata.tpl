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




# 
# # skaffold
# curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 && \
# sudo install skaffold /usr/local/bin/
# echo skaffold >> /tmp/diditwork

# Java 8 for netextender
#sudo apt-get install openjdk-8-jdk -y && echo "jkd8" &&
#echo java8 >> /tmp/diditwork


# netextender
# echo netextender working directory $(pwd) >> /tmp/diditwork
# sudo apt-get install pptpd -y && 
# curl https://software.sonicwall.com/NetExtender/NetExtender.Linux-10.2.845.x86_64.tgz --output NetExtender.Linux-10.2.845.x86_64.tgz &&
# tar -zxvf NetExtender.Linux-10.2.845.x86_64.tgz && 
# echo netextender >> /tmp/diditwork
# 



# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
#sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"  
#echo hi 
# sudo apt-get update -y &&
# sudo apt-get install docker-ce docker-ce-cli containerd.io -y && echo "install docker" >> /tmp/stage &&
# sudo usermod -aG docker cevans &&  echo "usermod docker" >> /tmp/stage &&
# sudo apt install nodejs -y && echo "usermod docker" >> /tmp/stage &&
# sudo apt install npm -y &&
# sudo apt-get install openjdk-8-jdk -y && echo "jkd8" >> /tmp/stage &&
# sudo add-apt-repository ppa:openjdk-r/ppa -y && echo "repo-update" >> /tmp/stage &&
# sudo apt-get update  && echo "update" >> /tmp/stage &&
# sudo apt install openjdk-11-jdk -y && echo "java11" >> /tmp/stage &&
# sudo apt install openjdk-17-jdk -y && echo "java-17" >>  /tmp/stage &&
# sudo snap install microk8s --classic && echo "microk8s" >> /tmp/stage &&
# sudo microk8s enable dashboard dns registry istio && echo "enable-services" >> /tmp/stage && 
# sudo mkdir /home/cevans/.kube && chown cevans /hoikkkk:0me/cevans/.kube && sudo usermod -a -G microk8s cevans &&
# echo "done" >> /tmp/stageku
# # # curl -fsSL https://code-server.dev/install.sh | sh &&
# # # sudo systemctl enable --now code-server@$USER
