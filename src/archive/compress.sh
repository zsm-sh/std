#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/../log/error.sh"

# Compress a file or directory to a any archive format.
function archive::compress() {
    local archive_file="${1}"
    local dir="${2}"
    local match="${*:3}"
    archive_file="$(realpath "${archive_file}")"
    dir="$(realpath "${dir}")"
    case "${archive_file}" in
    *.tar)
        tar -c -f "${archive_file}" -C "${dir}" ${match}
        ;;
    *.tar.gz | *.tgz)
        tar -c -z -f "${archive_file}" -C "${dir}" ${match}
        ;;
    *.tar.Z)
        tar -c -Z -f "${archive_file}" -C "${dir}" ${match}
        ;;
    *.tar.bz2 | *.tbz2)
        tar -c -j -f "${archive_file}" -C "${dir}" ${match}
        ;;
    *.tar.lzma | *.tlz)
        tar -c --lzma -f "${archive_file}" -C "${dir}" ${match}
        ;;
    *.tar.xz)
        tar -c --xz -f "${archive_file}" -C "${dir}" ${match}
        ;;
    *.tar.lzip)
        tar -c --lzip -f "${archive_file}" -C "${dir}" ${match}
        ;;
    *.tar.lz4)
        tar -c --lz4 -f "${archive_file}" -C "${dir}" ${match}
        ;;
    *.zip)
        (cd "${dir}" && zip -qr "${archive_file}" ${match})
        ;;
    *)
        log::error "Unsupported archive type: ${archive_file}."
        ;;
    esac
}
