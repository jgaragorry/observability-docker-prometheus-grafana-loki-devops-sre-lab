#!/usr/bin/env bash
set -euo pipefail

PROJECT_NAME="observability-docker-prometheus-grafana-loki-devops-sre-lab"
NETWORK_NAME="${PROJECT_NAME}_observability"

echo "🧹 Limpieza del Observability Chaos Lab"
echo "Proyecto: $PROJECT_NAME"
echo

# 1) Verificar que estamos en el directorio correcto
if [[ ! -f "docker-compose.yml" ]]; then
  echo "❌ No se encontró docker-compose.yml en el directorio actual."
  echo "👉 Ejecuta este script desde la raíz del repositorio del lab."
  exit 1
fi

# 2) Bajar el stack con Docker Compose (contenedores, red, volúmenes anónimos)
echo "🔻 Deteniendo y eliminando contenedores, red y volúmenes anónimos del lab..."
docker compose down --volumes --remove-orphans || true

echo "✅ docker compose down completado."
echo

# 3) Eliminar la red del proyecto si aún existe
if docker network ls --format '{{.Name}}' | grep -q "^${NETWORK_NAME}$"; then
  echo "🔻 Eliminando red de Docker del lab: ${NETWORK_NAME}"
  docker network rm "${NETWORK_NAME}" || true
  echo "✅ Red ${NETWORK_NAME} eliminada."
else
  echo "ℹ️ La red ${NETWORK_NAME} no existe o ya fue eliminada."
fi

echo

# 4) Eliminar contenedores huérfanos relacionados al lab (por nombre)
echo "🔎 Buscando contenedores huérfanos relacionados al lab..."
LAB_CONTAINERS=$(docker ps -a --format '{{.Names}}' | grep -E '^obs-(prometheus|grafana|loki|promtail|node-exporter)$' || true)

if [[ -n "${LAB_CONTAINERS}" ]]; then
  echo "🔻 Eliminando contenedores:"
  echo "${LAB_CONTAINERS}"
  docker rm -f ${LAB_CONTAINERS} || true
  echo "✅ Contenedores del lab eliminados."
else
  echo "ℹ️ No se encontraron contenedores huérfanos del lab."
fi

echo

# 5) Eliminar imágenes específicas del lab (solo estas, no todo Docker)
echo "🔎 Eliminando imágenes específicas del lab (si existen)..."

IMAGES=(
  "prom/prometheus:latest"
  "prom/node-exporter:latest"
  "grafana/grafana:latest"
  "grafana/loki:2.9.0"
  "grafana/promtail:latest"
)

for img in "${IMAGES[@]}"; do
  if docker images --format '{{.Repository}}:{{.Tag}}' | grep -q "^${img}$"; then
    echo "🔻 Eliminando imagen: ${img}"
    docker rmi "${img}" || true
  else
    echo "ℹ️ Imagen no encontrada (ok): ${img}"
  fi
done

echo "✅ Limpieza de imágenes del lab completada."
echo

# 6) Limpiar datos de loki-data (pero NO borrar la carpeta)
if [[ -d "loki-data" ]]; then
  echo "🔻 Limpiando contenidos de loki-data/ (datos de runtime de Loki)..."
  rm -rf loki-data/* 2>/dev/null || true
  echo "✅ loki-data/ ha sido limpiado (carpeta vacía)."
else
  echo "ℹ️ loki-data/ no existe, nada que limpiar."
fi

echo

echo "🎉 Limpieza completada."
echo "👉 El laboratorio está listo para volver a ejecutarse desde cero con:"
echo "   docker compose up -d"

