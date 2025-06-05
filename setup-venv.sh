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


echo "Installing required packages..."
pip install --upgrade pip
pip install -r requirements.txt

echo "Virtual environment setup complete."