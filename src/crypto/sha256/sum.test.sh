#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/sum.sh"

function got() {
    crypto::sha256::sum ../../../LICENSE
}

function want() {
    cat <<EOF
893bd8778ed3d6cddaa7752f0f78b0d0758b641dc33c796761ca709c9604b3e8
EOF
}

diff <(want) <(got)
