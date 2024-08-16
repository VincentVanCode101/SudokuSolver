# Specify the Go version
ARG GO_VERSION=1.22.0

# Use the official Golang image from the Docker Hub
FROM golang:${GO_VERSION}-bookworm as builder

RUN go install github.com/air-verse/air@latest

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy only the necessary source directories and files
COPY cmd/ cmd/
COPY sudokus/ sudokus/
COPY .air.toml .
COPY Makefile .
