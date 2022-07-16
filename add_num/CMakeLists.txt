cmake_minimum_required(VERSION 3.10.2)

include(GNUInstallDirs)
project(addnum VERSION 1.0.1 DESCRIPTION "add two number")

add_library(addnum SHARED src/add_num.cpp)

set_target_properties(addnum PROPERTIES
    VERSION ${PROJECT_VERSION}

    # SOVERSION 1
    PUBLIC_HEADER include/add_num.h)

target_include_directories(addnum PRIVATE include)

install(TARGETS addnum
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

project(mulnum VERSION 2.0.1 DESCRIPTION "mul two number")

add_library(mulnum SHARED src/mul_num.cpp)

set_target_properties(mulnum PROPERTIES
    VERSION ${PROJECT_VERSION}

    # SOVERSION 1
    PUBLIC_HEADER include/mul_num.h)

target_include_directories(mulnum PRIVATE include)

install(TARGETS mulnum
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