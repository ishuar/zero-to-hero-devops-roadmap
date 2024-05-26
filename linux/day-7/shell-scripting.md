# Introduction

Welcome to Day 7 of the linux fundamentals from Zero to Hero DevOps Roadmap series!
In this section, we'll dive into the world of **Shell Scripting**, an essential skill for DevOps engineers. Shell scripting allows automation of tasks and streamlining of workflows and manage infrastructure more efficiently in the Linux environment.

In simple words shell scripting is an art of executing commands _(pwd,echo, etc)_ with logical sequence in a command line shell environment. This is one of the go-to tools for automating redundant daily operations tasks.

_Here, I will only outline the fundamentals that will empower you with strong foundation and understanding. However, self practice and hands-on is a must to up skill yourself in shell scripting._

## Importance of Executable Permissions

To run a shell script, it must have executable permissions. Without these permissions, the system will not allow the script to be executed. Here's how to set executable permissions:

1. Use the `chmod` command to add executable permissions:

```bash
$ chmod +x ./scripts/script.sh ## Replace script.sh with the file with path you want to make executable.
```
2. Verify the permissions with `ls -l`:

```bash
$ ls -l

## Output ##
# -rwxr-xr-x  1 ishuar  devops  47 May 26 15:38 script.sh
# "x" is for executable
```

This step is essential in any environment where scripts are used for automation or system management.

3. Executing the shell script.

```bash
## <path_to_script>/<script_name>
$ ./scripts/script.sh
```

## Shebang

The shebang (`#!`) line at the beginning of a shell script tells the system which interpreter to use to execute the script. Here's an example:

After `#!`  is the path to your shell interpreter and depends on the system and shell.

- The most popular shebang is `#!/bin/bash`

Some other examples for shebang are:

1. `#!/bin/sh`: Use system shell as interpreter. The system shell is kind of the default shell that system scripts should use
2. `#!/bin/zsh`: Use [Z shell](https://en.wikipedia.org/wiki/Z_shell) as interpreter.
3. `#!/bin/ksh`: Use [Korn Shell](https://en.wikipedia.org/wiki/KornShell) as interpreter.
4. `#!/usr/bin/env bash` : Uses the env command to display the environment variables present in the system and then execute commands with the defined interpreter. _I personally recommend this one_


### Usage

```bash
$ cat scripts/shebang.sh
#!/usr/bin/env bash

echo "this is shebang example"
```
> [!TIP]
> Refer to [shebang.sh](./scripts/shebang.sh) for usage in file.

## Variables

Variables are used to store data in shell scripts. They can be defined and accessed using the `$` symbol. Here's an example:

```bash
$ cat scripts/variables.sh
#!/usr/bin/env bash

name="DevOps"
echo "Hello, $name!"

## OUTPUT ##
# $ ./scripts/variables.sh
# Hello, DevOps!
```

> [!IMPORTANT]
> Spaces are not allowed between variable definition and its value.
> `name="DevOps"` :white_check_mark: `name = "DevOps"` :x:

> [!TIP]
> Refer to [variables.sh](./scripts/variables.sh) for usage in file.

## ControlFlow/Conditionals

Control Flow is one of the most fundamental concepts of computer programming. Like in any other programming language, `if`, `if...else`, `if...elif...else`, and nested if statements in shell scripting are used to execute code when a specific condition is met.

- The most basic `if` statement takes the following form:

```bash
if CONDITION; then
  CODE_TO_EXECUTE
fi
```


- A more advance `if..elif..else` statement takes the following form:

```bash
if CONDITION_01; then
  CODE_TO_EXECUTE_01

elif CONDITION_02; then
  CODE_TO_EXECUTE_02

else
  CODE_TO_EXECUTE_03
fi
```

- Nested `if-else` block can be used when, one condition is satisfies then it again checks another condition

```bash
if CONDITION_01; then
  CODE_TO_EXECUTE_01

else
  if CONDITION_001; then
    CODE_TO_EXECUTE_001
  elif CONDITION_002; then
    CODE_TO_EXECUTE_002
  else
    CONDITION_003
  fi
fi
```


> [!NOTE]
> Generally conditions are [`test`](https://www.gnu.org/software/coreutils/manual/html_node/test-invocation.html#test-invocation) commands but not limited to them.
>  Refer to [control-flow.sh](./scripts/control-flow.sh) for usage in file.

## Loops

