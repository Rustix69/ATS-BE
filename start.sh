#!/bin/bash

echo "==== Starting ResumeAI ATS Checker ===="

# Check if Ollama server is running
if curl -s http://localhost:11434/api/health >/dev/null; then
    echo "[OK] Ollama server is running"
else
    echo "[WARN] Ollama server is not running"
    echo "   Starting Ollama server in the background..."
    
    # Start Ollama server in the background
    ollama serve &
    OLLAMA_PID=$!
    
    # Give it a moment to start
    echo "   Waiting for Ollama server to initialize..."
    sleep 3
    
    # Check again if it's running
    if curl -s http://localhost:11434/api/health >/dev/null; then
        echo "[OK] Ollama server started successfully"
    else
        echo "[ERROR] Failed to start Ollama server"
        echo "   Please start it manually: ollama serve"
        exit 1
    fi
fi

# Check if nomic-embed-text model exists
if ollama list | grep -q "nomic-embed-text"; then
    echo "[OK] nomic-embed-text model is installed"
else
    echo "[WARN] nomic-embed-text model is not installed"
    echo "   Downloading now (this might take a while)..."
    ollama pull nomic-embed-text
    
    if [ $? -eq 0 ]; then
        echo "[OK] nomic-embed-text model downloaded successfully"
    else
        echo "[ERROR] Failed to download the model"
        echo "   Please run: ollama pull nomic-embed-text"
        exit 1
    fi
fi

echo "Starting ATS checker..."
echo "=========================================="
node ats-checker.js

# If we started Ollama in this script, shut it down
if [ -n "$OLLAMA_PID" ]; then
    echo
    echo "Stopping Ollama server..."
    kill $OLLAMA_PID
    echo "Ollama server stopped"
fi 