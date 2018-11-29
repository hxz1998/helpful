cmake_minimum_required(VERSION 3.12)

aux_source_directory(. DIR_SRCS)
add_executable(summator_runner2 summator_runner.cpp array_list.h array_list.cpp BigInteger2.cpp BigInteger2.h)