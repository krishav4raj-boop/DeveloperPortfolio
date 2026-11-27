#!/usr/bin/env bash
# ==============================================================================
# File: commands.sh
# Topic: Q1 / CO1 — Safe Linux Information & Navigation Demonstration
# Description:
#   Demonstrates non-destructive Linux commands for inspecting the user,
#   working directory, OS/kernel, CPU, memory, disk usage, and processes.
#   Safe to run repeatedly on any Linux, WSL, or Unix-like environment.
# ==============================================================================

set -u

print_section() {
    local title="$1"
    echo ""
    echo "============================================================"
    echo " ${title}"
    echo "============================================================"
}

print_section "1. Current User & Date/Time (whoami, id, date)"
echo "User      : $(whoami)"
echo "User IDs  : $(id)"
echo "Date/Time : $(date '+%Y-%m-%d %H:%M:%S %Z')"

print_section "2. Current Directory & Listing (pwd, ls)"
echo "Directory : $(pwd)"
ls -la

print_section "3. Operating System & Kernel (uname, /etc/os-release)"
uname -a
if [[ -r /etc/os-release ]]; then
    grep -E '^(NAME|VERSION)=' /etc/os-release || true
else
    echo "Note: /etc/os-release is not present on this environment."
fi

print_section "4. CPU & Memory Summary (lscpu / nproc / free)"
if command -v nproc >/dev/null 2>&1; then
    echo "CPU Cores : $(nproc)"
fi
if command -v free >/dev/null 2>&1; then
    free -h
else
    echo "Note: 'free' command not available in this shell."
fi

print_section "5. Disk Space & Current Folder Size (df, du)"
df -h .
du -sh .

print_section "6. Active Processes Snapshot (ps)"
if ps -e -o pid,comm >/dev/null 2>&1; then
    ps -e -o pid,comm | head -n 10
else
    ps | head -n 10
fi

echo ""
echo "Safe Linux inspection complete."
