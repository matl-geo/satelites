#!/bin/bash

# Install Python 3 if not already installed
if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Installing Python 3..."
    sudo apt update
    sudo apt upgrade -y
    sudo apt install -y python3
    echo "Python 3 installed successfully."
else
    echo "Python 3 is already installed."
fi  

# Install python3-venv if not already installed
if ! python3 -m venv --help &> /dev/null; then
    echo "python3-venv is not installed. Installing python3-venv..."
    sudo apt install -y python3-venv
    echo "python3-venv installed successfully."
else
    echo "python3-venv is already installed."
fi

# Install python3-pip if not already installed
if ! command -v pip3 &> /dev/null; then
    echo "pip3 is not installed. Installing pip3..."
    sudo apt install -y python3-pip
    echo "pip3 installed successfully."
else
    echo "pip3 is already installed."
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