- [Introduction](#introduction)
  - [What is Package Management ?](#what-is-package-management-)
  - [Package Managers](#package-managers)
    - [High and low-level package tools](#high-and-low-level-package-tools)
    - [Common Usage of Low-Level Tools](#common-usage-of-low-level-tools)
    - [Common Usage of High-Level Tools](#common-usage-of-high-level-tools)
    - [CentOS and Fedora Helpful Information](#centos-and-fedora-helpful-information)
  - [Conclusion](#conclusion)
- [More Helpful YouTube Video Resources](#more-helpful-youtube-video-resources)

## Introduction

Welcome to Day 5 of the linux fundamentals from Zero to Hero DevOps Roadmap series! Today, we'll explore an essential aspect of Linux based environments: **package management**.

Let's have a overview of what package management is.

### What is Package Management ?

_Package management_ in Linux involves the installation, updating, and removal of software packages on a system. These packages typically contain precompiled binaries, libraries, and configuration files required for various applications to run smoothly.

In a nutshell, package management is a method of installing and maintaining (which includes updating and removing as well) software on the system.

Let's dive into the world of package management in Linux and learn how to install, update, and remove software packages effectively.

### Package Managers

_Package managers_ are programs that automate software management tasks, ensuring consistency and efficiency across systems while resolving dependencies and conflicts.

The two prominent ones are [APT (Advanced Package Tool)](https://en.wikipedia.org/wiki/Advanced_Package_Tool) and [YUM (Yellowdog Updater, Modified)](https://en.wikipedia.org/wiki/Yum_(software)).

Because different distribution families use different packaging systems (Debian: *.deb / CentOS: *.rpm / openSUSE: *.rpm built specially for openSUSE), a package intended for one distribution will not be compatible with another distribution.


#### High and low-level package tools

In order to perform the task of package management effectively, you need to be aware that you will have two types of available utilities: low-level tools (which handle in the backend the actual installation, upgrade, and removal of package files), and high-level tools (which are in charge of ensuring that the tasks of dependency resolution and metadata searching -”data about the data”- are performed).


| DISTRIBUTION | LOW-LEVEL TOOL                                                              | HIGH-LEVEL TOOL  |
|--------------|-----------------------------------------------------------------------------|------------------|
| Debian       | [`dpkg`](https://man7.org/linux/man-pages/man1/dpkg.1.html "dpkg man page") | apt-get/aptitude |
| CentOS       | [`rpm`](https://rpm.org/ "rpm.prg")                                         | yum              |
| openSUSE     | [`rpm`](https://rpm.org/ "rpm.prg")                                         | zypper           |

> **INFO:**  ref to `rpm` man page at  [here](https://man7.org/linux/man-pages/man8/rpm.8.html "rpm man page"))


#### Common Usage of Low-Level Tools


1. Installing a package from a compiled (*.deb or *.rpm) file

The downside of this installation method is that no dependency resolution is provided. You will most likely choose to install a package from a compiled file when such package is not available in the distribution’s repositories and therefore cannot be downloaded and installed through a high-level tool. Since low-level tools do not perform dependency resolution, they will exit with an error if we try to install a package with unmet dependencies.

```bash
$ dpkg -i file.deb 		## [Debian and derivative]
```

2. Upgrading a package from a compiled file

It will only upgrade an installed package manually when it is not available in the central repositories.

```bash
$ dpkg -i file.deb 		## [Debian and derivative]
```

3. Listing installed packages

When you first get your hands on an already working system, chances are you’ll want to know what packages are installed.

```bash
$ dpkg -l		## [Debian and derivative]
```

If you want to know whether a specific package is installed, you can pipe the output of the above commands to [`grep`](https://man7.org/linux/man-pages/man1/grep.1.html "grep man page") and search for the package name. Suppose we need to verify if package `mysql-common` is installed on an Ubuntu system.

```bash
$ dpkg -l | grep mysql-common  ## [Debian and derivative]
```

4. Finding out which package installed a file

For example, which package installed `file_name` in system?

```bash
$ dpkg --search file_name  ## [Debian and derivative]
```

> **INFO:** While the examples are aimed at Debian and its derivatives, I encourage you to try `rpm` on CentOS or OpenSUSE for a well-rounded experience!

> **INFO:** `sudo` rights might be required if permissions are missing.

#### Common Usage of High-Level Tools

Before we start using the high-level tools, let’s learn some essential terminology:

- `Repository`: A storage location where packages are kept and can be retrieved and installed by tool.

- `Package`: A compressed archive containing all the files and information necessary for a software application.

- `Dependency`: A package that another package relies on to function properly.

> **INFO:** To keep the hands-on spirit alive, let's assume we're using Debian and its derivatives. Feel free to experiment with OpenSUSE and CentOS to further enhance your skills!

1. Update package repositories

we need to update our repositories on our Linux OS. We do that by using this command:

```bash
$ sudo apt update
```
2. Search for packages

You can locate specific packages using `apt`, by typing the command `apt search` in your terminal. For instance, if you're searching for information related to `nginx`, you can type:

```bash
$ sudo apt search nginx
```

This command will provide you with a list of packages related to Nginx, making it easier to identify and install the desired components on your Linux system.

3. Installing a package from a repository

While installing a package, you may be prompted to confirm the installation after the package manager has resolved all dependencies. High Level tools take cares of the dependency resolution.

- To install htop, we use the command:

```bash
$ sudo apt install htop
```

1. Removing a package

The option `remove` will uninstall the package but leaving configuration files intact, whereas `purge` will erase every trace of the program from your system.

- To remove htop, we use the command:

```bash
## For only removing htop
$ sudo apt remove htop
```

This will remove the `htop` from out system. If we want to delte any remaning files, or any configuration file, after we remove the package, we use another command in order to clean the system.

```bash
## For purging all traces of the htop
$ sudo apt purge htop
```
- (1.1) Autoremoval of packages and dependencies.

When we install a package using apt install, it also installs its dependencies on our system. However, if we later remove the package with apt remove, those dependencies remain. To clean up and remove both the package and its dependencies, we use autoremove. This command helps ensure a tidy system by clearing out any lingering components.

```bash
sudo apt autoremove htop
```

> **INFO:** At the end of an apt command, don’t forget to keep your system up to date. Get familiar with this command: sudo apt upgrade. It helps you make sure your system has the latest updates.


1. Displaying information about a package

The following command will display information about the birthday package.

```bash
$ sudo apt show birthday

### <---- output ----> ###
# Package: birthday
# Version: 1.6.2-4.1
# Priority: optional
# Section: universe/misc
# Origin: Ubuntu
# Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
# Original-Maintainer: Patrick Uiterwijk <puiterwijk@gmail.com>
# Bugs: https://bugs.launchpad.net/ubuntu/+filebug
# Installed-Size: 66.6 kB
# Depends: libc6 (>= 2.17)
# Recommends: perl
# Homepage: http://sourceforge.net/projects/birthday/
# Download-Size: 20.6 kB
# APT-Sources: http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 Packages
# Description: Display information about pending events on login

```

#### CentOS and Fedora Helpful Information

The `yum` command is the same as the `apt` command. They use the same syntax for updating, searching, installing, removing and upgrading the system. Instead of usign apt (as we use in Ubuntu and Debian) for Centos, Red Hat, Fedora etc. we use the `yum` command. For example, `sudo yum search htop` or `sudo yum install htop` etc.

I highly recommend trying out `yum` on CentOS and Fedora to broaden your hands-on experience.

### Conclusion

Congratulations on completing Day 5 of Linux from "Zero to Hero DevOps Roadmap" series, where we explored package management in Linux.

From installing packages to cleaning up leftovers, we have covered the essentials. Just remember, when in doubt, `sudo apt --help / sudo yum —-help` is your guide, and keeping things fresh with `sudo apt upgrade` or `sudo yum upgrade` this makes sure your system is always running on the latest and greatest.

So, go ahead, explore the Linux package universe and keep doing it until you are used to the commands. And never forget, keep learning and live simple!

> If you found this article helpful, please consider following me on GitHub 👉 and giving a star :star: to the repository for future updates.

## More Helpful YouTube Video Resources

This segment caters to individuals who may encounter challenges with text-based learning and have a preference for video tutorials, featuring live hands-on demonstrations.

- [Package Management with DPKG and APT (English)](https://www.youtube.com/watch?v=f_nn70DWYRo)
- [Linux Package Management **Series** (Hindi)](https://www.youtube.com/playlist?list=PLK73SZ5kBqGc2yRtb3a3X64EO9PdIX_BA)

> **INFO:** Yum-based tutorials have not been included yet. Consider exploring them as an additional task. Reach out to me directly if you need any help.
