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
include lib/CMakeFiles/LivenessAnalysis.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include lib/CMakeFiles/LivenessAnalysis.dir/compiler_depend.make

# Include the progress variables for this target.
include lib/CMakeFiles/LivenessAnalysis.dir/progress.make

# Include the compile flags for this target's objects.
include lib/CMakeFiles/LivenessAnalysis.dir/flags.make

lib/CMakeFiles/LivenessAnalysis.dir/codegen:
.PHONY : lib/CMakeFiles/LivenessAnalysis.dir/codegen

lib/CMakeFiles/LivenessAnalysis.dir/LivenessAnalysis.cpp.o: lib/CMakeFiles/LivenessAnalysis.dir/flags.make
lib/CMakeFiles/LivenessAnalysis.dir/LivenessAnalysis.cpp.o: /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/lib/LivenessAnalysis.cpp
lib/CMakeFiles/LivenessAnalysis.dir/LivenessAnalysis.cpp.o: lib/CMakeFiles/LivenessAnalysis.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lib/CMakeFiles/LivenessAnalysis.dir/LivenessAnalysis.cpp.o"
	cd /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build/lib && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT lib/CMakeFiles/LivenessAnalysis.dir/LivenessAnalysis.cpp.o -MF CMakeFiles/LivenessAnalysis.dir/LivenessAnalysis.cpp.o.d -o CMakeFiles/LivenessAnalysis.dir/LivenessAnalysis.cpp.o -c /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/lib/LivenessAnalysis.cpp

lib/CMakeFiles/LivenessAnalysis.dir/LivenessAnalysis.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/LivenessAnalysis.dir/LivenessAnalysis.cpp.i"
	cd /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build/lib && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/lib/LivenessAnalysis.cpp > CMakeFiles/LivenessAnalysis.dir/LivenessAnalysis.cpp.i

lib/CMakeFiles/LivenessAnalysis.dir/LivenessAnalysis.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/LivenessAnalysis.dir/LivenessAnalysis.cpp.s"
	cd /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build/lib && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/lib/LivenessAnalysis.cpp -o CMakeFiles/LivenessAnalysis.dir/LivenessAnalysis.cpp.s

# Object files for target LivenessAnalysis
LivenessAnalysis_OBJECTS = \
"CMakeFiles/LivenessAnalysis.dir/LivenessAnalysis.cpp.o"

# External object files for target LivenessAnalysis
LivenessAnalysis_EXTERNAL_OBJECTS =

lib/libLivenessAnalysis.dylib: lib/CMakeFiles/LivenessAnalysis.dir/LivenessAnalysis.cpp.o
lib/libLivenessAnalysis.dylib: lib/CMakeFiles/LivenessAnalysis.dir/build.make
lib/libLivenessAnalysis.dylib: lib/CMakeFiles/LivenessAnalysis.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libLivenessAnalysis.dylib"
	cd /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build/lib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/LivenessAnalysis.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/CMakeFiles/LivenessAnalysis.dir/build: lib/libLivenessAnalysis.dylib
.PHONY : lib/CMakeFiles/LivenessAnalysis.dir/build

lib/CMakeFiles/LivenessAnalysis.dir/clean:
	cd /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build/lib && $(CMAKE_COMMAND) -P CMakeFiles/LivenessAnalysis.dir/cmake_clean.cmake
.PHONY : lib/CMakeFiles/LivenessAnalysis.dir/clean

lib/CMakeFiles/LivenessAnalysis.dir/depend:
	cd /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/lib /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build/lib /Users/alphonserand/Desktop/UCR/CS201/code/project3/llvm-tutor-main/build/lib/CMakeFiles/LivenessAnalysis.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : lib/CMakeFiles/LivenessAnalysis.dir/depend

