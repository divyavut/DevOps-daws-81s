### Three Tier Architecture

#### Web Based Application

1. Web Tier
2. App/API Tier
3. Database Tier

#### Example

1. waiter ---> Web Server
2. chef ---> App Server
3. Raw Items ---> DataBase Server

Raw products == Data

#### Web Tier

    LB, Web Servers --> Queue management (User enter username, password)

    put that into HTML format, so that a normal can easily format

#### App/API Tier

    App servers --> (these username, password will pass to database through SQL queries)

    select * from user where user_name='sivakumar' and password='siva123'

#### Data tier

    DB Servers

## data is in tables and columns

user_id, user_name, first_name, last_name, password, created_date, dob
1 sivakumar sivakumar M siva123 `9-AUG-2024 01-01-01

#### Databases -->

MySQL, MSSQL, Oracle, Postgress, MongoDB, Redis

#### App/API(Backend Tier) -->

Java, Python, NodeJS, DotNet, Go, etc,

#### Web(Frontend) Tier -->

HTML, CSS, JavaScript, ReactJS, Angular, ExpressJS, Jquery, etc...

#### Static -->

Frontend applications are static --> Nginx, Apache, etc.

#### Dynamic -->

Backend appliactions are dynamic --> JBoss, Webspher, WebLogic,etc. --> Tomcat

#### Custom AMI created By JoinDevOps team

devops-practice --> We will use only username and password to login servers

#### Username

ec2-user

#### Password

DevOps321
