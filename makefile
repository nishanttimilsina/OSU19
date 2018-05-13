### Taken from imsample.zip in Canvas

#
# Project Name
#
PROJECT = Game

#
# Compiler
#
$(CXX) = g++

#
# Source Files
#
SRC = *.cpp

#
# Create an object for each source file
#
OBJ = $(SRC:.cpp=.o)

#
# Output binary
#
BIN = $(PROJECT)

#
# Compiler Flags
#
CFLAGS = -Wall -pedantic -std=gnu++11

#
# Default Behavior:
#     1. Remove everything to start from screatch
#     2. Compile the binary
#
default: clean $(BIN) debug

#
# Notice the dependency chain.
#
# Order assuming no files exist:
#     1. Each .o file
#     2. Binary
#
# Special Symbols:
#     @     Suppresses the command from being printed to the terminal)
#     $@    Name of tag
#     $^    Name of dependency
debug: $(BIN)

$(BIN): $(OBJ)
	@echo "CC	$@"
	@$(CXX) $(CFLAGS) $^ -o $@

#
# % is a wildcard. Anything that ends in ".o" will match this tag, and each
# tag depends on the same matching wildcard, but ending in ".cpp"
#
%.o: %.cpp
	@echo "CC	$^"
	@$(CXX) $(CFLAGS) -c $^

zip:
	zip $(PROJECT)_GROUP_19.zip *.cpp *.hpp *.* makefile

clean: $(CLEAN)
	@echo "RM	*.o"
	@echo "RM	$(BIN)"
	@rm -f *.o $(BIN)