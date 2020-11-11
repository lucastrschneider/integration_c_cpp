# Verbosity
VERBOSE ?= 1

ifeq ($(VERBOSE),0)
AT := @
else
AT :=
endif

CC=gcc

all: c
	@echo "Build main"
	$(AT)$(CC) -c src/main.c -I inc/ -o build/main.o
	@echo "Link"
	$(AT)$(CC) build/c_print.o build/main.o -o build/project.out
	@echo "\nFinished building"

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