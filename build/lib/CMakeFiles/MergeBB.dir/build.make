# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

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
CMAKE_COMMAND = /opt/homebrew/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build

# Include any dependencies generated for this target.
include lib/CMakeFiles/MergeBB.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include lib/CMakeFiles/MergeBB.dir/compiler_depend.make

# Include the progress variables for this target.
include lib/CMakeFiles/MergeBB.dir/progress.make

# Include the compile flags for this target's objects.
include lib/CMakeFiles/MergeBB.dir/flags.make

lib/CMakeFiles/MergeBB.dir/codegen:
.PHONY : lib/CMakeFiles/MergeBB.dir/codegen

lib/CMakeFiles/MergeBB.dir/MergeBB.cpp.o: lib/CMakeFiles/MergeBB.dir/flags.make
lib/CMakeFiles/MergeBB.dir/MergeBB.cpp.o: /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/lib/MergeBB.cpp
lib/CMakeFiles/MergeBB.dir/MergeBB.cpp.o: lib/CMakeFiles/MergeBB.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lib/CMakeFiles/MergeBB.dir/MergeBB.cpp.o"
	cd /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build/lib && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT lib/CMakeFiles/MergeBB.dir/MergeBB.cpp.o -MF CMakeFiles/MergeBB.dir/MergeBB.cpp.o.d -o CMakeFiles/MergeBB.dir/MergeBB.cpp.o -c /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/lib/MergeBB.cpp

lib/CMakeFiles/MergeBB.dir/MergeBB.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/MergeBB.dir/MergeBB.cpp.i"
	cd /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build/lib && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/lib/MergeBB.cpp > CMakeFiles/MergeBB.dir/MergeBB.cpp.i

lib/CMakeFiles/MergeBB.dir/MergeBB.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/MergeBB.dir/MergeBB.cpp.s"
	cd /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build/lib && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/lib/MergeBB.cpp -o CMakeFiles/MergeBB.dir/MergeBB.cpp.s

# Object files for target MergeBB
MergeBB_OBJECTS = \
"CMakeFiles/MergeBB.dir/MergeBB.cpp.o"

# External object files for target MergeBB
MergeBB_EXTERNAL_OBJECTS =

lib/libMergeBB.dylib: lib/CMakeFiles/MergeBB.dir/MergeBB.cpp.o
lib/libMergeBB.dylib: lib/CMakeFiles/MergeBB.dir/build.make
lib/libMergeBB.dylib: lib/CMakeFiles/MergeBB.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libMergeBB.dylib"
	cd /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build/lib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MergeBB.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/CMakeFiles/MergeBB.dir/build: lib/libMergeBB.dylib
.PHONY : lib/CMakeFiles/MergeBB.dir/build

lib/CMakeFiles/MergeBB.dir/clean:
	cd /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build/lib && $(CMAKE_COMMAND) -P CMakeFiles/MergeBB.dir/cmake_clean.cmake
.PHONY : lib/CMakeFiles/MergeBB.dir/clean

lib/CMakeFiles/MergeBB.dir/depend:
	cd /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/lib /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build/lib /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build/lib/CMakeFiles/MergeBB.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : lib/CMakeFiles/MergeBB.dir/depend

