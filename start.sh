#!/bin/bash
# Start both ACE-Step API server and Gradio UI

echo "Starting ACE-Step services..."

# Start Gradio UI in background on port 7860 (with logging)
echo "Starting Gradio UI on port 7860..."
acestep --server-name 0.0.0.0 --port 7860 --init_service true 2>&1 | tee /app/outputs/gradio.log &
GRADIO_PID=$!
echo "Gradio UI started with PID $GRADIO_PID"

# Wait a moment for Gradio to initialize
sleep 5

# Start API server on port 8000 (with logging)
echo "Starting API server on port 8000..."
acestep-api --host 0.0.0.0 --port 8000 2>&1 | tee /app/outputs/api.log &
API_PID=$!
echo "API server started with PID $API_PID"

echo "All services started. Logs available at /app/outputs/"
echo "  - Gradio UI: /app/outputs/gradio.log"
echo "  - API Server: /app/outputs/api.log"

# Keep container running for RunPod web terminal
sleep infinity
