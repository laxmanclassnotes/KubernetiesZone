### Install Docker on  ubuntu machines 

* curl -fsSL https://get.docker.com -o get-docker.sh
* sh get-docker.sh
* sudo usermod -aG docker ubuntu
* exit
* re-login

>> This url used for refernce steps[RefereHere](https://github.com/Mirantis/cri-dockerd)
	
# Run these commands as root user

* ###Install GO###
 
* sudo -i
* wget https://storage.googleapis.com/golang/getgo/installer_linux
* chmod +x ./installer_linux
* ./installer_linux
* source ~/.bash_profile

* git clone https://github.com/Mirantis/cri-dockerd.git 

* cd cri-dockerd
* mkdir bin
* go build -o bin/cri-dockerd
* mkdir -p /usr/local/bin
* install -o root -g root -m 0755 bin/cri-dockerd /usr/local/bin/cri-dockerd
* cp -a packaging/systemd/* /etc/systemd/system
* sed -i -e 's,/usr/bin/cri-dockerd,/usr/local/bin/cri-dockerd,' /etc/systemd/system/cri-docker.service
* systemctl daemon-reload
* systemctl enable cri-docker.service
* systemctl enable --now cri-docker.socket

* cd ~ 

* sudo apt-get update
* sudo apt-get install -y apt-transport-https ca-certificates curl
* sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

* echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

* sudo apt-get update
* sudo apt-get install -y kubelet kubeadm kubectl
* sudo apt-mark hold kubelet kubeadm kubectl
  

    ## these above steps all are used in Master , Node1, Node2


   ### use these command only in master
 ``` yaml
* kubeadm init --pod-network-cidr "10.244.0.0/16" --cri-socket "unix:///var/run/cri-dockerd.sock" 
* exit
* mkdir -p $HOME/.kube
* sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
* sudo chown $(id -u):$(id -g) $HOME/.kube/config
  
* kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml

* kubectl get nodes
```
### use these commands in Node1, Node2 ( as a root user)

kubeadm join 172.31.2.45:6443 --token oqdm09.og6cfosynxgl8sd0 \
       --cri-socket "unix:///var/run/cri-dockerd.sock" \
        --discovery-token-ca-cert-hash sha256:5d92f0d3f11f4529cdb8792f334865cd175dd022116dec2595147041384cc6cf

`above steps taken in master node successfully installation part`


