#### .bash_profile
- .bash_profile is a shell script that  will be executed when user login into the system.
- .bash_prifile: is located in every user's directory.

                ~/.bash_profile
- .bash_profile is used to configure environment for the user, including environment varibales, alias, any customer scripts.
- Environment setup in .bash_profile  
             
             export PATH=$PATH:/usr/local/bin
- alias: 

                alias ll='ls -la'
- Execution of Startup Commands: 
      
                echo "Welcome, $(whoami)!"

- After editing the bash_profile, we have to logout and log back. we have to source the file to apply the changes

                source ~/.bash_profile

            - 
When a user logs into a Linux system, the sequence of events typically proceeds as follows:
- System boots up and initializes services (using systemctl).
- User logs in, creating a new shell session.
- Bash reads .bash_profile (or .profile) to set up the user environment.