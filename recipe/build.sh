#!/bin/bash

# declare -a CMAKE_PLATFORM_FLAGS
# if [[ ${target_platform} == osx-64 ]]; then
#   CMAKE_PLATFORM_FLAGS+=(-DCMAKE_OSX_SYSROOT="${CONDA_BUILD_SYSROOT}")
# fi

mkdir build && cd build
cmake $CMAKE_ARGS \
    -GNinja \
    -DHAVE_RULES=ON \
    -DUSE_MATCHCOMPILER=ON \
    -DUSE_BUNDLED_TINYXML2=OFF \
    -DENABLE_OSS_FUZZ=OFF \
    -DPYTHON_EXECUTABLE=$PYTHON \
    -DCMAKE_DISABLE_PRECOMPILE_HEADERS=ON \
    $SRC_DIR

ninja install

cd ..
cd htmlreport
$PYTHON setup.py install --single-version-externally-managed --record=record.txt
