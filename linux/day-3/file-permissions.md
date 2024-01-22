- [Introduction](#introduction)
- [File Types in Linux](#file-types-in-linux)
- [Permissions Groups](#permissions-groups)
- [Permissions Types](#permissions-types)
- [Viewing the Permissions](#viewing-the-permissions)
- [Permission References](#permission-references)
- [Modifying the Permissions](#modifying-the-permissions)
  - [Owners and Groups](#owners-and-groups)
- [Conclusion](#conclusion)
- [More Helpful YouTube Video Resources](#more-helpful-youtube-video-resources)

## Introduction

Welcome to Day 3 of Linux from the "Zero to Hero DevOps Roadmap" series, where we unravel the essential elements of Linux for aspiring DevOps engineers. Today's focus is on a fundamental aspect that underpins secure and efficient operations in a Linux environment – **file permissions**.

In the world of DevOps, understanding and managing file permissions is more than just a technical necessity; *it's a cornerstone of security, collaboration, and seamless workflow*

## File Types in Linux

As we know by now that in Linux, everything is a file. However, there are different types of files that have different attributes and functions. You can identify the type of a file by looking at the **first character** of its permission string in the long listing format. Here are some of the common file types and their symbols:

1. `-`: Represents a regular file that contains data, such as text, images, audio, video, etc.

   Example:

   ```bash
   $ ls -l file-permissions.md
   -rw-r--r--  1 ishuar  staff  1631 Jan 20 18:32 file-permissions.md
   ```
2. `d`: Represents a directory that contains other files or directories.

   Example:

   ```bash
   ╭─ /zero-to-hero-devops-roadmap/linux ‹linux/day-3●›
   ╰─$ ls -l
   drwxr-xr-x  3 ishuar  staff  96 Jan 20 18:38 day-1
   drwxr-xr-x  3 ishuar  staff  96 Jan 20 18:38 day-2
   drwxr-xr-x  3 ishuar  staff  96 Jan 20 18:37 day-3
   ```
3. `l`: Represents a symbolic link that points to another file or directory.

   Example:

   ```bash
   ╰─$ ls -l symbolic_link
   lrwxr-xr-x  1 ishuar  staff  13 Jan  1  1970 symbolic_link -> test_file.txt
   ```
4. `c`: Represents a character device file that represents a hardware device that transfers data byte by byte, such as a keyboard, mouse, printer, etc.
5. `b`: Represents a block device file that represents a hardware device that transfers data in blocks, such as a disk, CD-ROM, USB drive, etc.

   Example:

   ```bash
   ╰─$ ls -l /dev/disk0
   brw-r-----  1 root  operator  0x1000000 Jan 12 20:41 /dev/disk0
   ```
6. `s`: Represents a socket file that facilitates communication between processes, such as a web server and a web browser.

   Example:

   ```bash
   ╰─$ ls -l /tmp/my_socket
   srwxr-xr-x  1 ishuar  wheel  0 Jan 20 18:46 /tmp/my_socket
   ```

> Temporary socket file is created for demo purposes only.

7. `p`: Represents a pipe file that facilitates communication between processes using a FIFO (first in first out) method.

   Example:

   ```bash
     ╰─$ ls -l /tmp/my_pipe
     prw-r--r--  1 ishuar  wheel  0 Jan 20 18:48 /tmp/my_pipe
   ```

> Temporary pipe file is created for demo purposes only.

`file` command can be used to get more information on the file type and its content.

Example:

```bash
  ╰─$ file file-permissions.md
  file-permissions.md: Unicode text, UTF-8 text, with very long lines (329)
```

## Permissions Groups

Each file and directory has three user based permission groups:

`owner` – The Owner permissions apply only to the owner of the file or directory, they will not impact the actions of other users.
`group` – The Group permissions apply only to the group that has been assigned to the file or directory, they will not affect the actions of other users.
`all users` – The All Users permissions apply to all other users on the system, this is the permission group that you want to watch the most.

## Permissions Types

Each file or directory has three basic permission types:

`read` – The Read permission refers to a user’s capability to read the contents of the file.
`write` – The Write permissions refer to a user’s capability to write or modify a file or directory.
`execute` – The Execute permission affects a user’s capability to execute a file or view the contents of a directory.

## Viewing the Permissions

We can view the permissions by checking the file or directory permissions in your favorite GUI File Manager (which I will not cover here) or by reviewing the output of the `ls -l` command while in the terminal and while working in the directory which contains the file or folder.

For Example:

```bash
╰─$ ls -l file-permissions.md
-rw-r--r--  1 ishuar  staff  4825 Jan 22 00:40 file-permissions.md
```

The permission in above output: `_rw-r--r--  1 ishuar  staff`

1. User rights/Permissions

   1. The first character that is marked with an underscore is the special permission flag that can vary.
   2. The following set of three characters (`rw`) is for the owner permissions.
   3. The second set of three characters (`r`) is for the Group permissions.
   4. The third set of three characters (`r`) is for the All Users permissions.
2. Following that grouping since the integer/number displays the number of hardlinks to the file.
3. The last piece is the Owner and Group assignment formatted as `Owner` `Group`

## Permission References

The permission groups and their references are as follows:

| S.No | Group Type | Reference |
|------|------------|-----------|
| 1    | Owner      | `u`       |
| 2    | Group      | `g`       |
| 3    | Others     | `o`       |
| 4    | All Users  | `a`       |


The permission types and their references are as follows:

| S.No | Permission Type | Reference | Binary Reference |
|------|-----------------|-----------|------------------|
| 1    | Read            | `r`       | `4`              |
| 2    | Write           | `w`       | `2`              |
| 3    | Execute         | `x`       | `1`              |


## Modifying the Permissions

When in the command line, the permissions are edited by using the command `chmod`. You can assign the permissions explicitly or by using a binary reference as described below.

For Example:

Add execute permissions to user `ishuar` on file `file-permissions.md` from above example.

- Using explicit reference:
```bash
╰─$ chmod u+x file-permissions.md
╰─$ ls -l file-permissions.md
-rwxr--r--  1 ishuar  staff  5868 Jan 22 01:00 file-permissions.md
```
or

- Using binary reference:
```bash
╰─$ chmod 744 file-permissions.md
╰─$ ls -l file-permissions.md
-rwxr--r--  1 ishuar  staff  6008 Jan 22 01:02 file-permissions.md
```
>>  7 = 4(read) + 2(write) + 1(execute)

### Owners and Groups

We have encountered owners and groups multiple times in our examples. These can also be modified using the `chown` command with the syntax `chown owner:group filename`.

For Example:

Modify the owner user and owner group for file `file-permissions.md` to `linux-user` and `linux-group` respectively.

```bash
╰─$ chown linux-user:linux-group file-permissions.md
```

## Conclusion

Congratulations on completing Day 3 of Linux from "Zero to Hero DevOps Roadmap" series, where we explored the critical domain of Linux file permissions. As a DevOps engineer, mastering this fundamental aspect is not just about managing access; it's about fortifying the foundation of your system's security.


> If you found this article helpful, please consider following me on GitHub 👉 and giving a star :star: to the repository for future updates.

## More Helpful YouTube Video Resources

This segment caters to individuals who may encounter challenges with text-based learning and have a preference for video tutorials, featuring live hands-on demonstrations.

- [Linux File Permissions in 5 Minutes (English)](https://www.youtube.com/watch?v=LnKoncbQBsM)
- [Linux and Permissions Explained (Hindi)](https://www.youtube.com/watch?v=HgMHAbg4TUk)

<!-- Info and disclaimer --->
>> **Note:**: Some information here is sourced from [Linux Foundation: Understanding Linux File Permissions](https://www.linuxfoundation.org/blog/blog/classic-sysadmin-understanding-linux-file-permissions) article.
