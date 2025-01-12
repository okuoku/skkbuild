message(STATUS "Configure...")

set(builddir "/fcitx5-skk")

file(MAKE_DIRECTORY "${builddir}")

execute_process(COMMAND
    ${CMAKE_COMMAND} 
    -DLIBSKK_LIBRARIES=/opt/skk/lib/libskk.so 
    "-DLIBSKK_INCLUDE_DIR=/opt/skk/include;/usr/include/gee-0.8"
    -DCMAKE_BUILD_TYPE=RelWithDebInfo 
    -DCMAKE_INSTALL_PREFIX=/opt/skk 
    -G "Unix Makefiles"
    -S ${CMAKE_CURRENT_LIST_DIR}/deps/fcitx5-skk
    -B ${builddir}
    RESULT_VARIABLE rr)

if(rr)
    message(FATAL_ERROR "Failed to configure")
endif()

execute_process(COMMAND
    ${CMAKE_COMMAND} --build ${builddir} -- -j10
    RESULT_VARIABLE rr)

if(rr)
    message(FATAL_ERROR "Failed to build")
endif()


execute_process(COMMAND
    ${CMAKE_COMMAND} --install ${builddir}
    RESULT_VARIABLE rr)

if(rr)
    message(FATAL_ERROR "Failed to build")
endif()

