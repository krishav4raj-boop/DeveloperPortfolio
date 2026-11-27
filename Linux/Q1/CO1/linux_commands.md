# Essential Linux Commands Reference (Q1 / CO1)

This document explains 23 core Linux commands required for beginner developer workflows: navigation, file management, text inspection, searching, permissions, process monitoring, disk analysis, and shell utilities.

---

## 1. Navigation & Directory Management

### `pwd` (Print Working Directory)
1. **What it does:** Prints the absolute path of the current working directory.
2. **Realistic example:** `pwd`
3. **Expected result:** Outputs a full path such as `/home/student/DeveloperPortfolio/Linux/Q1/CO1`.
4. **Why it is useful:** Confirms your exact location in the filesystem before creating, moving, or deleting files.

### `ls` (List Directory Contents)
1. **What it does:** Lists files and subdirectories inside the current or specified directory.
2. **Realistic example:** `ls -lah`
3. **Expected result:** Displays permissions, owner, human-readable file sizes, modification timestamps, and hidden files (`.` entries).
4. **Why it is useful:** Lets you verify file names, sizes, and permissions at a glance.

### `cd` (Change Directory)
1. **What it does:** Changes the shell's current working directory.
2. **Realistic example:** `cd ~/DeveloperPortfolio/ShellScripts/Q2/CO2`
3. **Expected result:** Moves the shell prompt into the target folder with exit code `0` (or prints `No such file or directory` if missing).
4. **Why it is useful:** Enables fast movement across project folders without typing full paths for every command.

### `mkdir` (Make Directory)
1. **What it does:** Creates one or more new directories.
2. **Realistic example:** `mkdir -p backups/2026-11`
3. **Expected result:** Creates both `backups` and `backups/2026-11` without failing if parent directories do not yet exist.
4. **Why it is useful:** Organizes code, logs, and backups cleanly into structured folders.

---

## 2. File Creation, Copying, Moving & Safe Removal

### `touch` (Create Empty File / Update Timestamp)
1. **What it does:** Creates a new zero-byte file if it does not exist, or updates the modification timestamp of an existing file.
2. **Realistic example:** `touch notes.txt`
3. **Expected result:** Creates `notes.txt` in the current directory with size `0` bytes.
4. **Why it is useful:** Quickly creates placeholder files, empty logs, or `.gitkeep` markers.

### `cp` (Copy Files and Directories)
1. **What it does:** Copies files or directories from a source path to a destination path.
2. **Realistic example:** `cp -r src/ backup_src/`
3. **Expected result:** Duplicates `src/` and all nested files into `backup_src/` while keeping the original intact.
4. **Why it is useful:** Essential for creating safe backups before editing configuration files or scripts.

### `mv` (Move or Rename Files)
1. **What it does:** Moves files/directories to another location or renames them in place.
2. **Realistic example:** `mv draft_notes.md README.md`
3. **Expected result:** Renames `draft_notes.md` to `README.md` without duplicating data.
4. **Why it is useful:** Keeps repository filenames clean and reorganizes files across folders.

### `rm` (Remove Files or Directories)
1. **What it does:** Permanently deletes files or directories (no Recycle Bin in standard CLI).
2. **Realistic example:** `rm -i old_temp.log`
3. **Expected result:** Prompts `remove regular file 'old_temp.log'?` and deletes only after explicit `y` confirmation.
4. **Why it is useful:** Cleans up temporary files; using `-i` prevents accidental data loss.

---

## 3. Reading, Filtering & Searching Files

### `cat` (Concatenate and Print Files)
1. **What it does:** Reads one or more files and prints their entire contents to standard output.
2. **Realistic example:** `cat requirements.txt`
3. **Expected result:** Prints every line of `requirements.txt` in the terminal.
4. **Why it is useful:** Ideal for inspecting small configuration files, scripts, and short text files.

### `head` (View Beginning of a File)
1. **What it does:** Displays the first *N* lines (default 10) of a file or piped stream.
2. **Realistic example:** `head -n 15 api_response.json`
3. **Expected result:** Prints lines 1 through 15 of `api_response.json`.
4. **Why it is useful:** Lets you inspect large files or CSV/JSON headers without flooding your terminal.

### `tail` (View End of a File)
1. **What it does:** Displays the last *N* lines (default 10) of a file, or follows live updates with `-f`.
2. **Realistic example:** `tail -n 20 /var/log/syslog`
3. **Expected result:** Shows the 20 most recent log lines at the bottom of the file.
4. **Why it is useful:** Crucial for debugging recent errors in application or system log files.

