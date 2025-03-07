### **Day 7: Shell Scripting**
**Task:** Write an automation script
1. Create a script (`backup.sh`) that:
   - Takes a directory as an argument
   - Creates a timestamped backup in `/tmp`
2. Example script:
    <details>
    <summary>Click to view <strong>Hint</strong> !! </summary>

      ```bash
      #!/bin/bash
      backup_dir=$1
      timestamp=$(date +%Y%m%d_%H%M%S)
      backup_file="/tmp/backup_$timestamp.tar.gz"

      if [[ ! -d "$backup_dir" ]]; then
          printf "Error: Directory does not exist\n" >&2
          exit 1
      fi

      tar -czf "$backup_file" "$backup_dir"
      printf "Backup created at %s\n" "$backup_file"
      ```
    </details>
    </br>
3. Make it executable and run it:
    <details>
    <summary>Click to view <strong>Hint</strong> !! </summary>

      ```bash
      chmod +x backup.sh
      ./backup.sh ~/Documents
      ```
    </details>
    </br>
4. **Bonus**: Schedule it in a cron job to run every night at 2 AM.

> [!TIP]
> Use Hint section whenever stuck, google the command and go through its usage and functionality.
