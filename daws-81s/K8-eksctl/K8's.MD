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
#### Pod
- Pod is the smallest object in k8s.
- pod have multiple containers sharing same IPs address.


#### Container
- multiple conatiner share same network and storage.
- One is main container and another is helper container. (example: helper conatiner stores logs of main container).
- these are useful in sidecar and proxy patterns.

### Replica set 
- replica set will not update the image version, only reposibility is to mantain  the desired copy of replicas 