# This file allows users to call find_package(Clang) and pick up our targets.

@CLANG_CONFIG_CODE@

find_package(LLVM REQUIRED CONFIG
             HINTS "@CLANG_CONFIG_LLVM_CMAKE_DIR@")

set(CLANG_EXPORTED_TARGETS "@CLANG_EXPORTS@")
set(CLANG_CMAKE_DIR "@CLANG_CONFIG_CMAKE_DIR@")
set(CLANG_INCLUDE_DIRS "@CLANG_CONFIG_INCLUDE_DIRS@")

# Provide all our library targets to users.
include("@CLANG_CONFIG_EXPORTS_FILE@")

# By creating clang-tablegen-targets here, subprojects that depend on Clang's
# tablegen-generated headers can always depend on this target whether building
# in-tree with Clang or not.
if(NOT TARGET clang-tablegen-targets)
  add_custom_target(clang-tablegen-targets)
endif()
