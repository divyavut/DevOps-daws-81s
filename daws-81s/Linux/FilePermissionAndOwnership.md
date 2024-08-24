#### File And Directory Permission and Ownership

##### There are three type of owner for a file or Directory.

1. User
2. group
3. others

### Permissions on File or Directory

1.  read,
2.  Write
3.  execute

#### read,write,exectue permisiion for the user of a file1

        chmod u+rwx file1

#### read,write,exectue permisiion for the user,group,otherof a file1

        chmod ugo+rwx file

#### no,read,wrtie,exectue permission for the other

        chmod o-rwx file2

### Ownership for file or directory

#### Change the ownership of file

        chown newowner file

#### change the ownership of file to both group and user

        chown newowner:group file

#### change the ownership to only group for file

        chown :group file

#### Recursively change ownership of directories and their contents.

        chown -R newowner:group /home/bob
