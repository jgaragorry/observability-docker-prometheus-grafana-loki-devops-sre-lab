#!/usr/bin/env bash
set -euo pipefail

echo "🛑 Deteniendo stack de observabilidad..."
docker compose down
echo "✅ Stack detenido y recursos liberados."

