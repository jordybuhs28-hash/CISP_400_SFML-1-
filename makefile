# OP-style Makefile for Chapter05 Timber (with code subfolder)

SRC_DIR := Chapter05/code
OBJ_DIR := build/linux
SRC_FILES := $(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES := $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRC_FILES))

LDFLAGS := -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio
CXXFLAGS := -g -Wall -fpermissive -std=c++17
TARGET := $(OBJ_DIR)/timber

# Link step: build the final executable from object files
$(TARGET): $(OBJ_FILES) | $(OBJ_DIR)
	$(CXX) -o $@ $^ $(LDFLAGS)

# Compile each .cpp into a .o
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Ensure build folder exists
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

# Run the game
run: $(TARGET)
	./$(TARGET)

# Clean build artifacts
clean:
	rm -rf $(OBJ_DIR)

.PHONY: run clean
