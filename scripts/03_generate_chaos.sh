#!/usr/bin/env bash
set -euo pipefail

echo "🔥 Generando carga (caos controlado)..."

if command -v stress-ng >/dev/null 2>&1; then
  echo "✅ stress-ng encontrado. Lanzando carga de 60 segundos..."
  stress-ng --cpu 2 --io 2 --vm 1 --vm-bytes 256M --timeout 60s
  echo "✅ Finalizó la carga."
else
  echo "⚠️ 'stress-ng' no está instalado."
  echo "   Puedes instalarlo (en Ubuntu/Debian) con:"
  echo "   sudo apt-get update && sudo apt-get install -y stress-ng"
fi

echo "👉 Revisa Grafana y Prometheus para ver el efecto de la carga."

