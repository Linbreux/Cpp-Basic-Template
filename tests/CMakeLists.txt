find_package(Catch2 3 REQUIRED)

add_executable(tests test_main.cpp)

target_link_libraries(tests PRIVATE Catch2::Catch2WithMain)

include(CTest)
include(Catch)
catch_discover_tests(tests)

target_include_directories(tests PRIVATE ${Catch2_INCLUDE_DIRS})

add_custom_command(
  TARGET tests
  POST_BUILD
  COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:tests> ${BIN_DIR}/tests
  COMMENT "Copying tests to ${BIN_DIR}")
