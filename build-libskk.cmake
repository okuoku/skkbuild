set(ENV{NOCONFIGURE} 1)

message(STATUS "Generate configure...")

execute_process(COMMAND
    ./autogen.sh
    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/deps/libskk
    RESULT_VARIABLE rr)

if(rr)
    message(FATAL_ERROR "Failed to generate configure script")
endif()

message(STATUS "Configure...")

# libskk does not support out-of-tree build
execute_process(COMMAND
    ./configure --prefix=/opt/skk
    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/deps/libskk
    RESULT_VARIABLE rr)

if(rr)
    message(FATAL_ERROR "Failed to configure")
endif()

message(STATUS "Build...")

execute_process(COMMAND
    make -j10
    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/deps/libskk
    RESULT_VARIABLE rr)

if(rr)
    message(FATAL_ERROR "Failed to build")
endif()

message(STATUS "Install...")

execute_process(COMMAND
    make install
    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/deps/libskk
    RESULT_VARIABLE rr)

if(rr)
    message(FATAL_ERROR "Failed to install")
endif()
