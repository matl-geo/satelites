#!/bin/bash

# Install Python 3 if not already installed
if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Installing Python 3..."
    sudo apt update
    sudo apt upgrade -y
    sudo apt install -y python3 python3-venv python3-pip
    echo "Python 3 installed successfully."
else
    echo "Python 3 is already installed."
fi  

# source the virtual environment if it exists
if [ -d "venv" ]; then
    echo "Activating existing virtual environment..."
    source venv/bin/activate
    echo "Virtual environment activated."
else
    echo "No existing virtual environment found."
    echo "Creating a new virtual environment..."
    python3 -m venv venv
    echo "Activating existing virtual environment..."
    source venv/bin/activate
    echo "Virtual environment activated."
fi

echo "Installing required packages..."
pip install --upgrade pip
pip install -r requirements.txt

echo "Virtual environment setup complete."