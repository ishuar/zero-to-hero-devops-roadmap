### **Day 5: Package Management**
**Task:** Install, remove, and update packages
1. Install `tree` and `htop` using:
    <details>
    <summary>Click to view <strong>Hint</strong> !! </summary>

      ```bash
      sudo apt install tree htop   # (For Debian/Ubuntu)
      sudo yum install tree htop   # (For CentOS/RHEL)
      ```
    </details>
    </br>
2. List all installed packages and filter ones related to "python":
    <details>
    <summary>Click to view <strong>Hint</strong> !! </summary>

      ```bash
      dpkg -l | grep python        # (For Debian/Ubuntu)
      rpm -qa | grep python        # (For RHEL/CentOS)
      ```
    </details>
    </br>
3. Remove `tree` and check if it is removed:
    <details>
    <summary>Click to view <strong>Hint</strong> !! </summary>

      ```bash
      sudo apt remove tree -y
      ```
    </details>
    </br>
4. Check system updates without applying them.
    <details>
    <summary>Click to view <strong>Hint</strong> !! </summary>

      ```bash
      sudo apt update --dry-run
      ```
    </details>
    </br>
5. Bonus: Enable and configure automatic security updates.
