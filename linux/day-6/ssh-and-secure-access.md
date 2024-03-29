- [Introduction](#introduction)
- [What is SSH?](#what-is-ssh)
- [Install OpenSSH Server](#install-openssh-server)
- [Using SSH for Secure Access](#using-ssh-for-secure-access)
  - [Generating SSH Key Pair](#generating-ssh-key-pair)
  - [Copying Public Key to Remote Server](#copying-public-key-to-remote-server)
  - [Logging in with SSH](#logging-in-with-ssh)
  - [Securing SSH Configuration](#securing-ssh-configuration)
    - [Disabling Root Login](#disabling-root-login)
    - [Limiting SSH Access](#limiting-ssh-access)
    - [More on Secure SSH Access](#more-on-secure-ssh-access)
- [Practical Use Cases of SSH](#practical-use-cases-of-ssh)
  - [Infrastructure Management](#infrastructure-management)
  - [Application Deployment](#application-deployment)
  - [Collaborative Development](#collaborative-development)
- [Conclusion](#conclusion)
- [More Helpful YouTube Video Resources](#more-helpful-youtube-video-resources)

## Introduction

Welcome to Day 6 of the linux fundamentals from Zero to Hero DevOps Roadmap series!
Today, we'll delve into the critical topic of **SSH (Secure Shell)** and **secure access** in Linux. As a DevOps engineer, whether you are managing/automating cloud infrastructure, deploying applications, and collaborating with team members setting up SSH (Secure Shell) is a fundamental step in ensuring the integrity and confidentiality of your data and operations.

Let's explore it further.

## What is SSH?

SSH, or Secure Shell, is a cryptographic network protocol that provides a secure way to access and manage remote systems over an unsecured network. It encrypts the communication between the client and the server, ensuring that sensitive data such as passwords, commands, and file transfers are protected from eavesdropping and manipulation by malicious entities.

> **INFO:** More details at [Official Ubuntu Documentation](https://help.ubuntu.com/community/SSH)

## Install OpenSSH Server

Before installing OpenSSH server on your Linux machine, it's a good idea to check if it's already installed. You can do this using the `service` command to see if the SSH service is present and running.

```bash
$ service ssh status

## Output ##
# * sshd is running

# If not running
$ sudo service ssh start

## Output ##
# * Starting OpenBSD Secure Shell server sshd
```

If OpenSSH server is not already installed on your Linux machine, you can easily install it using your distribution's package manager. Below are the commands for installing OpenSSH server on some common Linux distributions:

- Debian/Ubuntu

```bash
sudo apt-get update
sudo apt-get install openssh-server
```
- Fedora

```bash
sudo dnf install openssh-server
```

You can also enable the SSH service to start automatically at boot:

```bash
sudo systemctl enable sshd
```

## Using SSH for Secure Access

To use SSH for secure access, you need to generate an SSH key pair on your local machine. This key pair consists of a public key and a private key. The private key remains on your local machine, while the public key is copied to the remote server.

### Generating SSH Key Pair

Use below command to generate ssh key pair and follow prompts.

```bash
$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

> **INFO:** This command generates a new SSH key pair with the RSA algorithm and a key length of 4096 bits. Remember to replace "your_email@example.com" with your email address.

If no changes and accepted the prompts as it is then the keys should be available in `~/.ssh/` directory.

```bash
$ ls ~/.ssh/

## Output ##
# id_rsa  id_rsa.pub
```

### Copying Public Key to Remote Server

Use below command to copy your public key to remote server/machine.

```bash
$ ssh-copy-id user@remote_host
```

Replace "user" with your username on the remote server and "remote_host" with the hostname or IP address of the remote server.


**For example:**

- From root user setting ssh access for `test` user with the created RSA key.

```bash
$ ssh-copy-id test@localhost

## Output ###
# /usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/root/.ssh/id_rsa.pub"
# The authenticity of host 'localhost (127.0.0.1)' can't be established.
# ED25519 key fingerprint is SHA256:O2by7geIVy4JVfrX3QIYPo3Q6buyDgZB0xwYte5isLc.
# This key is not known by any other names
# Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
# /usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
# /usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
# test@localhost's password:

# Number of key(s) added: 1

# Now try logging into the machine, with:   "ssh 'test@localhost'"
# and check to make sure that only the key(s) you wanted were added.
```
### Logging in with SSH

Once the public key is copied to the remote server, you can log in securely using SSH using below command.

```bash
$ ssh user@remote_host
```

Replace "user" with your username on the remote server and "remote_host" with the hostname or IP address of the remote server.

**For example:**

- Use `test` user to sign in with `ssh` which was set up in [previous step](#copying-public-key-to-remote-server)

```bash
root@d50b92cc14e8:/# ssh test@localhost

## Output ##
# Welcome to Ubuntu 22.04.3 LTS (GNU/Linux 6.4.16-linuxkit aarch64)

#  * Documentation:  https://help.ubuntu.com
#  * Management:     https://landscape.canonical.com
#  * Support:        https://ubuntu.com/advantage

# This system has been minimized by removing packages and content that are
# not required on a system that users do not log into.

# To restore this content, you can run the 'unminimize' command.
# $
# $ id
# uid=1000(test) gid=1000(test) groups=1000(test)
```

### Securing SSH Configuration

After configuring SSH access on your Linux system, it's essential to prioritize securing the SSH configuration to prevent unauthorized access and enhance overall system security.

#### Disabling Root Login

To enhance security, it's recommended to disable root login via SSH. This prevents attackers from directly logging in as root, reducing the risk of unauthorized access to the system.

Edit the SSH configuration file `/etc/ssh/sshd_config` and set `PermitRootLogin` to `no`.

#### Limiting SSH Access

You can limit SSH access to specific users or groups by editing the SSH configuration file `/etc/ssh/sshd_config` and using the `AllowUsers` or `AllowGroups` directive. This allows you to control who can access the system via SSH, enhancing security.

#### More on Secure SSH Access

In our journey to secure SSH access, we've only scratched the surface and used most common patterns.

There are additional configurations and best practices we can implement to further enhance security and improve user experience. For a deeper dive into this topic, I recommend checking out RedHat's article ["Eight ways to protect SSH access on your system"](https://www.redhat.com/sysadmin/eight-ways-secure-ssh).

## Practical Use Cases of SSH

Now that we've covered the fundamentals of SSH, let's delve into its practical use cases.

SSH serves as a versatile tool for DevOps engineers, enabling secure remote access and facilitating various tasks across infrastructure management, application deployment, collaborative development.

### Infrastructure Management

SSH is a cornerstone tool in managing infrastructure across various environments. Some common use cases include:

1. Infrastructure Provisioning

Infrastructure as Code (IaC) tools like Ansible or Puppet utilize SSH to provision and configure servers, virtual machines, or cloud instances. They SSH into target systems to apply configurations, install software packages, and enforce desired state configurations.

2. Cloud Instance Management

SSH plays a crucial role in managing cloud instances on platforms such as AWS, Azure, and Google Cloud. Engineers can SSH into virtual machines, containers, or serverless environments to deploy applications, configure networking, and monitor performance.

3. Secure File Transfer

The scp (secure copy) command allows for secure file transfers between local and remote systems using SSH encryption. Engineers can transfer configuration files, log files, or application artifacts securely between servers.

###  Application Deployment

CI/CD pipelines often utilize SSH to deploy code changes automatically. Tools like Jenkins or GitLab CI/CD or GitHub Actions can SSH into target servers, run deployment scripts, and verify application health checks and make deployments as per configurations.

### Collaborative Development

SSH enables collaborative development by providing secure access to shared development environments or version control systems. Use cases include:

1. Code Collaboration

Team members can SSH into shared development servers to collaborate on coding tasks, conduct code reviews, and troubleshoot issues together in real-time.

2. Version Control Systems (VCS)

Git, Subversion, and other VCS platforms support SSH-based authentication for secure access to code repositories. Developers use SSH keys to push, pull, and manage code changes across distributed teams, ensuring version control and collaboration.

> **INFO:** More on this at [Official GitHub: Connecting with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh) article.

## Conclusion

Congratulations on completing Day 6 of Linux from "Zero to Hero DevOps Roadmap" series, where we explored SSH and Secure Access.

In conclusion, SSH is a powerful tool for secure remote access in Linux, indispensable for DevOps engineers managing infrastructure and collaborating with team members. By following best practices such as generating SSH key pairs, securing SSH configuration, and using SSH keys for authentication, you can ensure secure access to remote systems in your DevOps workflow.

Happy secure SSH-ing!

> If you found this article helpful, please consider following me on GitHub 👉 and giving a star :star: to the repository for future updates.

## More Helpful YouTube Video Resources

This segment caters to individuals who may encounter challenges with text-based learning and have a preference for video tutorials, featuring live hands-on demonstrations.

- [SSH Key Linux secure remote authentication to your Server (English)](https://www.youtube.com/watch?v=U_uiVyF6MEs)
- [SSH Protocol Explained (English)](https://www.youtube.com/watch?v=0Sffl7YO0aY)
- [What is SSH and how SSH works? (Hindi)](https://www.youtube.com/watch?v=QPBhfdXhfXw)
- [How to generate SSH keys on LINUX | ssh configuration in linux (Hindi)](https://www.youtube.com/watch?v=xdXBVNYPvuk)
