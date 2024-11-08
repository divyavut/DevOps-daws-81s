## Selectors
- Taint and Tolerations: Taint the node so that kube-schedular wont schedule pods on to this worker node, kube-schedular schedules the tolerated pods on to this worker node but wont guarantee.

Taint the node

```
kubectl taint nodes <node_name> key1=value1:NoSchedule

Example: kubectl taint nodes ip-192-168-20-125.ec2.internal hardware=gpu:NoSchedule 
```
