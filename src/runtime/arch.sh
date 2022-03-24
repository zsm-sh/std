#!/usr/bin/env bash

# get architecture of the machine
function runtime::arch() {
    local arch
    arch="$(uname -m)"

    case "${arch}" in
    x86_64 | amd64 | x64)
        echo "amd64"
        ;;
    i386 | i486 | i586 | i686 | x86)
        echo "386"
        ;;
    armv8* | aarch64* | arm64)
        echo "arm64"
        ;;
    armv7* | armhf)
        echo "arm"
        ;;
    *)
        echo "${arch}"
        ;;
    esac
}

