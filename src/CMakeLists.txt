find_package(PkgConfig)

pkg_check_modules(GTK REQUIRED gtk+-3.0)
pkg_check_modules(GLIB_REQUIRED glib-2.0)
pkg_check_modules(GIO_REQUIRED gio-2.0)

set(CFLAGS
  ${GIO_CFLAGS} ${GIO_CFLAGS_OTHER}
  ${GLIB_CFLAGS} ${GLIB_CFLAGS_OTHER}
  ${GTK_CFLAGS} ${GTK_CFLAGS_OTHER}
)
add_definitions(${CFLAGS})

link_libraries(${GIO_LIBRARIES})
link_libraries(${GLIB_LIBRARIES})
link_libraries(${GTK_LIBRARIES})

link_directories(${GIO_LIBRARY_DIRS})
link_directories(${GLIB_LIBRARY_DIRS})
link_directories(${GTK_LIBRARY_DIRS})

set(VALA_SRC
  views/window_main.vala
  x9-settings.vala
  queue_consumer.vala
  x9-notification.vala
)

vala_precompile(VALA_C
  ${VALA_SRC}
PACKAGES
  gtk+-3.0
  gio-2.0
  posix
  librabbitmq
OPTIONS
  --target-glib 2.32
GENERATE_VAPI
  x9-notification
GENERATE_HEADER
  x9-notification
)

# set the path to the library folder
link_directories(/usr/local/lib)

add_executable(x9-notification ${VALA_C})
add_library(x9-notification-clib ${VALA_C})
target_link_libraries (x9-notification rabbitmq)

