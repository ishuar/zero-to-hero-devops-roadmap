### **Day 3: File Permissions**
**Task:** Secure and manage file permissions
1. Create a script (`my_script.sh`) and write some sample shell code inside it.
2. Change permissions to **only** allow you to execute it:
    <details>
    <summary>Click to view <strong>Hint</strong> !! </summary>

      ```bash
      chmod 700 my_script.sh
      ```
   </details>

3. Try running it as another user (using `su` or `sudo -u anotheruser`).
4. Change ownership of a file to another user (if possible):
    <details>
    <summary>Click to view <strong>Hint</strong> !! </summary>

      ```bash
      sudo chown anotheruser:anothergroup my_script.sh
      ```
    </details>

5. Bonus: Find files with **777** permissions and fix them.
    <details>
    <summary>Click to view <strong>Hint</strong> !! </summary>

      ```bash
      find /home -type f -perm 0777 -exec chmod 644 {} \;
      ```
    </details>


> [!TIP]
> Use Hint section whenever stuck, google the command and go through its usage and functionality.
