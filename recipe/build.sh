#!/usr/bin/env bash

mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_BUILD_TYPE=Release

export VERBOSE=1
make -j ${CPU_COUNT}
make install -j ${CPU_COUNT}
