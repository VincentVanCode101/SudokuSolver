# Simple Makefile for a Go project

BINARY_NAME := run-app
MAIN_PACKAGE := ./cmd/main.go

# Default target
all: build

# Build the project
build:
	@echo "Building the project..."
	go build -o $(BINARY_NAME) $(MAIN_PACKAGE)
# Run the application
run:
	@echo "Running the project..."
	./$(BINARY_NAME) "$(ARGS)"



# Test the application
test:
	@echo "Testing..."
	@go test ./... -v



# Clean the binary
clean:
	@echo "Cleaning..."
	@rm -f main

# Live Reload

watch:
	@if command -v air > /dev/null; then \
            air; \
            echo "Watching...";\
        else \
            read -p "Go's 'air' is not installed on your machine. Do you want to install it? [Y/n] " choice; \
            if [ "$$choice" != "n" ] && [ "$$choice" != "N" ]; then \
                go install github.com/air-verse/air@latest; \
                air; \
                echo "Watching...";\
            else \
                echo "You chose not to install air. Exiting..."; \
                exit 1; \
            fi; \
        fi


.PHONY: all build run test clean watch
