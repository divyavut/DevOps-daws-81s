#### Configuration Management

- puppet, chef, rundeck, ansible, etc.

#### Push Based Mechanism and Pulled Based Mechanism

- Ansible folows Pushes based mechanism
- Ansible remote login using ssh protocol

#### push based Mechanism

- server push notification to the node/box, if any new configuration changes in the server.

#### pull based Mechanism

- node/box for every 30 min checks is there any configuration changes in the server.

#### Inventory

- inventory.ini is a file contain list of servers ansible is managing nad connecting to
- Under group, we can add multiple server in one group, and create multiple groups based on requirement.

#### elligable

- Is your ansible server able to connect anisble-node ---> check network firewall configuration.
  1.  ansible -i <IPAdressof node>, all -e ansible_user=ec2-user -e ansible_password=DevOps321 -m ping --> checks
- install nginx on node from ansible server
  1.  ansible -i <IPAdressof node>, all -e ansible_user=ec2-user -e anisble_password=DevOps321 -b -m dnf -a "name=nginx state=installed"

#### adhoc commands

- it is the command issued from ansible server to target ansiable node manually, basically on some emergency/adhoc purpose.

#### playbooks

- playbook is a list of plays which contain modules that do specific tasks that ansible server runs against its node.
- Playbook is written in YAML(Yet another markup language)

#### Data Transfer Objects

- when we login to github from laptop it will reach to github server through DTO
- DTO are XML,json,YAML

#### Anisble

- Ansible can connect to any other external system(azure,aws,....) and perform task.
- here we can call modules to perform tasks. every ansible module we can check in the documentation
- module name is manditory, you can supply argumnets to the module , they may be optional or manditory

##### Ansible

- varaibles
- datatypes
- conditions
- functions
- loop

#### Variables (Inheritence concepts)

- Playlevel varaibles
- Task level varaibles
- command line variaables
- vars_file variables
- Promt variables (read input from user)
- inventory variables
- roles

#### Variables priority

- command line arguments
- Task level
- vars_files
- vars_prompt
- play level
- inventory

#### ansible Inventory groups

- ungrouped servers
- grouped servers
- groupofgroups

#### datatype

- string
- number
- boolean
- list
- map/dictionary

#### conditions

- when
  to decide whether the module should run or not

#### ansible.built.command

- ansible cant garuntee the module for everything
