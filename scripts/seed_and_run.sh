#!/bin/bash
# Run seed script then start the server
set -e

cd "$(dirname "$0")/.."

# Remove old config so it regenerates from current env vars
rm -f config.json

export DATABASE_URL="postgresql://postgres:cotge8-kicfyc-jappyH@db.yzbctxomwvfodijstpuz.supabase.co:5432/postgres"

echo "[seed] Running memory seed..."
python scripts/seed.py

echo "[seed] Starting server..."
python backend/run_sse.py
