cmake_minimum_required(VERSION 2.6)
project (x9-notification)
enable_testing(true)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/vala)

find_package(Vala "0.18.0" REQUIRED)
include(${VALA_USE_FILE})

add_subdirectory (src)

