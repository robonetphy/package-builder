cmake_minimum_required(VERSION 3.10.2)

project(subnum VERSION 1.0.1 DESCRIPTION "add two number")
include(GNUInstallDirs)

add_library(${CMAKE_PROJECT_NAME} SHARED src/sub_num.cpp)

set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES
    VERSION ${PROJECT_VERSION}
    # SOVERSION 1
    PUBLIC_HEADER include/sub_num.h)

target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE include)

install(TARGETS ${CMAKE_PROJECT_NAME}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

    # make uninstall
add_custom_target("uninstall" COMMENT "Uninstall installed files")
add_custom_command(
    TARGET "uninstall"
    POST_BUILD
    COMMENT "Uninstall files with install_manifest.txt"
    COMMAND xargs rm -vf < install_manifest.txt || echo Nothing in
            install_manifest.txt to be uninstalled!
)