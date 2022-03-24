#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/../log/error.sh"

# Decompress a archive file to a destination directory.
function archive::decompress() {
    local archive_file="${1}"
    local dir="${2}"
    archive_file="$(realpath "${archive_file}")"
    dir="$(realpath "${dir}")"
    mkdir -p "${dir}"
    case "${archive_file}" in
    *.tar)
        tar -x -f "${archive_file}" -C "${dir}"
        ;;
    *.tar.gz | *.tgz)
        tar -x -z -f "${archive_file}" -C "${dir}"
        ;;
    *.tar.Z)
        tar -x -Z -f "${archive_file}" -C "${dir}"
        ;;
    *.tar.bz2 | *.tbz2)
        tar -x -j -f "${archive_file}" -C "${dir}"
        ;;
    *.tar.lzma | *.tlz)
        tar -x --lzma -f "${archive_file}" -C "${dir}"
        ;;
    *.tar.xz)
        tar -x --xz -f "${archive_file}" -C "${dir}"
        ;;
    *.tar.lzip)
        tar -x --lzip -f "${archive_file}" -C "${dir}"
        ;;
    *.tar.lz4)
        tar -x --lz4 -f "${archive_file}" -C "${dir}"
        ;;
    *.zip)
        unzip -q "${archive_file}" -d "${dir}"
        ;;
    *)
        log::error "Unsupported archive type: ${archive_file}."
        ;;
    esac
}
