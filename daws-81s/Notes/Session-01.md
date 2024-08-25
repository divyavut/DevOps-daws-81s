Recap of Session 1:

### Covered topics:

#### DevOps:

A practice that combines development, operations, and security to shorten the systems development life cycle while delivering high-quality software.

#### Computer:

A machine that can store, retrieve, and process data.

#### SDLC Model (Software Development Life Cycle):

A framework that defines the phases involved in software development. Limitations include inflexibility and not being suitable for agile development.

#### Client-Server Architecture:

A network architecture where a client computer requests resources from a server computer.

#### Advantages of Linux Servers:

Open-source, secure, stable, and customizable.

#### Session 2 Agenda:

We will learn how to:
Create a Linux server on AWS.
Connect to the server using SSH.
Create a security group (firewall) for the server.
Understand basic Linux command syntax.
Use a few essential Linux commands.
Connecting to a Linux Server

#### Authentication Methods:

1. Something you know: Username and password (suitable for private systems).
2. Something you have: Username and tokens (e.g., RSA keys, MFA, Google Authenticator) (suitable for public systems).
3. What you are: Biometric authentication (fingerprints, retina scans) (most secure, but not commonly used).

#### Analogy:

Consider a box (server) with a lock. The key (private key) unlocks the box for authorized users.

#### Connecting with SSH:

We will use Git Bash as our SSH client. You can download it from https://git-scm.com/download/win.
To generate an SSH key pair, use the command ssh-keygen -f <filename>. This creates two files: <filename> (private key) and <filename>.pub (public key).
We need to import the public key to the Linux server.

#### In AWS:

Go to the EC2 service dashboard.
Click on "Key Pairs" under "Network & Security".
Click "Import Key Pair" and provide the public key content.
SSH uses port 22 by default.
Creating a Security Group (Firewall)

#### In AWS:

Go to the EC2 service dashboard.
Click on "Security Groups" under "Network & Security".
Create a new security group with a name and description.
Add an inbound rule to allow SSH access on port 22. You can initially specify a public IP address range (0.0.0.0/0) for practice, but for real-world scenarios, use specific IP addresses for security.

#### Basic Linux Commands:

#### Command Syntax:

command-name <options> <inputs>
<options>: Optional flags (e.g., -l for long listing)
<inputs>: Files or directories

#### Common Commands:

pwd: Shows the present working directory.
clear: Clears the console screen.
exit: Exits the server session.
cd: Changes directory.
cd /: Goes to the root directory.
cd ~: Goes to the home directory.
cd ..: Goes to the parent directory.
ls: Lists files and directories.
ls -l: Lists files and directories with detailed information (long format).
ls -a: Lists all files, including hidden files.
touch: Creates a new file.
cat: Displays the contents of a file.

> > : Appends text to a file.
> > : Overwrites the existing content of a file with new text.
> > rm: Removes a file.
> > rm -r: Recursively removes a directory and its contents (use with caution!).
> > mkdir: Creates a new directory.
> > rmdir: Removes an empty directory.
> > mv: Renames a file or directory.
> > Important Notes:
> > Paths in Linux can be absolute (starting with /) or relative (based on the current directory).
> > Use man <command-name> to get the manual page for a specific command with detailed information and options.
