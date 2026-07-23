#!/bin/bash
# Run seed script then start the server
set -e

cd "$(dirname "$0")/.."

rm -f config.json

# Fix PostgreSQL URL for async SQLAlchemy (postgresql:// -> postgresql+asyncpg://)
if [ -n "$DATABASE_URL" ]; then
  FIXED_URL="${DATABASE_URL/postgresql:\/\//postgresql+asyncpg://}"
  export DATABASE_URL="$FIXED_URL"
fi

echo "[seed] Running memory seed..."
python scripts/seed.py

echo "[seed] Starting server..."
python backend/run_sse.py
