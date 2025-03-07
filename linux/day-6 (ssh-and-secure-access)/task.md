### **Day 6: SSH and Secure Access**
**Task:** Set up SSH keys for passwordless login
1. Generate an SSH key pair (without a passphrase).
    <details>
    <summary>Click to view <strong>Hint</strong> !! </summary>

      ```bash
      ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa
      ```
    </details>

2. Copy the public key to a remote server (or your localhost for testing).
    <details>
    <summary>Click to view <strong>Hint</strong> !! </summary>

      ```bash
      ssh-copy-id user@remote_host
      ```
    </details>

3. Try logging in without a password:
    <details>
    <summary>Click to view <strong>Hint</strong> !! </summary>

   ```bash
      ssh user@remote_host
   ```
    </details>

4. Secure SSH by disabling root login (`PermitRootLogin no`) in `/etc/ssh/sshd_config`.
5. Restart the SSH service and verify security settings.
