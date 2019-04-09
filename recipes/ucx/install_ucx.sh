#!/bin/bash
set -euo pipefail

if [ -z ${GIT_FULL_HASH-} ]; then
    :;
else
    ./autogen.sh
fi

CUDA_CONFIG_ARG=""
if [ ${ucx_proc_type} == "gpu" ]; then
    CUDA_CONFIG_ARG="--with-cuda=${CUDA_HOME}"
fi

./configure --prefix="${PREFIX}" \
    --disable-cma \
    --disable-numa \
    --enable-mt \
    --with-gnu-ld \
    ${CUDA_CONFIG_ARG}

make install
