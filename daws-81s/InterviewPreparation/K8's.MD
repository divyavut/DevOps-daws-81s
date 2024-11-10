#### Elastic Kubernetes service (EKS)

1. **SetUp:** 
  - Authentication to AWS cloud( aws configure)
  - kubectl command line tool(client) to communicate with kubernetes API server(server)
  - eksctl command to create EKS cluster in aws.
  
2. **Permsission for INgress Controller:** 
- For EC2: You attach the IAM role directly to the  EC2 instance.
- For EKS Applications: You link the IAM role to a Kubernetes service account, and then the application running on that service account gets the permissions.