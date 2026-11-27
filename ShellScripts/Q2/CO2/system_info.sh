#!/usr/bin/env bash
# ==============================================================================
# Script: system_info.sh
# Topic: Q2 / CO2 — System Information Reporter
# Description:
#   Displays hostname, current user, OS and kernel version, system uptime,
#   disk usage, and memory summary using portable fallbacks across Linux/WSL.
# Usage:
#   ./system_info.sh
# Exit Codes:
#   0 - Success
#   1 - Unexpected runtime error or unsupported flag
# ==============================================================================

set -u

readonly SCRIPT_NAME="$(basename "$0")"

print_header() {
    local section_title="$1"
    echo ""
    echo "------------------------------------------------------------"
    echo " ${section_title}"
    echo "------------------------------------------------------------"
}

show_usage() {
    echo "Usage: ${SCRIPT_NAME} [--help]"
    echo "Displays basic system, uptime, disk, and memory metrics."
}

get_hostname_info() {
    if command -v hostname >/dev/null 2>&1; then
        hostname
    else
        uname -n
    fi
}

get_os_info() {
    if [[ -r /etc/os-release ]]; then
        local pretty_name
        pretty_name=$(grep -E '^PRETTY_NAME=' /etc/os-release | cut -d '=' -f2- | tr -d '"')
        echo "${pretty_name:-$(uname -s)}"
    else
        uname -s
    fi
}

get_uptime_info() {
    if command -v uptime >/dev/null 2>&1; then
        uptime -p 2>/dev/null || uptime
    else
        echo "uptime command not available in this environment"
    fi
}

get_disk_info() {
    if command -v df >/dev/null 2>&1; then
        df -h .
    else
        echo "df command not available"
        return 1
    fi
}

get_memory_info() {
    if command -v free >/dev/null 2>&1; then
        free -h
    elif [[ -r /proc/meminfo ]]; then
        grep -E '^(MemTotal|MemFree|MemAvailable):' /proc/meminfo
    else
        echo "Memory tool ('free' or /proc/meminfo) unavailable in this shell."
    fi
}

main() {
    if [[ $# -gt 0 ]]; then
        case "$1" in
            -h|--help)
                show_usage
                exit 0
                ;;
            *)
                echo "Error: Unknown option '$1'." >&2
                show_usage >&2
                exit 1
                ;;
        esac
    fi

    print_header "System Identity"
    echo "Hostname     : $(get_hostname_info)"
    echo "Current User : $(whoami)"
    echo "Operating Sys: $(get_os_info)"
    echo "Kernel       : $(uname -r) ($(uname -m))"
    echo "Report Time  : $(date '+%Y-%m-%d %H:%M:%S')"

    print_header "System Uptime"
    get_uptime_info

    print_header "Disk Usage (Current Filesystem)"
    get_disk_info || exit 1

    print_header "Memory Information"
    get_memory_info

    echo ""
    echo "System report completed successfully."
    exit 0
}

main "$@"
