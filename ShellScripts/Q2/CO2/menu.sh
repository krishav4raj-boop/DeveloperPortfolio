#!/usr/bin/env bash
# ==============================================================================
# Script: menu.sh
# Topic: Q2 / CO2 — Interactive Shell Utility Menu
# Description:
#   Provides an interactive menu allowing users to inspect system info,
#   disk usage, run a directory file report, or exit cleanly.
# Usage:
#   ./menu.sh
# Exit Codes:
#   0 - Exited normally
#   1 - Required helper script missing
# ==============================================================================

set -u

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

show_menu() {
    echo ""
    echo "========================================"
    echo "   Beginner DevOps Shell Utility Menu   "
    echo "========================================"
    echo "  1. System Information"
    echo "  2. Disk Information"
    echo "  3. Directory File Report"
    echo "  4. Exit"
    echo "========================================"
}

run_system_info() {
    local target="${SCRIPT_DIR}/system_info.sh"
    if [[ -f "${target}" ]]; then
        bash "${target}"
    else
        echo "Error: '${target}' not found." >&2
        return 1
    fi
}

run_disk_info() {
    echo ""
    echo "--- Disk Usage Summary (df -h) ---"
    if command -v df >/dev/null 2>&1; then
        df -h
    else
        echo "Error: 'df' command is not available." >&2
        return 1
    fi
}

run_file_report() {
    local target="${SCRIPT_DIR}/file_report.sh"
    if [[ ! -f "${target}" ]]; then
        echo "Error: '${target}' not found." >&2
        return 1
    fi

    read -r -p "Enter directory path to analyze [default: .]: " user_dir
    user_dir="${user_dir:-.}"
    bash "${target}" "${user_dir}"
}

main() {
    while true; do
        show_menu
        read -r -p "Choose an option [1-4]: " choice

        case "${choice}" in
            1)
                run_system_info
                ;;
            2)
                run_disk_info
                ;;
            3)
                run_file_report
                ;;
            4)
                echo "Exiting utility menu. Goodbye!"
                exit 0
                ;;
            *)
                echo "Invalid option '${choice}'. Please enter a number between 1 and 4." >&2
                ;;
        esac
    done
}

main "$@"
