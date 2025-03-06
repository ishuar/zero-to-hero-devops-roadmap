- [Introduction](#introduction)
- [User Management](#user-management)
  - [Adding New User](#adding-new-user)
  - [Setting Passwords](#setting-passwords)
  - [Adding New Group](#adding-new-group)
  - [Updating Group Membership Of Users](#updating-group-membership-of-users)
  - [Deleting Users and Groups](#deleting-users-and-groups)
    - [Deleting Users](#deleting-users)
    - [Deleting Groups](#deleting-groups)
- [Conclusion](#conclusion)
- [More Helpful YouTube Video Resources](#more-helpful-youtube-video-resources)

## Introduction

Welcome to Day 4 of the linux fundamentals from Zero to Hero DevOps Roadmap series! Today, we'll learn a critical aspect of Linux based environments: **user and groups management**.

Just like file permissions, understanding how to manage users and groups is fundamental for ensuring security, access control, and proper resource allocation in a Linux environment.

Let's dive in and explore the steps involved in users and groups management in our journey towards becoming proficient DevOps engineers.

## User Management

In Linux, a user is an account that allows individuals to interact with the system. Each user has a unique identifier known as the User ID (UID), which distinguishes them from other users on the system. Users can own files, run processes, and perform various actions within the confines of their permissions.

In Linux, a group is a collection of users who share common permissions and privileges. It's like a club where users with similar roles or tasks are grouped together.

### Adding New User

To create a new user in Linux, you can use the `useradd` command followed by the desired username and appropriate options. For example:

- To add a new user named `bob` with the description "devops hero", *existing* group "devops" membership and the default home directory.

```bash
$ sudo useradd --create-home --comment "devops hero" --groups devops bob

## Verify User creation (ignore grep to list all users)
$ sudo cat /etc/passwd | grep bob
bob:x:1001:1002:devops hero:/home/bob:/bin/sh

## List group memberships of user bob
$ sudo groups bob
bob : bob devops

```

A user’s home directory serves as their personal workspace on the system, where they can store files, configuration settings, and other personal data.

> **INFO:** You can use `id` command to view user properties such as UID. Use `id --help` for more information.

### Setting Passwords

To set or change a user's password, you can use the `passwd` command followed by the username. For example:

```bash
$ sudo passwd bob

## Expected output
# New password:
# Retype new password:
# passwd: password updated successfully
```

> **INFO:** Users can modify their own passwords without using `sudo`.

### Adding New Group

To create a new group in Linux, you can use the `groupadd` command followed by the desired group name and appropriate options. For example:

- Add a new group name `webadmins` with group ID `1080`

```bash
$ sudo groupadd webadmins --gid 1080

## Verify group creation (ignore grep to list all groups)
$ sudo cat /etc/group | grep webadmins
webadmins:x:1080:
```

### Updating Group Membership Of Users

1. To add a user to a secondary group, you can use the `gpasswd` command with the `-a` option, followed by the username and the group name. For example:

- Add user `bob` to the group `webadmins`

```bash
$ sudo gpasswd -a bob webadmins

## List group memberships of user bob
$ sudo groups bob
bob : bob webadmins

```
> **INFO:** `usermod` command can be also used with `-aG` options. Use `usermod --help` for more information.

2. To remove a user from a group, you can use the `gpasswd` command with the `-d` option, followed by the username and the group name. For example:

- Remove user `bob` from the group `webadmins`

```bash
$ sudo gpasswd -d bob webadmins

## List group memberships of user bob
$ sudo groups bob
bob : bob
```

### Deleting Users and Groups

#### Deleting Users

To delete a user from the system, you can use the `userdel` command followed by the username. For example:

- Delete user `bob`

```bash
$ sudo userdel bob
```

#### Deleting Groups

To delete a group from the system, you can use the `groupdel` command followed by the group name. For example:

```bash
$ sudo groupdel webadmins
```

## Conclusion

Congratulations on completing Day 4 of Linux from "Zero to Hero DevOps Roadmap" series, where we explored Users and group administration in Linux.It is crucial for efficient system management and security in DevOps.

By mastering the commands and techniques discussed, you can effectively create, modify, and delete users and groups, ensuring proper access control and collaboration. With these skills, you're equipped to manage Linux users and groups confidently as you progress on your DevOps journey.

> If you found this article helpful, please consider following me on GitHub 👉 and giving a star :star: to the repository for future updates.


## More Helpful YouTube Video Resources

This segment caters to individuals who may encounter challenges with text-based learning and have a preference for video tutorials, featuring live hands-on demonstrations.

- [Linux Crash Course - Managing Users (English)](https://www.youtube.com/watch?v=19WOD84JFxA)
- [Linux Crash Course - Managing Groups (English)](https://www.youtube.com/watch?v=GnlgAD8-GhE)
- [Linux User/Group Account Management (Hindi)](https://www.youtube.com/watch?v=vLuFkesBPcM)
