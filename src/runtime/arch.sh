#!/usr/bin/env bash

# get architecture of the machine
function runtime::arch() {
    local arch
    arch="$(uname -m)"

    case "${arch}" in
    x86_64 | amd64 | x64)
        echo "amd64"
        ;;
    i686 | i386 | x86)
        echo "386"
        ;;
    armv7l | armv8l | armhf)
        echo "arm"
        ;;
    aarch64 | arm64)
        echo "arm64"
        ;;
    *)
        echo "${arch}"
        ;;
    esac
}

