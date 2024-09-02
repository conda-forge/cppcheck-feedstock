@echo on

mkdir build
cd build
cmake %CMAKE_ARGS% ^
    -G "Ninja" ^
    %SRC_DIR% ^
    -DUSE_BUNDLED_TINYXML2=OFF ^
    -DENABLE_OSS_FUZZ=OFF ^
    -DPYTHON_EXECUTABLE=%PYTHON% ^
    -DCMAKE_DISABLE_PRECOMPILE_HEADERS=ON

if errorlevel 1 exit 1
ninja install
if errorlevel 1 exit 1
cd ..
cd htmlreport
%PREFIX%\python.exe -m pip install htmlreport\ --no-deps -vv
