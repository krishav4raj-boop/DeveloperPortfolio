# Test Commands for Q2 Shell Scripts (CO2)

Run these commands from inside `ShellScripts/Q2/CO2/` to verify both normal execution and error handling. Capture screenshots of both successful runs and error-handling runs for `Screenshots/ShellScripts/`.

---

## 1. Syntax Validation (Dry Check)

```bash
bash -n system_info.sh backup.sh file_report.sh menu.sh
echo "Exit code: $?"
```
Expected: No syntax errors, exit code `0`.

---

## 2. `system_info.sh` Tests

```bash
# Help flag
./system_info.sh --help

# Normal execution
./system_info.sh
echo "Exit code: $?"

# Invalid flag error handling
./system_info.sh --invalid-flag
echo "Exit code: $?"
```
Expected: `--help` and normal run exit `0`; `--invalid-flag` prints an error and exits `1`.

---

## 3. `backup.sh` Tests

```bash
# Missing argument (error case)
./backup.sh
echo "Exit code: $?"

# Non-existent source directory (error case)
./backup.sh ./does_not_exist
echo "Exit code: $?"

# Valid backup into a temporary test folder
mkdir -p /tmp/test_src
echo "sample data" > /tmp/test_src/demo.txt
./backup.sh /tmp/test_src /tmp/test_backups
echo "Exit code: $?"
ls -la /tmp/test_backups
```
Expected: Missing/invalid paths exit `1`; valid backup creates a timestamped copy and exits `0`.

---

## 4. `file_report.sh` Tests

```bash
# Default (current directory)
./file_report.sh
echo "Exit code: $?"

# Specific directory
./file_report.sh ../../Linux/Q1/CO1
echo "Exit code: $?"

# Invalid directory (error case)
./file_report.sh ./no_such_folder
echo "Exit code: $?"
```
Expected: Valid directories print file/directory counts and largest files (`0`); invalid path prints an error (`1`).

---

## 5. `menu.sh` Interactive Test

```bash
./menu.sh
```
Test steps during interactive prompt:
1. Enter `9` -> confirm invalid input message appears and menu reloads.
2. Enter `1` -> confirm system information prints.
3. Enter `2` -> confirm disk usage prints.
4. Enter `3` and press Enter for `.` -> confirm directory file report prints.
5. Enter `4` -> confirm clean exit (`Exiting utility menu. Goodbye!`).
