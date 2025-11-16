# 📘 Manual del Estudiante — Observability Chaos Lab
### Versión simplificada y pensada para aprendizaje paso a paso

## ⭐ 1. ¿Qué aprenderás en este laboratorio?
En este workshop aprenderás:
- Qué es la **observabilidad** y por qué es importante.
- Cómo funcionan **métricas y logs**.
- A usar herramientas reales:
  - Prometheus
  - Node Exporter
  - Loki
  - Promtail
  - Grafana
- A reconocer fallos usando paneles y gráficos.
- A pensar como un **SRE**: observar → diagnosticar → resolver.

---

## 🧰 2. Requisitos técnicos
- Linux (Ubuntu recomendado).
- Docker + Docker Compose.
- Navegador moderno.

---

## 🏗 3. Componentes del laboratorio
| Servicio | Función |
|---------|---------|
| Prometheus | métricas |
| Node Exporter | métricas del host |
| Loki | logs |
| Promtail | colector de logs |
| Grafana | visualización |
| Docker Compose | orquestación |

---

## 🚀 4. Iniciar el entorno
```bash
docker compose up -d
```
Abrir Grafana en http://localhost:3000  
Usuario: admin | Clave: admin

---

## 📊 5. Dashboard principal
Verás:
- CPU, RAM, disco
- Tráfico de red
- Logs en tiempo real
- Estado de servicios
- Indicadores de fallos

---

## 🔥 6. Generar caos
```bash
bash scripts/03_generate_chaos.sh
```

Genera:
- Gaps en métricas  
- Caída de servicios  
- Logs faltantes  
- Errores de conexión  

---

## 🩺 7. Diagnóstico rápido
### Ver contenedores:
```bash
docker ps
```

### Ver logs:
```bash
docker logs obs-prometheus
docker logs obs-loki
```

### Validar red:
```bash
docker exec -it obs-grafana ping loki
```

---

## 🎯 8. Metas de aprendizaje
Debes poder:
- Levantar el stack completo.
- Diferenciar métricas y logs.
- Detectar fallas en paneles.
- Diagnosticar problemas reales.
- Pensar como un SRE.

---

## 🧠 9. Reglas de oro
- Observa la evidencia.
- Un panel vacío significa algo.
- Los logs cuentan una historia.
- Primero validar, luego reparar.

---

## 🎓 10. Consejos
- No tengas miedo de romper cosas.
- Piensa antes de ejecutar scripts.
- Haz capturas de tus observaciones.

---

## 📄 Licencia
Uso educativo y libre.

