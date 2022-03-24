#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/../runtime/command_exist.sh"
source "$(dirname "${BASH_SOURCE[0]}")/../log/error.sh"
source "$(dirname "${BASH_SOURCE[0]}")/../log/info.sh"
source "$(dirname "${BASH_SOURCE[0]}")/../log/is_output.sh"

# Cat a file from http url to stdout
# like unix cat command
function http::cat() {
    local url="${1}"

    log::info -v=1 "Cat from url ${url}"

    if runtime::command_exist curl; then
        if log::is_output 4; then
            curl -sSL "${url}"
        else
            curl -L "${url}"
        fi
    elif runtime::command_exist wget; then
        if log::is_output 4; then
            wget -O - "${url}"
        else
            wget -q -O - "${url}"
        fi
    else
        log::error "Neither curl nor wget are available"
        exit 1
    fi
}
