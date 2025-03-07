### **Day 4: User & Groups**
**Task:** Create and manage users/groups
1. Create a new user (`devops_user`) without a home directory.
    <details>
    <summary>Click to view <strong>Hint</strong> !! </summary>

      ```bash
      sudo useradd -M devops_user
      ```
    </details>
    </br>
2. Create a group `devops_team` and add `devops_user` to it.
    <details>
    <summary>Click to view <strong>Hint</strong> !! </summary>

        ```bash
        sudo groupadd devops_team
        sudo usermod -aG devops_team devops_user
        ```
    </details>
    </br>
3. Verify the group membership:
    <details>
    <summary>Click to view <strong>Hint</strong> !! </summary>

        ```bash
        groups devops_user
        ```
    </details>
    </br>
4. Switch to `devops_user` and try accessing files from another user’s home directory.
5. Bonus: List all users and groups in the system.

> [!TIP]
> Use Hint section whenever stuck, google the command and go through its usage and functionality.
