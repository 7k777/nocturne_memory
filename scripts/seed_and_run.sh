#!/bin/bash
# Run seed script then start the server
set -e

cd "$(dirname "$0")/.."

echo "[seed] Running memory seed..."
python scripts/seed.py

echo "[seed] Starting server..."
python backend/run_sse.py
