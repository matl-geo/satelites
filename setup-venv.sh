#!/bin/bash

# Install Python 3 if not already installed
if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Installing Python 3..."
    sudo apt update
    sudo apt install -y python3 python3-venv python3-pip
    echo "Python 3 installed successfully."
else
    echo "Python 3 is already installed."
fi  

# Install pip if not already installed
if ! command -v pip3 &> /dev/null; then
    echo "pip is not installed. Installing pip..."
    sudo apt install -y python3-pip
    echo "pip installed successfully."
else
    echo "pip is already installed."
fi  

# Install virtualenv if not already installed
if ! command -v virtualenv &> /dev/null; then
    echo "virtualenv is not installed. Installing virtualenv..."
    sudo pip3 install virtualenv
    echo "virtualenv installed successfully."
else
    echo "virtualenv is already installed."
fi

# Install python3-venv if not already installed
if ! dpkg -l | grep -q python3-venv; then
    echo "python3-venv is not installed. Installing python3-venv..."
    sudo apt install -y python3-venv
    echo "python3-venv installed successfully."
else
    echo "python3-venv is already installed."

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