### `grep` (Global Regular Expression Print)
1. **What it does:** Searches text or files for lines matching a pattern or regular expression.
2. **Realistic example:** `grep -rn "ERROR" ./logs/`
3. **Expected result:** Lists every line containing `"ERROR"` along with the filename and line number.
4. **Why it is useful:** Saves huge amounts of time when finding function definitions, configs, or error messages across projects.

### `find` (Search Directory Hierarchy)
1. **What it does:** Recursively searches directories for files matching criteria such as name, type, size, or modification time.
2. **Realistic example:** `find . -type f -name "*.sh"`
3. **Expected result:** Prints the relative path of every `.sh` file under the current directory.
4. **Why it is useful:** Locates misplaced files and powers automation pipelines when combined with file-processing scripts.

---

## 4. Permissions

### `chmod` (Change File Mode / Permissions)
1. **What it does:** Modifies read (`r`), write (`w`), and execute (`x`) permissions for owner, group, and others.
2. **Realistic example:** `chmod +x ShellScripts/Q2/CO2/system_info.sh`
3. **Expected result:** Adds execute permission so the script can run directly via `./system_info.sh`.
4. **Why it is useful:** Required before running custom Bash automation scripts and securing private files (e.g., `chmod 600`).

---

## 5. Process & Resource Monitoring

### `ps` (Process Status)
1. **What it does:** Captures a point-in-time snapshot of running processes.
2. **Realistic example:** `ps aux | grep python`
3. **Expected result:** Lists active Python processes with their PID, CPU %, memory %, and command arguments.
4. **Why it is useful:** Helps verify whether a script or server is running and identify stuck processes.

### `top` (Table of Processes)
1. **What it does:** Displays a live, continuously updating view of CPU load, memory usage, and top resource-consuming processes.
2. **Realistic example:** `top` (press `q` to quit)
3. **Expected result:** Opens an interactive dashboard showing load averages, RAM/swap usage, and per-process CPU/memory metrics.
4. **Why it is useful:** Quickly diagnoses high CPU usage or memory leaks in real time.

### `df` (Disk Free)
1. **What it does:** Reports total, used, and available disk space across mounted filesystems.
2. **Realistic example:** `df -h`
3. **Expected result:** Prints filesystem sizes in human-readable units (`G`, `M`) alongside mount points like `/` and `/home`.
4. **Why it is useful:** Prevents build or deployment failures caused by a full disk.

### `du` (Disk Usage)
1. **What it does:** Calculates the disk space consumed by specific files or directories.
2. **Realistic example:** `du -sh *`
3. **Expected result:** Prints the summarized size of each file and folder in the current directory.
4. **Why it is useful:** Pinpoints which folders, logs, or virtual environments are taking up storage.

---

## 6. System Identity & Shell Utilities

### `whoami` (Effective Username)
1. **What it does:** Prints the username associated with the current effective user ID.
2. **Realistic example:** `whoami`
3. **Expected result:** Outputs a single line with your login username (e.g., `student`).
4. **Why it is useful:** Confirms whether you are running as a standard user or `root` before performing administrative tasks.

### `uname` (Unix Name / System Information)
1. **What it does:** Displays kernel name, hostname, kernel release, and hardware architecture.
2. **Realistic example:** `uname -a`
3. **Expected result:** Outputs a single summary line containing OS kernel, node name, kernel version, and CPU architecture (e.g., `x86_64`).
4. **Why it is useful:** Essential when checking architecture compatibility for binaries, Docker images, or drivers.

### `date` (System Date & Time)
1. **What it does:** Displays or formats the current system date and time.
2. **Realistic example:** `date "+%Y-%m-%d %H:%M:%S"`
3. **Expected result:** Outputs a timestamp such as `2026-11-27 11:30:00`.
4. **Why it is useful:** Used in backup scripts to generate unique timestamped folders and log entries.

### `echo` (Display Line of Text)
1. **What it does:** Prints strings or environment variable values to standard output.
2. **Realistic example:** `echo "Current shell: $SHELL"`
3. **Expected result:** Prints `Current shell: /bin/bash` (expanded variable value).
4. **Why it is useful:** Displays progress messages in Bash scripts and inspects environment variables like `$PATH`.

### `history` (Command History)
1. **What it does:** Lists previously executed shell commands from your session history.
2. **Realistic example:** `history | tail -n 15`
3. **Expected result:** Prints the last 15 numbered commands you ran.
4. **Why it is useful:** Lets you recall complex commands, audit troubleshooting steps, and re-run commands cleanly.
