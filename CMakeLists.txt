cmake_minimum_required(VERSION 3.0)
project(test)

set(CYT_DIR ${CMAKE_SOURCE_DIR}/coyote/)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CYT_DIR}/cmake)

find_package(CoyoteHW REQUIRED)

set(N_REGIONS 1)
set(EN_STRM 1)
set(FDEV_NAME u55c)

validation_checks_hw()

load_apps (
    VFPGA_C0_0 "src"
)

create_hw()
