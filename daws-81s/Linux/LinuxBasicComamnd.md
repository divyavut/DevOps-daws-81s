#### command format

    command option <input>

#### single character and word

     -h
     --help

#### Create file

    touch filename

#### display content

     cat filename

#### redirect to file

     echo "hello" > filename

#### remove file

     rm filename

#### copy file

     cp filename1 filename2

#### rename or move the file

     mv oldfilename newfilename

#### create directory, if directory exit though an error msg saying directory exits.

     mkdir directory

#### create directory if not exit. If directory exit does not show any error.

     mkdir -p directory

#### remove empty directory

     rmdir directoryname

#### remove directory and its subdirectories and content

     rm -r directoryname

#### Abosulate path (From Scratch completete path)

     /d/devops/daws-81s  --> Always begins with the root directory

#### Relatiuve path

     A relative path is a path that starts from the current working directory and points to a file or directory relative to that location.

#### (. dot)

Represents the current directory.

#### .. (Double Dot)

Represents the parent directory of the current directory.

#### change hostname of system (its basically host from network)
sudo hostnamectl set-hostname my-new-hostname

#### Curl 
- curl stands for "Client for URLs." It is commonly used to make requests to web servers and APIs.
- localhost is a hostname that refers to the local machine
- It is equivalent to the IP address 127.0.0.1
- When you use localhost, you are communicating with services that are running on your own computer.

#### Where 
- where <toolname> --> gives the install path of the tool.