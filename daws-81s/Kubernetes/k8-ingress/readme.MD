# Ingress Controller

- Ingress controller is outside application its not a part of aws,so controller need access for ALB loadbalancer(create and manage ALB).
- Create a Role with EKS 
- Create a policy(permission) and attach to this role.
- link this role to kubernetes service account(service account is an identity for pods or application(example: controller) running in kubernetes)
- now EKS LoadBalancerController get granular access for EKS in AWS.


- Service account acts as an identity for pods or applications running in Kubernetes.
-  https://kubernetes-sigs.github.io/aws-load-balancer-controller/latest/


### Commands are to set up Ingress Controller in EKS

```
eksctl utils associate-iam-oidc-provider \
    --region us-east-1 \
    --cluster expense \
    --approve 
```

```
aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam-policy.json
``` 

```
curl -o iam-policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.10.0/docs/install/iam_policy.json 
``` 

``` 
eksctl create iamserviceaccount \
--cluster=expense \
--namespace=kube-system \
--name=aws-load-balancer-controller \
--attach-policy-arn=arn:aws:iam::<AWS_ACCOUNT_ID>:policy/AWSLoadBalancerControllerIAMPolicy \
--override-existing-serviceaccounts \
--region <region-code> \
--approve 
``` 
