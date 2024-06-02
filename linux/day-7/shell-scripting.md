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
> For example `name="DevOps"` is :white_check_mark: , however `name = "DevOps"` is :x:

> [!TIP]
> Refer to [variables.sh](./scripts/variables.sh) for usage in file.

## Conditionals

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

- Nested `if-else` block can be also used when, one condition is satisfies then it again checks another condition. One of the form can be as follows:

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
>  Refer to [conditionals.sh](./scripts/conditionals.sh) for usage in file.

## Loops

Loops are used to repeatedly execute a block of code and  keep re-running them until a particular situation is reached. They are useful for automating repetitive tasks.

Shell scripting supports several types of loops, and most common are `for`, `while`, and `until` loops.


### for Loop

The `for` loop iterates over a list of items and executes a block of code for each item.

- `for` loop takes the following form:

```bash
for ITERATOR in LIST_OF_ITERATIONS; do
  CODE_TO_EXECUTE
done
```
- Simple Example:

```bash
for i in 1 2 3 4 5; do
  echo "Iteration number $i"
done
```

This loop will print the iteration number for each value in the list.

### while Loop

The while loop executes a block of code as long as a specified condition is true.

- `while` loop takes the following form:

```bash
while CONDITION;do
  CODE_TO_EXECUTE
done
```

- Simple Example:

```bash
count=1
while [ $count -le 5 ]; do
  echo "Count is $count"
  ((count++))
done
```

This loop will print the count from 1 to 5.

### until Loop

The until loop is similar to the while loop, but it executes the block of code until the specified condition becomes true.

- `until` loop takes the following form:

```bash
until CONDITION;do
  CODE_TO_EXECUTE
done
```
- Simple Example:

```bash
count=1
until [ $count -gt 5 ]; do
  echo "Count is $count"
  ((count++))
done
```

This loop will also print the count from 1 to 5.

> [!TIP]
> Refer to [loops.sh](./scripts/loops.sh) for usage in file.

## break and continue

You can control the loop execution using the break and continue statements. break exits the loop, while continue skips to the next iteration.

For example:

- In this loop the execution stops when `i` equals `5`.

```bash
for i in {1..10}; do
  if [ "$i" -eq 5 ]; then
    break
  fi
  echo "Iteration $i"
done
```

- In this loop, the iteration for `i` equals `5` is skipped.

```bash
for i in {1..10}; do
  if [ "$i" -eq 5 ]; then
    continue
  fi
  echo "Iteration $i"
done
```

## Functions

In programming, A function is a block of code that performs some tasks and it can be called multiple times for performing tasks. It provides modularity in the program and reduces the code length.

### Function Definition

A function definition takes either of the following form:

1. Using reserved word `function`.

```bash
function function_name {
  CODE_TO_EXECUTE
}
```

2. Using function name followed with parentheses`()`.

```bash
function_name () {
  CODE_TO_EXECUTE
}
```

Either of the above methods of specifying a function is valid. Both operate the same and there is no advantage or disadvantage to one over the other. It's really just personal preference.

> [!NOTE]
> I find the first option easier to use, but this is a very subjective opinion.

### Function with arguments

You can also pass multiple arguments to a function using `$<NUMBER>` with respective number as positional arguments.


A function definition with two arguments takes the following form:

```bash
function function_name {
  CODE_TO_EXECUTE $1 $2 # and so on
}
```
> [!IMPORTANT]
> Arguments can be used anywhere in function body (code) as per logic.

> [!TIP]
> Refer to [functions.sh](./scripts/functions.sh) for usage in file.

## Conclusion

Congratulations on completing Day 7 of Linux from "Zero to Hero DevOps Roadmap" series, where we explored fundamentals of shell scripting.

This tutorial is just the tip of the iceberg that covers the fundamentals of shell scripting, including variables, conditionals, loops, functions, and the importance of executable permissions.

Shell scripting, like any programming language, has extensive documentation. The goal of this guide is to give you a solid starting point. Don’t stop here—keep advancing your learning and exploring the depths of what shell scripting can offer.

> If you found this article helpful, please consider following me on GitHub 👉 and giving a star :star: to the repository for future updates.


## More Helpful YouTube Video Resources

This segment caters to individuals who may encounter challenges with text-based learning and have a preference for video tutorials, featuring live hands-on demonstrations.

- [Bash Scripting Tutorial For Beginners (English)](https://www.youtube.com/watch?v=tK9Oc6AEnR4)
- [Shell Script Complete Tutorial Playlist (Hindi)](https://www.youtube.com/playlist?list=PL6XT0grm_TfgvfQH58GEoEZrTyVl0ABnH)
