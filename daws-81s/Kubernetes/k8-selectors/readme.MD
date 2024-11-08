## Selectors
- Taint and Tolerations: Taint the node so that kube-schedular wont schedule pods on to this worker node, kube-schedular schedules the tolerated pods on to this worker node but wont guarantee.

Taint the node

```
kubectl taint nodes node1 key1=value1:NoSchedule

kubectl taint nodes    hardware=gpu:NoSchedule 
```
