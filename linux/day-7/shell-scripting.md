# Introduction

Welcome to Day 7 of the linux fundamentals from Zero to Hero DevOps Roadmap series!
In this section, we'll dive into the world of **Shell Scripting**, an essential skill for DevOps engineers. Shell scripting allows automation of tasks and streamlining of workflows and manage infrastructure more efficiently in the Linux environment.

In simple words shell scripting is an art of executing commands _(pwd,echo, etc)_ with logical sequence in a command line shell environment. This is one of the go-to tools for automating redundant daily operations tasks.

_Here, I will only outline the fundamentals that will empower you with strong foundation and understanding. However, self practice and hands-on is a must to up skill yourself in shell scripting._


## Shebang

The shebang (`#!`) line at the beginning of a shell script tells the system which interpreter to use to execute the script. Here's an example:

After `#!`  is the path to your shell interpreter and depends on the system and shell.

The most popular shebang is `#!/bin/bash
`

Some other examples for shebang are:

1. `#!/bin/sh`: Use system shell as interpreter. The system shell is kind of the default shell that system scripts should use
2. `#!/bin/zsh`: Use [Z shell](https://en.wikipedia.org/wiki/Z_shell) as interpreter.
3. `#!/bin/ksh`: Use [Korn Shell](https://en.wikipedia.org/wiki/KornShell) as interpreter.
4. `#!/usr/bin/env bash` : Uses the env command to display the environment variables present in the system and then execute commands with the defined interpreter. _ I personally recommend this one_


### Usage

```bash
#!/usr/bin/env bash
echo "this is shebang example"
```