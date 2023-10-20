CXX := g++
COMPILE_ARGS := -Wall -Werror -pedantic -std=c++23 -O3
INC := include
TST := tests

TESTS := \
	 $(TST)/insertion_sort.cpp \
	 $(TST)/bubble_sort.cpp \
	 $(TST)/counting_sort.cpp \
	 $(TST)/quick_sort.cpp \
	 $(TST)/merge_sort.cpp

TESTS_EXE := $(TESTS:%.cpp=%)

HEADERS := $(TESTS:$(TST)/%.cpp=$(INC)/%.hpp)

.SUFFIXES: .cpp .hpp

all: $(TESTS_EXE)

$(TST)/%: $(TST)/%.cpp $(INC)/%.hpp
	@printf ' CXX\t%-40s\t-> %s\n' "$<" "$@"
	@$(CXX) $(COMPILE_ARGS) -I$(INC) $< -o $@
	@./$@
	@printf ' PASSED %s\n' "$@"

clean:
	rm $(TESTS_EXE)

.PHONY: all clean
