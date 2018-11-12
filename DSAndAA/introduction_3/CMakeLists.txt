cmake_minimum_required(VERSION 3.12)

aux_source_directory(. DIR_SRCS)

add_executable(summator_runner summator_runner.cpp BigSummator.cpp BigSummator.h)