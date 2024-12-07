#### Elastic Kubernetes service (EKS)

1. **SetUp:** 
  - Authentication to AWS cloud( aws configure)
  - kubectl command line tool(client) to communicate with kubernetes API server(server)
  - eksctl command to create EKS cluster in aws.
  
#### spot instances
AWS have huge data center. there may be unused capacity in data center

spot instances --> 90% discount. when AWS requires capacity to ondemand clients they take back instances with 2min notice...

#### Cluster creation 
- create a cluster using below command 
 
    eksctl create cluster --config-file=name_yaml_file 
    eksctl delete cluster --config-file=

    aws eks update-kubeconfig --region us-east-1 --name  expense

#### Pod
- Pod is the smallest object in k8s.
- pod have multiple containers sharing same IPs address.


#### Container
- multiple conatiner share same network and storage.
- One is main container and another is helper container. (example: helper conatiner stores logs of main container).
- these are useful in sidecar and proxy patterns.

#### Replica set 
- replica set will not update the image version, only reposibility is to mantain  the desired copy of replicas 

#### Deployment 
- when deployment is created replicas set creates.
- deployment have self  healing mechanism

### Satatefull set 
- For stateful application(database)
- for every pod, one ebs volume should be mapped
- pods is created in order, runs one after one, even deleteion follows the same pattern

#### Deamon sets
- if we run daemon set on cluster, kubernetes ensure that pod runs on each node.
- Dynamicallay runs only one pod one node
- used for monitoring workloads (prometheus)
#### PV and PVC
- Static provisioning
  1. create volume in aws cloud platfrom
  2. install driver(kubernestes drivers has to be install to communicatweith gcloud cloud)(system to system communication need drivers)
  3. EKS should have permisiion to access the EBS volume (create role sfor worker nodes in EKS cluster)
  4. CSI driver: https://github.com/kubernetes-sigs/aws-ebs-csi-driver.git
- Dynamic provisioning 

#### EBS vs EFS 
- EBS is elastic block store, EFS uses NFS file system
- EBS should be as near as possible, EFS can be anywhere
- EBS is faster compared to EFS
- EBS we can store OS, Databases. EFS is not good for OS and DB
- EFS Can increase storage limit automatically
- Files are stored in EFS.

1. create EFS volume
2. install drivers : https://github.com/kubernetes-sigs/aws-efs-csi-driver [ Manifest (private registry) ]
  - kubectl kustomize \
    "github.com/kubernetes-sigs/aws-efs-csi-driver/deploy/kubernetes/overlays/stable/ecr/?ref=release-2.X" > private-ecr-driver.yaml
3. give ebs acess permisiion to eks
4. Efs should allow 2049 traffic from eks worker nodes
5. create pv 
6. create pvc 
7. pods can claim pvc

#### kubernetes Api-resources 
- we have namespace level resources - PVC(persistent volume)
- we have cluster level reosurces - PV(persistent volume)
#### RBAC
- Role and RoleBinding is for giving namespace level autorisation access for users in kuberenetes
- ClusterRole and ClusterRoleBinding is for giving cluster level authorisation access for users in kubernetes

#### Steps to work on RBAC
- Make user user exit and have describeCLuster access.
- create role and rolebinding
- edit aws-auth configmap

### Vertical and horitozal scaling(HPA)
- You have to install metrics server (kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml)
- we have to mention resources requests and limits for the pod
- we will attach HPA to the Deployment

#### Ingress Controller 
- Classic LoadBalancer : By Default kubernetes creates a classsic load balancer when we give service type as LoadBalancer
   - it is not intelligent
   - it can't route traffic to different target groups
- ALB 
   - it is intelligent
   - it routes traffic to different targets groups based on listener rules
   - it has host based routing, context path based
- Ingress Controller 
  - To give internet access to our application running in k8, we have to provision the Ingress controller
  - we have to deploy Ingress rersource 
  - https://kubernetes-sigs.github.io/aws-load-balancer-controller/latest/
#### Install kubens

    sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
    sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
    sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
#### Install k9s
- https://github.com/derailed/k9s (url)

      curl -sS https://webinstall.dev/k9s | bash

#### Apache bench install tool(for pushing load on server for testing)
- To install Apache Bench, which is in the httpd-tools package, we’ll use dnf:

              dnf install httpd-tools
- Apache Bench (ab) is a load testing and benchmarking tool for Hypertext Transfer Protocol (HTTP) server.

              ab -n 100 -c 10 https://www.apache.org/        

  - ab --help

#### Helm charts 
- helm charts is a package manager for kubernetes applications
- to templatise manifest files
- to install popular applications in kubernetes like ingress control, CSI drivers, metrics server, prometheus/grafana
- image creation ---> Docker File
- how to run image ---> docker compose/ kubernetes manifest files
- popular tools have opensource images and open sources manifest files 

#### Sercice account
- service account is identity for pods(non human) = authentication.
- service account + polices(RBAC) = authentication + authorisation.
- used to connect and get acess for specfic resources in aws. 

### Kubernete architecture

#### Master

- API server : it acts as front end to the control panel(master), receives the request from client and checks authentication and authorisation it.
- Scheduler --> Schedules the pods on worker nodes based on resources availability, it checks taints, tolerations, node selectors, affinity, anti affinity, hardware requirements, free CPU and memory.
- Controller : 
   - ReplicaSet : it ensures desired number of pods running on the worker nodes.
   - node contoller: keep on monitoring the nodes
   - job controller: checks the jobs
   - Endpoint controller: estabilish connections between services and pods
   - SA controller: creates default service account in namespace
- ectd : Database for k8 configuration.

#### Node Components
- kubelet: An agent running inside worker node to communicate with master
- kube proxy: setup the network rules communication of pods and nodes
- container runtime : to run the containers
   - contianer-d, crio. 

#### add-ons 
- VPC CNI 
- DNS
- Kube proxy