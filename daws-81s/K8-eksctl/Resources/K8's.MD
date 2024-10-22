#### Elastic Kubernetes service (EKS)

1. **SetUp:** 
  - Authentication to AWS cloud( aws configure)
  - kubectl command line tool(client) to communicate with kubernetes API server(server)
  - eksctl command to create EKS cluster in aws.
  
#### spot instances
AWS have huge data center. there may be unused capacity in data center

spot instances --> 90% discount. when AWS requires capacity to ondemand clients they take back instances with 2min notice...