#!/usr/bin/env bash
# ==============================================================================
# Script: backup.sh
# Topic: Q2 / CO2 — Safe Directory Backup Utility
# Description:
#   Validates a source directory, creates a timestamped backup folder inside
#   a destination directory (default: ./backups), copies files safely without
#   deleting existing data, and reports clear success/failure exit codes.
# Usage:
#   ./backup.sh <source_directory> [destination_root]
# Exit Codes:
#   0 - Backup completed successfully
#   1 - Invalid arguments or missing source directory
#   2 - Source directory is not readable or destination cannot be created
#   3 - Copy operation failed
# ==============================================================================

set -u

readonly SCRIPT_NAME="$(basename "$0")"
readonly TIMESTAMP="$(date '+%Y%m%d_%H%M%S')"

show_usage() {
    echo "Usage: ${SCRIPT_NAME} <source_directory> [destination_root]"
    echo "Example: ${SCRIPT_NAME} ../../Linux/Q1/CO1 ./backups"
}

validate_inputs() {
    local source_dir="$1"

    if [[ -z "${source_dir}" ]]; then
        echo "Error: Source directory argument cannot be empty." >&2
        return 1
    fi

    if [[ ! -e "${source_dir}" ]]; then
        echo "Error: Source path '${source_dir}' does not exist." >&2
        return 1
    fi

    if [[ ! -d "${source_dir}" ]]; then
        echo "Error: '${source_dir}' is not a directory." >&2
        return 1
    fi

    if [[ ! -r "${source_dir}" ]]; then
        echo "Error: Source directory '${source_dir}' is not readable." >&2
        return 2
    fi

    return 0
}

count_entries() {
    local target="$1"
    find "${target}" -type f 2>/dev/null | wc -l | tr -d ' '
}

perform_backup() {
    local source_dir="$1"
    local dest_root="$2"
    local source_name
    source_name="$(basename "$(cd "${source_dir}" && pwd)")"
    local backup_target="${dest_root}/${source_name}_backup_${TIMESTAMP}"

    if ! mkdir -p "${backup_target}"; then
        echo "Error: Could not create backup directory '${backup_target}'." >&2
        return 2
    fi

    echo "Starting backup..."
    echo "  Source      : ${source_dir}"
    echo "  Destination : ${backup_target}"

    if cp -R "${source_dir}/." "${backup_target}/"; then
        local file_count
        file_count="$(count_entries "${backup_target}")"
        echo "Success: Backup created at '${backup_target}' (${file_count} file(s) copied)."
        return 0
    else
        echo "Error: Backup copy failed." >&2
        return 3
    fi
}

main() {
    if [[ $# -eq 0 ]]; then
        echo "Error: Missing required <source_directory> argument." >&2
        show_usage >&2
        exit 1
    fi

    if [[ "$1" == "-h" || "$1" == "--help" ]]; then
        show_usage
        exit 0
    fi

    if [[ $# -gt 2 ]]; then
        echo "Error: Too many arguments supplied." >&2
        show_usage >&2
        exit 1
    fi

    local source_dir="$1"
    local dest_root="${2:-./backups}"

    validate_inputs "${source_dir}" || exit $?
    perform_backup "${source_dir}" "${dest_root}"
    exit $?
}

main "$@"
