### MySQL

Developer has chosen the database MySQL. Hence, we are trying to install it up and configure it.

#### Versions of the DB Software you will get context from the developer, Meaning we need to check with developer.

Install MySQL Server 8.0.x

    dnf install mysql-server -y

Start MySQL Service

    systemctl enable mysqld

    systemctl start mysqld

Next, We need to change the default root password in order to start using the database service. Use password ExpenseApp@1 or any other as per your choice.

    mysql_secure_installation --set-root-pass ExpenseApp@1

#### Connect Server using client (Verification)

We can check data by using client package called mysql.

Usually command to connect mysql server is

    mysql -h <host-adress> -u root -p<password>

But if the cilent and server both are in a single server, you can simply use.

    mysql

Once you got mysql prompt, you can use below command to check schemas/databases exist.

    show databases;

To use specfic database
use databasename

Once you are in particular schema, you can get the list of tables.
show tables;

You can get entries of a table using;
select \* from table_name;
