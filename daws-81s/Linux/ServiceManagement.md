### Service management

To connect any server there should be some service that should be running in the system.

Example : In Linux machine sshd service is running in the system, we connect to linux system through protocol(ssh) with port 22.

### /etc/ssh/sshd_config

1. /etc/ssh/sshd_config ---> main configuration file for the SSH (Secure Shell) daemon, sshd, on a Linux system.
2. This file controls how the SSH service operates, including settings for security, authentication, connection options, and logging.

3. Purpose: Configures the behavior and security settings of the SSH server (sshd).

### Common Configuration Options:

modify in the sshd_config file:

#### Port:

Specifies the port number that the SSH daemon listens on. The default is 22.

    Port 22

#### PermitRootLogin:

Controls whether the root user is allowed to log in via SSH.
Options: yes, no, prohibit-password (disallows password authentication for root but allows other methods like keys).

     PermitRootLogin no

#### PasswordAuthentication:

Enables or disables password-based authentication.

    PasswordAuthentication yes

#### PubkeyAuthentication:

Enables or disables public key-based authentication.

    PubkeyAuthentication yes

#### AuthorizedKeysFile:

Specifies the file(s) containing public keys that can be used for logging in. By default, this is usually set to .ssh/authorized_keys in the user's home directory.

    AuthorizedKeysFile .ssh/authorized_keys

#### AllowUsers / AllowGroups:

Specifies which users or groups are allowed to connect via SSH.

     AllowUsers user1 user2

#### DenyUsers / DenyGroups:

DenyUsers root baduser

### Applying Changes:

After making changes to the sshd_config file, you must restart or reload the SSH service for the changes to take effect:

    sudo systemctl restart sshd

## Type of init system in Linux Distribution

1. Systemd based system

   Systemd is the service management tool in Systemd based system. systemctl is the command used to start, status,restart, stop, enable, disable the services in the system

2. SysVinit based system

   SysVinit is the service management tool in SysVinit based system. service is the command used to start, status,restart, stop, enable, disable the services in the system

## Note

Systemd is the first process that start when the system boots. so its always assigned PID 1

### check the init system on a linux system (Check the Process ID of PID 1)

    ps -p 1 -o comm=

##### output:

systemd (it is systemd init system)

### Start, Restart, Stop, Enable,Disable service

After installing software Package, we have to start the service.

#### Service Status

    systemctl start servicename
    systemctl start sshd
    systemctl start nginx

#### Service Status

    systemctl status servicename
    systemctl status sshd
    systemctl status nginx

#### Service Stop

    systemctl stop servicename
    syetmctl stop sshd
    systemctl stop nginx

#### Service enable

Enabling a service after installing and starting it ensures that the service will automatically start when the system boots up

    systemctl enable servicename
    systemctl enable sshd
    systemctl enable nginx

#### Service restart

Any configuration changes in /etc/servicename/servicenamed_config (/etc/ssh/sshd_config) file restart the service to reflect the changes

     systemctl restart servicename
     systemctl restart sshd
     systemctl restart nginx

#### Service disable

     systemctl disable servicename
     systemctl disable sshd
     systemctl disable nginx
