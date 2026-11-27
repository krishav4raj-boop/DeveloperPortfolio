#!/usr/bin/env bash
# ==============================================================================
# Script: file_report.sh
# Topic: Q2 / CO2 — Directory File & Size Analyzer
# Description:
#   Inspects a given directory (defaults to current directory), validates it,
#   counts total files and subdirectories, lists file extension summary, and
#   displays the largest files.
# Usage:
#   ./file_report.sh [target_directory]
# Exit Codes:
#   0 - Report generated successfully
#   1 - Invalid arguments or non-existent/invalid directory
#   2 - Directory is not readable
# ==============================================================================

set -u

readonly SCRIPT_NAME="$(basename "$0")"
readonly TOP_N=5

show_usage() {
    echo "Usage: ${SCRIPT_NAME} [target_directory]"
    echo "Defaults to the current working directory if no path is provided."
}

validate_directory() {
    local dir_path="$1"
    if [[ ! -e "${dir_path}" ]]; then
        echo "Error: Path '${dir_path}' does not exist." >&2
        return 1
    fi
    if [[ ! -d "${dir_path}" ]]; then
        echo "Error: '${dir_path}' is not a directory." >&2
        return 1
    fi
    if [[ ! -r "${dir_path}" ]]; then
        echo "Error: Permission denied reading '${dir_path}'." >&2
        return 2
    fi
    return 0
}

print_largest_files() {
    local dir_path="$1"
    local file_count="$2"

    echo ""
    echo "Top ${TOP_N} Largest Files:"
    if [[ "${file_count}" -eq 0 ]]; then
        echo "  (No regular files found)"
        return 0
    fi

    # List regular files with human-friendly or byte sizes sorted descending.
    local idx=1
    while IFS= read -r entry; do
        echo "  ${idx}. ${entry}"
        idx=$((idx + 1))
    done < <(find "${dir_path}" -type f -exec ls -lh {} + 2>/dev/null | awk '{print $5 "\t" $9}' | sort -hr | head -n "${TOP_N}")
}

generate_report() {
    local dir_path="$1"
    local total_files
    local total_dirs

    total_files=$(find "${dir_path}" -type f 2>/dev/null | wc -l | tr -d ' ')
    # Subtract 1 so the root directory itself is excluded from subdirectory count.
    local raw_dirs
    raw_dirs=$(find "${dir_path}" -type d 2>/dev/null | wc -l | tr -d ' ')
    total_dirs=$((raw_dirs > 0 ? raw_dirs - 1 : 0))

    echo "============================================================"
    echo " File Report for: ${dir_path}"
    echo "============================================================"
    echo "Total Regular Files  : ${total_files}"
    echo "Total Subdirectories : ${total_dirs}"

    if command -v du >/dev/null 2>&1; then
        local disk_size
        disk_size=$(du -sh "${dir_path}" 2>/dev/null | cut -f1)
        echo "Total Disk Footprint : ${disk_size:-N/A}"
    fi

    print_largest_files "${dir_path}" "${total_files}"
    echo "============================================================"
}

main() {
    if [[ $# -gt 1 ]]; then
        echo "Error: Expected at most 1 argument." >&2
        show_usage >&2
        exit 1
    fi

    if [[ $# -eq 1 && ( "$1" == "-h" || "$1" == "--help" ) ]]; then
        show_usage
        exit 0
    fi

    local target_dir="${1:-.}"
    validate_directory "${target_dir}" || exit $?
    generate_report "${target_dir}"
    exit 0
}

main "$@"
