# Q2 — Bash Automation Scripts (CO2)

This folder demonstrates practical Bash scripting using variables, functions, conditionals, loops, argument validation, and clean exit codes.

## Scripts Overview

| Script | Purpose | Key Concepts Used |
| :--- | :--- | :--- |
| [system_info.sh](system_info.sh) | Prints hostname, user, OS/kernel, uptime, disk, and memory info. | Functions, `case`, command checks, fallbacks |
| [backup.sh](backup.sh) | Validates a source folder and copies its contents to a timestamped backup directory. | Positional args, path validation, `mkdir -p`, `cp -R`, exit codes |
| [file_report.sh](file_report.sh) | Counts files and subdirectories, checks disk footprint, and lists top 5 largest files. | Loops (`while read`), `find`, `awk`, `sort`, error handling |
| [menu.sh](menu.sh) | Interactive CLI menu combining system info, disk check, and file reporting. | `while true` loop, `read` input, `case` routing |

---

## How to Run

First, make the scripts executable (on Linux, macOS, or WSL):

```bash
chmod +x system_info.sh backup.sh file_report.sh menu.sh
```

Then run any script:

```bash
./system_info.sh
./backup.sh ../../Linux/Q1/CO1 ./backups
./file_report.sh ../..
./menu.sh
```

*(On Windows with Git Bash, you can also run `bash system_info.sh`.)*

---

## Sample Usage & Expected Output

### 1. `system_info.sh`
- **Command:** `./system_info.sh`
- **Expected Output:** Formatted sections for `System Identity`, `System Uptime`, `Disk Usage`, and `Memory Information`, ending with exit code `0`.

### 2. `backup.sh`
- **Command:** `./backup.sh ../../Linux/Q1/CO1 ./backups`
- **Expected Output:** Creates `./backups/CO1_backup_<YYYYMMDD_HHMMSS>/`, copies all files safely without deleting originals, and prints the number of files copied.

### 3. `file_report.sh`
- **Command:** `./file_report.sh ../../Linux`
- **Expected Output:** Displays total regular files, total subdirectories, disk footprint, and up to 5 largest files sorted by size.

### 4. `menu.sh`
- **Command:** `./menu.sh`
- **Expected Output:** Prompts `Choose an option [1-4]:`, runs the chosen utility, loops cleanly until option `4` is chosen.

---

## Error Handling & Exit Codes

All scripts validate inputs before running operations:
- Passing an unknown flag to `system_info.sh` prints a message to `stderr` and exits with `1`.
- Calling `backup.sh` with no arguments, a non-existent folder, or a regular file instead of a directory exits with `1` (or `2` if unreadable).
- Calling `file_report.sh` on a non-existent path prints `Error: Path '...' does not exist.` to `stderr` and exits with `1`.
- Entering an invalid choice in `menu.sh` warns the user and re-prompts without crashing.
