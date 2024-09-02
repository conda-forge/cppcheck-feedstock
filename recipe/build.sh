#!/bin/bash

declare -a CMAKE_PLATFORM_FLAGS
if [[ "${target_platform}" == "osx-arm64" ]]; then
  EXTRA_CMAKE_ARGS+=("-DDISABLE_DMAKE=ON")
fi

mkdir build && cd build
cmake $CMAKE_ARGS \
    -GNinja \
    -DHAVE_RULES=ON \
    -DUSE_MATCHCOMPILER=ON \
    -DUSE_BUNDLED_TINYXML2=OFF \
    -DENABLE_OSS_FUZZ=OFF \
    -DPYTHON_EXECUTABLE=$PYTHON \
    -DCMAKE_DISABLE_PRECOMPILE_HEADERS=ON \
    $EXTRA_CMAKE_ARGS \
    $SRC_DIR

ninja install

cd ..
cd htmlreport
$PYTHON setup.py -m pip install . --no-deps -vv
