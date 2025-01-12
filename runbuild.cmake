file(MAKE_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/out)

execute_process(COMMAND
    docker run --rm -v${CMAKE_CURRENT_LIST_DIR}:/srcs
    -v${CMAKE_CURRENT_LIST_DIR}/out:/opt
    skkbuild
    cmake -P /srcs/build-libskk.cmake)

if(rr)
    message(FATAL_ERROR "Failed to build libskk")
endif()

execute_process(COMMAND
    docker run --rm -v${CMAKE_CURRENT_LIST_DIR}:/srcs
    -v${CMAKE_CURRENT_LIST_DIR}/out:/opt
    skkbuild
    cmake -P /srcs/build-fcitx5-skk.cmake)

if(rr)
    message(FATAL_ERROR "Failed to build fcitx5-skk")
endif()
