## Install the software packages to the Linux Machine

### Linux Distribution

### Package Management System:

Tools for installing, updating, and managing software packages. Common examples include

1. Debian-based systems(ubuntu, Debain): apt, dpkg

   1. apt (Advanced Package Tool): A front-end for the dpkg system, providing a user-friendly interface for managing packages.
   2. dpkg: The underlying package management system.

2. Red Hat-based systems(CentOS, Fedora, RHEL): yum, dnf, rpm
   1. yum (Yellowdog Updater, Modified): A package manager used in older versions of these distributions.
   2. dnf (Dandified YUM): A modernized version of yum, used in newer Fedora and RHEL versions.
   3. rpm (Red Hat Package Manager): The underlying package manager that yum and dnf use.

### YUM

yum is the package manager used to install, update, manage software packages for Red hat-based systems.

### Install package using YUM

1.  sudo yum install packagename -y ---> install package with confirmation
    2.sudo yum update packagename ---> update only specific package
2.  sudo yum update -y ---> update all packages with latest version in the system
3.  sudo yum list installed ---> list all installed packages
4.  sudo yum list available ---> list all available packages from the configured repositories on your system.
5.  sudo yum check-update ---> check which packages have available updates
6.  sudo yum remove packagename ---> remove package

### /etc/yum.repos.d

1.  /etc/yum.repos.d is a directory in a Linux system is where yum repository configuration files are stored. These files are essential for yum (or dnf in newer distributions) to locate and manage software repositories from which it can install and update packages.
2.  This directory contains .repo files, each representing a software repository.

### How It Works

1.  When you use yum to install or update packages, it refers to the .repo files in /etc/yum.repos.d/ to determine where to download the packages from.

2.  If a repository is disabled, yum will not consider it when searching for packages.
