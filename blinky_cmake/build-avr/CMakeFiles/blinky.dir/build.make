# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.21

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/c/tauger/coding/printer/tests_fsm/blinky_cmake

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/tauger/coding/printer/tests_fsm/blinky_cmake/build-avr

# Utility rule file for blinky.

# Include any custom commands dependencies for this target.
include CMakeFiles/blinky.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/blinky.dir/progress.make

CMakeFiles/blinky:
	cd /mnt/c/tauger/coding/printer/tests_fsm/blinky_cmake/build-avr/src/avr && /usr/local/bin/cmake --build /mnt/c/tauger/coding/printer/tests_fsm/blinky_cmake/build-avr/src/avr -- blinky

blinky: CMakeFiles/blinky
blinky: CMakeFiles/blinky.dir/build.make
.PHONY : blinky

# Rule to build all files generated by this target.
CMakeFiles/blinky.dir/build: blinky
.PHONY : CMakeFiles/blinky.dir/build

CMakeFiles/blinky.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/blinky.dir/cmake_clean.cmake
.PHONY : CMakeFiles/blinky.dir/clean

CMakeFiles/blinky.dir/depend:
	cd /mnt/c/tauger/coding/printer/tests_fsm/blinky_cmake/build-avr && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/tauger/coding/printer/tests_fsm/blinky_cmake /mnt/c/tauger/coding/printer/tests_fsm/blinky_cmake /mnt/c/tauger/coding/printer/tests_fsm/blinky_cmake/build-avr /mnt/c/tauger/coding/printer/tests_fsm/blinky_cmake/build-avr /mnt/c/tauger/coding/printer/tests_fsm/blinky_cmake/build-avr/CMakeFiles/blinky.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/blinky.dir/depend

