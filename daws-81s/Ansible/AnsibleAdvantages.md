# Ansible Advantages

- Hetrogenous(Ansible module itself can identify the nasible node distribution and install the specifed package using the package manager(dnf,apt-get,....))
- Idempotent (Running the script infinite times, will not the change the results)
- Error Handling ---> Ansible itslef handles errors without writing extra code by user. In shellscript before running the script we would do user validation to check the user has super user (root) user previllages.
