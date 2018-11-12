cmake_minimum_required(VERSION 3.12)

aux_source_directory(. DIR_SRCS)

add_executable(matrix matrix.cpp)
add_executable(summator summator.cpp)