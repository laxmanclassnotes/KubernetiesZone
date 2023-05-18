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







# TABLE OF CONTENTS
### Introduction:
### Kubernetes Architecture:
### Master Components:
  * Kubernetes API Server:
  * etcd:
  * Kube-Controller Manager:
  * Kube-Scheduler:
### Node Components:
### Kubernetes Components:
### Control Plane Components:
  * kube-apiserver:
  * kube-scheduler:
  * kube-controller-manager:
  * etcd:
  * cloud-controller-manager:
### Worker Node Components:
  * Nodes:
  * Pods:
  * Container Runtime Engine:
  * kubelet:
  * kube-proxy
  * Container Networking
### Installing kubectl and minikube on Ubuntu:
   ### Conclusion:
   ## Introduction:

Kubernetes is an open-source platform that is widely used for container orchestration. It is designed to automate the deployment, scaling, and management of containerized applications. Kubernetes can be used to manage and run applications in a variety of environments, including public, private, and hybrid clouds. Kubernetes provides a rich set of features that help manage the complexity of deploying and managing containerized applications at scale. In this blog, we will explain the Kubernetes architecture and its components.

## Kubernetes Architecture:

The Kubernetes architecture consists of two main components: Master Components and Node Components.

## Master Components:
Master components are the control plane components of Kubernetes that manage the Kubernetes cluster. The master components include:

## Kubernetes API Server:
The Kubernetes API Server exposes the Kubernetes API, which is used by clients to interact with the Kubernetes cluster. It is the primary management point for the Kubernetes cluster and is responsible for validating and processing API requests.

## etcd:
etcd is a distributed key-value store that stores the configuration data of the Kubernetes cluster. It is used to store the state of the cluster, including the state of all objects (pods, services, deployments, etc.).

## Kube-Controller Manager:
The Kube-Controller Manager is responsible for running controllers that are responsible for maintaining the desired state of the Kubernetes cluster. The controllers include the node controller, the replication controller, and the endpoint controller.

## Kube-Scheduler:
The Kube-Scheduler is responsible for scheduling the pods on the nodes in the Kubernetes cluster. It uses information about the nodes' available resources and the pod's resource requirements to determine the best node to schedule the pod on.

## Node Components:
Node components are the worker components of Kubernetes that run on each node in the Kubernetes cluster. The node components include:

## Kubelet:

The Kubelet is the primary node agent that communicates with the Kubernetes API server and ensures that the containers are running on the node as expected. It is responsible for starting, stopping, and monitoring the containers on the node.

## Container Runtime:

The Container Runtime is the software that runs the containers on the node. Kubernetes supports several container runtimes, including Docker, CRI-O, and containerd.

## kube-proxy:

The kube-proxy is responsible for providing network connectivity to the pods running on the node. It does this by creating network rules that allow traffic to be forwarded to the pods.

## Kubernetes Components:
Kubernetes components can be divided into two categories: Control Plane Components and Worker Nodes Components.

## Control Plane Components:
## kube-apiserver:
The kube-apiserver is the main management point for the Kubernetes cluster. It exposes the Kubernetes API, which is used by clients to interact with the Kubernetes cluster.

## kube-scheduler:
The kube-scheduler is responsible for scheduling the pods on the nodes in the Kubernetes cluster.

## kube-controller-manager:
The kube-controller-manager runs controllers that are responsible for maintaining the desired state of the Kubernetes cluster.

## etcd:
etcd is a distributed key-value store that stores the configuration data of the Kubernetes cluster.

## cloud-controller-manager:
The cloud-controller-manager is responsible for managing the cloud provider-specific resources in the Kubernetes cluster. It provides a way to integrate with the cloud provider's APIs to manage the cloud resources.

## Worker Node Components:
  ## Nodes:
Nodes are the worker machines that run the containers. They are managed by the Kubernetes master components.

  ## Pods:

Pods are the smallest deployable units in the Kubernetes cluster. They contain one or more containers and are scheduled on nodes.

## Container Runtime Engine:
The Container Runtime Engine is responsible for running the containers on the node. Kubernetes supports several container runtimes, including Docker, CRI-O, and containerd.

## kubelet:
Kubelet is one of the main components of Kubernetes responsible for managing individual nodes and their containers. It is essentially an agent that runs on each node in the Kubernetes cluster and communicates with the API server to ensure that the containers running on the node are healthy and running as expected.

>>The kubelet performs several functions, including:
* Fetching container manifests from the Kubernetes API server.
* Ensuring that the containers described in the manifest are running and healthy.
* Reporting the status of the containers back to the API server.
* Mounting and unmounting volumes as necessary.
* Executing container health checks.

## kube-proxy
The kube-proxy component is responsible for managing the network proxy between the Kubernetes services and the pods that are running on the worker nodes. The kube-proxy uses various networking modes to ensure that the communication between the pods and services is efficient and reliable.

## Container Networking
The container networking component is responsible for ensuring that all the containers running on the worker nodes can communicate with each other and with the external networks. Kubernetes provides several plugins for container networking, including Flannel, Calico, and Weave.

## Installing kubectl and minikube on Ubuntu:
## Install kubectl:

## COPY
```bash
 curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
 sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
 kubectl version
 ```
This downloads the latest stable release of kubectl for Linux amd64 architecture, installs it, and verifies the installation.

Install minikube:


#### COPY
```bash
 curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
 sudo install minikube-linux-amd64 /usr/local/bin/minikube
 minikube start --driver=docker
 ```
This downloads the latest release of minikube for Linux amd64 architecture, installs it, and starts a single-node Kubernetes cluster using the Docker driver.

Create a pod configuration file:


## COPY
 `vi pod.yml`
This opens a new file in the vi text editor.

Paste the following YAML code into the file and save it:

```yaml
 apiVersion: v1
 kind: Pod
 metadata:
   name: nginx
 spec:
   containers:
   - name: nginx
     image: nginx:1.14.2
     ports:
     - containerPort: 80
```     
This defines a Kubernetes pod called 'nginx' that runs a container using the nginx:1.14.2 image and exposes port 80.

Create the pod:
### COPY
```bash
 kubectl create -f pod.yml
 kubectl get pods
 kubectl get pods -o wide
 ```
This creates the 'nginx' pod using the configuration in the pod.yml file, lists the running pods, and shows additional details about the 'nginx' pod.

Verify the pod is running:
### COPY
 minikube ssh
 `curl http://<cluster-ip>:80`
This logs into the minikube VM, where the Kubernetes cluster is running, and uses curl to access the nginx web server running in the 'nginx' pod via the cluster IP address.

Delete the pod:

### COPY
 `kubectl delete pod nginx`
This deletes the 'nginx' pod from the Kubernetes clust