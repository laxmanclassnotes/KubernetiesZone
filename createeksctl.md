## Installing EKS cluster

#### Prerequiretes
  * Take one EC2 instance with all ports
  * Install AWS-cli 
  * IAM user ( Accesskey , SecreatKey )
  * kebectl
  * AWS configure
  * eksctl
  * cluster.yaml file
  * ssh-keygen
  * ` eksctl create cluster -f cluster.yaml` command to create clusters
  * `kubectl get nodes`


## Install AWS-cli

[ReferHere](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
```bash
sudo apt update
sudo apt install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```
## IAM user ( Accesskey , SecreatKey )
* Create one IAM user in our aws console management and get `Accesskey`, `Secreatkey` credentials.


## kebectl Installation

[ReferHere](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/) official docs
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
```

## AWS configure

* In linux Terminal type these command `aws configure` and give Accesskey and Secreatkey

## eksctl Installation

[ReferHere](https://github.com/weaveworks/eksctl/blob/main/README.md#installation) offical docs
```bash
 # for ARM systems, set ARCH to: `arm64`, `armv6` or `armv7`
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH

curl -sLO "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"

# (Optional) Verify checksum
curl -sL "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check

tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz

sudo mv /tmp/eksctl /usr/local/bin
```


## cluster.yaml file For creating two clusters

```yaml
apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig

metadata:
  name: basic-cluster
  region: ap-south-1

nodeGroups:
  - name: basic-eksctl
    instanceType: t2.large
    desiredCapacity: 2
    volumeSize: 20
    ssh:
      allow: true # will use ~/.ssh/id_rsa.pub as the default ssh key
```
* above content is used in `vi cluster.yaml`

## ssh-keygen

 * In limnx-terminal we use these command `ssh-keygen`

## Install cluster these commands

* `eksctl create cluster -f cluster.yaml` command to create clusters
* `kubectl get nodes`

* kubectl is ready
  

#### Questions

1. How to check logs of Pods ?
2. What are events in k8s ?
3. why should i use k8 ?
4. what are stateful sets ?
5. what is purpose of headless service?
6. what is CSI ?
7. what is CNI ?
8. What is the last problem which you faced in k8s ?
9. How to use external vault in k8s ?
10. How to backup k8s cluster?
11. How to upgrade the k8s cluster?
12. what is draining the node vs cordon the node?
13. Can we implement custom dns in k8s?
14. What is default dns in k8s?
15. communication between two services in different namespaces
16. How to auto scale nodes in aks/eks? `cluster node autoscaler` 
17. List down atleast 10 most common k8s failures?

