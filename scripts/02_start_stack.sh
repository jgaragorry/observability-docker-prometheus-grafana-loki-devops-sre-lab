#!/usr/bin/env bash
set -euo pipefail

echo "🚀 Iniciando stack de observabilidad con Docker Compose..."
docker compose up -d

echo "✅ Stack levantado."
echo "👉 Prometheus: http://localhost:9090"
echo "👉 Grafana:    http://localhost:3000"
echo "👉 NodeExporter: métrica en http://localhost:9100/metrics"

