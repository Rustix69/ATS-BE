#!/bin/bash

echo "==== ResumeAI ATS Checker Setup ===="
echo "This script will set up all dependencies for the ResumeAI ATS Checker."
echo

# Check if Node.js is installed
if command -v node >/dev/null 2>&1; then
    NODE_VERSION=$(node -v)
    echo "[OK] Node.js is installed (${NODE_VERSION})"
else
    echo "[ERROR] Node.js is not installed. Please install Node.js v14 or later."
    echo "   Visit https://nodejs.org for installation instructions."
    exit 1
fi

# Check if npm is installed
if command -v npm >/dev/null 2>&1; then
    NPM_VERSION=$(npm -v)
    echo "[OK] npm is installed (${NPM_VERSION})"
else
    echo "[ERROR] npm is not installed. Please install npm."
    echo "   It usually comes with Node.js installation."
    exit 1
fi

# Install Node dependencies
echo
echo "Installing Node.js dependencies..."
npm install
if [ $? -eq 0 ]; then
    echo "[OK] Node.js dependencies installed successfully"
else
    echo "[ERROR] Failed to install Node.js dependencies"
    exit 1
fi

# Check if Ollama is installed
if command -v ollama >/dev/null 2>&1; then
    echo "[OK] Ollama is installed"
else
    echo "Ollama is not installed. Installing now..."
    curl -fsSL https://ollama.com/install.sh | sh
    
    if [ $? -eq 0 ]; then
        echo "[OK] Ollama installed successfully"
    else
        echo "[ERROR] Failed to install Ollama"
        echo "   Please visit https://ollama.com/download for manual installation"
        exit 1
    fi
fi

# Pull the embedding model
echo
echo "Pulling the nomic-embed-text model (this might take a while)..."
ollama pull nomic-embed-text

if [ $? -eq 0 ]; then
    echo "[OK] nomic-embed-text model downloaded successfully"
else
    echo "[ERROR] Failed to download the embedding model"
    exit 1
fi

echo
echo "==== Setup Complete! ===="
echo
echo "To use the ATS checker:"
echo "1. Start the Ollama server in a separate terminal: ollama serve"
echo "2. Run the ATS checker: node ats-checker.js"
echo
echo "Alternatively, just run './start.sh' to automatically handle everything."
echo
echo "For more information, see the README.md file." 