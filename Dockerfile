# Start from the official Ubuntu image
FROM ubuntu:latest

# Set environment variables to non-interactive to avoid prompts during install
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install the pybgpstream Python library
RUN pip3 install pybgpstream

RUN git clone 