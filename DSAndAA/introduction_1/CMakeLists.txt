cmake_minimum_required(VERSION 3.12)

aux_source_directory(. DIR_SRCS)

add_executable(chicken100 chicken100.cpp)
add_executable(convert convert.cpp util.h)