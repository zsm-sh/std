#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/compress.sh"
source "$(dirname "${BASH_SOURCE[0]}")/decompress.sh"

suffixes=(
    .tar
    .tar.gz
    .tgz
    .tar.Z
    .tar.bz2
    .tbz2
    .tar.lzma
    .tlz
    .tar.xz
    .tar.lzip
    .tar.lz4
    .zip
)

testdir="$(dirname "${BASH_SOURCE[0]}")/testdata"
mkdir -p "${testdir}/src/b"
echo a > "${testdir}/src/a.txt"
echo b > "${testdir}/src/b/b.txt"
for suffix in "${suffixes[@]}"; do
    archive::compress "${testdir}/z${suffix}" "${testdir}/src" a.txt b
    archive::decompress "${testdir}/z${suffix}" "${testdir}/dist"

    diff -r "${testdir}/src" "${testdir}/dist"
    rm -rf "${testdir}/dist" "${testdir}/z${suffix}"
done

rm -rf "${testdir}"