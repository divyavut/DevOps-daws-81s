#### Commands

#### Local Setup

    1. git clone <repository url> --> download existing repository code to the local machine(local repository). where git initialisation is already happens in remote.

    2. git config --global -email email-id  --> You should tell Git who you are before commiting to local repository for the first commit.
     Git will track all  and it goes in history.

    3. git config --global -username username

     Note: Those details stored in .gitconfig(c:/users/divya/.gitconfig)

#### Remote SetUp

    1. create a github account

    2. create repository in github(remote repository)

    3. git add remote origin <url> --> usage: If you have existing local repository and initialised git in it and you want to push your local code to github(create a repo and add to local).

#### Work Flow

    1. Use  Any git Cilent to connect to github Server

    7. git add . ---> Add files from working directory to staging area

    8. git commit -m "message" --->commit files form staging area to local repository

    9. git push origin main --> Push local repository changes to remote repository

    10. Generate personal acess token to connect from local repository to github or use user name and password.
    Note: (These credentials stores in Credentail Manager)

#### Git

1. Git is decentalised system
2. Git is single source of Truth
3. Git is a source control version

#### Git three Tier Architecture

1.  Working Diectory
2.  Staging Area
3.  Local Repo
4.  Remote Repository
