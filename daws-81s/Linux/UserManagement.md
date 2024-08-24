#### Administrator Add new Users(Employees) in the System.

### User commands

1. useradd username ---> Adding user
2. passwd username ---> set password for user
3. /etc/passwd ---> All users information
4. userdel username ---> deleting user
5. usermod -g groupname username ---> modify the primary groupname for the user
6. usermod -aG groupname username ---> append the secondary group to the user

### Note

When user is created automatically primary group is created with same username.

### group Commands

1. groupadd groupname ---> adding group
2. gpasswd groupname ---> set password for the group
3. groupdel groupname --> delete the group
4. gpasswd -a username groupname ---> add user to the group
5. gpasswd -d username groupname ---> delete user from the group

### how can we check cpuinfo,memory,os

1. /proc/cpuinfo ---> cpu information
2. /proc/meminfo ---> mempry information
3. /etc/os-release --> information about Operation system
