# Ingress Controller

- Ingress controller is outside application its not a part of aws,so controller need access for ALB loadbalancer(create and manage ALB).
- Service account acts as an identity for pods or applications running in Kubernetes.
-  https://kubernetes-sigs.github.io/aws-load-balancer-controller/latest/

### Ingress controller authentication and authorisation for create and manage Loadbalancer in AWS
- Authentication: - EkS uses the trusted OIDC( I am Service) Is a identity provider to authenticate service accounts.
- Below steps are  for authorisation 
- Create a Role with EKS 
- Create a policy(permission) and attach to this role.
- link this role to kubernetes service account(service account is an identity for pods or application(example: controller) running in kubernetes)
- now EKS LoadBalancerController get granular access for EKS in AWS.

### Commands are to set up Ingress Controller in EKS

- This command is for authenticate service accounts in kubernetes
```
eksctl utils associate-iam-oidc-provider \
    --region us-east-1 \
    --cluster expense \
    --approve 
```
- download Iam_policy.json

```
curl -o iam-policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.10.0/docs/install/iam_policy.json 
``` 
- create policy using Iam_policy.json

```
aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam-policy.json
``` 
-  create a kubernetes service account(creates a identity(role) for Ingress Controller in EKS cluster) in EKS cluster

``` 
eksctl create iamserviceaccount \
--cluster=expense \
--namespace=kube-system \
--name=aws-load-balancer-controller \
--attach-policy-arn=arn:aws:iam::461997657539:policy/AWSLoadBalancerControllerIAMPolicy \
--override-existing-serviceaccounts \
--region us-east-1 \
--approve 
``` 

```
helm repo add eks https://aws.github.io/eks-charts
```

```
helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system --set clusterName=<cluster-name> --set serviceAccount.create=false --set serviceAccount.name=aws-load-balancer-controller
``` 
