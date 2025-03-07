### **Day 1: Filesystem Structure**
**Task:** Navigate and explore your system's filesystem
1. Run `ls -l /` and understand the purpose of each directory (like `/etc`, `/var`, `/usr`, etc.).
2. Find the **largest** files in `/var/log` using:
    <details>
    <summary>Click to view <strong>Hint</strong> !! </summary>

      ```bash
      sudo du -ah /var/log | sort -rh | head -10
      ```
    </details>

3. Check the **disk usage** of your root directory (`/`) and home directory (`~`) using:
    <details>
    <summary>Click to view <strong>Hint</strong> !! </summary>

      ```bash
      df -h
      du -sh ~
      ```
    </details>


4. **Bonus**: Create a summary (`filesystem_summary.txt`) with what you learned.

> [!TIP]
> Use Hint section whenever stuck, google the command and go through its usage and functionality.
