
CXX       := g++
CXXFLAGS  := -std=c++17 -O2 -Wall -Wextra
BUILD_DIR := build
TARGET    := $(BUILD_DIR)/jvm_profiler
UNAME_S   := $(shell uname -s)

ifeq ($(UNAME_S),Darwin)
	SRC := jvm_profiler_macos.cpp
else ifeq ($(UNAME_S),Linux)
  	SRC := jvm_profiler_linux.cpp
else 
	$(error Unsopprted OS: $(UNAME_S))
endif


.PHONY: build run clean

build: $(TARGET)

$(TARGET): $(SRC)
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -o $@ $<

run: build
	./$(TARGET) --interval-ms 10000 --jvm-summary-secs 30 --vmmap-summary-secs 30

clean:
	rm -rf $(BUILD_DIR)
	rm -rf tmp
