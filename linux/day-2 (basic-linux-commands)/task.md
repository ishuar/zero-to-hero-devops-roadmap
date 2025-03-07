### **Day 2: Basic Linux Commands**
**Task:** Work with files, directories, and processes
1. Create a directory named `DevOps` and inside it, create 5 text files (`log1.txt`, `log2.txt` ...).
2. Add sample content to each file using `echo` or `cat > filename`.
3. Find files modified in the last 24 hours:
    <details>
    <summary>Click to view <strong>Hint</strong> !! </summary>

      ```bash
      find ~/DevOps -type f -mtime -1
      ```
    </details>

4. List only files owned by you in `/etc`:
    <details>
    <summary>Click to view <strong>Hint</strong> !! </summary>
      ```bash
      find /etc -type f -user $(whoami) 2>/dev/null
      ```
   </details>

5. Bonus: Monitor system resource usage using `top`, `htop`, or `vmstat`.

> [!TIP]
> Use Hint section whenever stuck, google the command and go through its usage and functionality.
