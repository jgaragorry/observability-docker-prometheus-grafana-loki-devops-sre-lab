#!/usr/bin/env bash
set -euo pipefail

echo "🔍 Verificando prerrequisitos..."

command -v docker >/dev/null 2>&1 || { echo "❌ Docker no está instalado."; exit 1; }
echo "✅ Docker encontrado."

if docker compose version >/dev/null 2>&1; then
  echo "✅ docker compose disponible."
else
  echo "❌ 'docker compose' no está disponible. Instala Docker Compose o actualiza Docker Desktop."
  exit 1
fi

# Probar que el usuario puede ejecutar docker sin sudo
if ! docker ps >/dev/null 2>&1; then
  echo "❌ No puedes ejecutar 'docker ps'."
  echo "👉 Asegúrate de estar en el grupo 'docker' o usa 'sudo' al ejecutar los scripts."
  exit 1
fi

echo "✅ Todo listo para ejecutar el laboratorio."

