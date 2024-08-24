#### Create Private and public key

     ssh-keygen -f filename

#### Public key stores in .ssh/authorized_keys directory

Home directory of any user have .ssh/authorized_keys directory where public keys are stored.

#### User login using private key to the Server

ssh -i privatekey.pem ec2-user@Ipadress

#### validate user to login server

using private key user tries to login server, server checks the /etc/ssh/sshd_config configuration file whether key based authentication is enabled to Yes or no. Server checks the .ssh/authorized_keys directory for the public key. If public key is available it authenticates the user and response back.
