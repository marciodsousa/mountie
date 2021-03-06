project (mountie)
cmake_minimum_required (VERSION 2.8)
cmake_policy (VERSION 2.6)

set (DATADIR "${CMAKE_INSTALL_PREFIX}/share/mountie")
set (PKGDATADIR "${DATADIR}/mountie")
set (GETTEXT_PACKAGE "mountie")
set (RELEASE_NAME "mountie")
set (VERSION "0.1")
set (VERSION_INFO "Release")
set (PREFIX ${CMAKE_INSTALL_PREFIX})
set (DOLLAR "$")

list (APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

file(GLOB_RECURSE sources src/*.vala)

configure_file (${CMAKE_SOURCE_DIR}/src/config.vala.cmake ${CMAKE_SOURCE_DIR}/src/config.vala)

find_package (Vala REQUIRED)
include (ValaVersion)
ensure_vala_version ("0.18" MINIMUM)
include (ValaPrecompile)

add_definitions (-DGETTEXT_PACKAGE="mountie")

find_package(PkgConfig)
pkg_check_modules(DEPS REQUIRED granite gtk+-3.0 gthread-2.0 gio-2.0 libnotify)
add_definitions(${DEPS_CFLAGS})
link_libraries(${DEPS_LIBRARIES})
link_directories(${DEPS_LIBRARY_DIRS})

find_package(Vala REQUIRED)
include(ValaVersion)
ensure_vala_version("0.16.0" MINIMUM)

include(ValaPrecompile)
vala_precompile(VALA_C
    src/config.vala
    src/mountie.vala
    src/MainWindow.vala
    src/Utils.vala
    src/Widgets/TitleBar.vala
    src/Widgets/EventsView.vala
    src/Widgets/InfoScreen.vala
    src/Widgets/SchemaList.vala
    src/Widgets/Schema.vala
    src/Widgets/SchemaFolder.vala
    src/Widgets/KeyList.vala
    src/Widgets/Key.vala
    src/Widgets/KeyInfo.vala
    src/Backend/Filetypes/GenericAdapter.vala
    src/Backend/FileHandler.vala
    src/Backend/ImageCollection.vala
PACKAGES
    gtk+-3.0
    gio-2.0
    granite
    libnotify
OPTIONS
    --thread
)

add_subdirectory (po)

add_executable(mountie ${VALA_C})

include(GSettings)
add_schema("org.pantheon.mountie.gschema.xml")

install (TARGETS mountie RUNTIME DESTINATION bin)

install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/data/mountie.desktop DESTINATION share/applications)

install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/data/128/mountie.svg DESTINATION share/icons/hicolor/128x128/apps)
install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/data/64/mountie.svg DESTINATION share/icons/hicolor/64x64/apps)
install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/data/48/mountie.svg DESTINATION share/icons/hicolor/48x48/apps)
