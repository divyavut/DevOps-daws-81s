#### To design Resilient Sysytem( resilient: quicly recover fom failure)

**Fault Tolerance:** Ability of a system to continue functioning correctly even after the part of the system failure.

   usage : replicate the pods across the nodes

**High Availability**: ensures a service remains operational and accessible with minimal downtime.

   usage : deploy the application in multiple availabilty zones.

**Disaster Recovery:** Disaster recovery is a set of policies and procedures to restore critical systems after a major failure.
  
 **Example Scenario**: Failover in Cloud
Imagine you have a web application deployed in AWS’s us-east-1 region. For a failover environment:

- You set up a secondary environment in us-west-2 (another AWS region).
- Using cross-region replication for databases and backups, the data stays in sync.
- In case of a failure in us-east-1, traffic is redirected to us-west-2.
- Depending on your setup, this failover may happen automatically (with tools like AWS Route 53 for DNS failover) or require manual intervention.