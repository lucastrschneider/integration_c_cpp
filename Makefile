# Verbosity
VERBOSE ?= 1

ifeq ($(VERBOSE),0)
AT := @
else
AT :=
endif

CC=gcc
CPPC=g++

all: cpp
	@echo "Build main"
	$(AT)$(CPPC) -c src/main.cpp -I inc/ -o build/main.o
	@echo "Link"
	$(AT)$(CPPC) build/c_print.o build/cpp_print.o build/main.o -o build/project.out
	@echo "\nFinished building"

cpp: c
	@echo "Build cpp_print"
	$(AT)$(CPPC) -c src/cpp_print.cpp -I inc/ -o build/cpp_print.o

c: build
	@echo "Build c_print"
	$(AT)$(CC) -c src/c_print.c -I inc/ -o build/c_print.o

# Create the build_dir
build:
	@echo "Creating build directory"
	@$(AT)mkdir -p $@

run:
	@./build/project.out

clean:
	@echo "Clean build files"
	@rm -rf build