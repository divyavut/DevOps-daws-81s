#!/bin/bash

#check whether root user or not
R="\e[31m"
N="\e[0m"

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user
echo -e "$R Logout and Login again $N"

# Install Kubectl (https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html#linux_amd64_kubectl)
sudo curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.31.0/2024-09-12/bin/linux/amd64/kubectl
# Exectue permission to binary
sudo chmod +x ./kubectl

## move the kubectl to (/usr/local/bin) to use it in entire system
sudo mv kubectl /usr/local/bin/kubectl


## Install eks (https://eksctl.io/installation/)
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH

curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"

tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz

sudo mv /tmp/eksctl /usr/local/bin

### set namespace 
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

## Configure Aws credentials

# Prompt the user for AWS configuration details
echo "Enter your AWS Access Key ID:"
read AWS_ACCESS_KEY_ID

echo "Enter your AWS Secret Access Key:"
read AWS_SECRET_ACCESS_KEY

echo "Enter your preferred AWS Region (e.g., us-east-1):"
read AWS_REGION

echo "Enter your preferred Output Format (json, text, table):"
read AWS_OUTPUT_FORMAT

# Run aws configure with the provided inputs
aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID"
aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY"
aws configure set default.region "$AWS_REGION"
aws configure set output "$AWS_OUTPUT_FORMAT"

echo "AWS CLI configured successfully!"
