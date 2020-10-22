#!/bin/bash

set -ex

if [[ ${EUID} -eq 0 ]]; then
    echo "This script must NOT be run as root"
    exit 1
fi

BUILDER_DIR=/tmp/builder
DIST_DIR=/dist

mkdir -p "${BUILDER_DIR}"
git clone "https://github.com/pop-os/shell-shortcuts.git" "${BUILDER_DIR}"
cd "${BUILDER_DIR}" && make

cp -f "${BUILDER_DIR}/target/release/pop-shell-shortcuts" "${DIST_DIR}"
