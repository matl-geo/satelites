#!/bin/bash

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
