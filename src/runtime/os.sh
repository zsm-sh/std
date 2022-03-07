#!/usr/bin/env bash

# get os of the system
function runtime::os() {
    local os
    os="$(uname -s)"

    echo "${os,,}"
}
