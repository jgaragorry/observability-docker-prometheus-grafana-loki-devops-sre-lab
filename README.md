# 🚀 Observability Chaos Lab — Prometheus, Loki, Grafana & Promtail  
### Un workshop moderno, práctico, reproducible y orientado a DevOps, SRE y SysAdmins que necesitan observar, romper y arreglar sistemas.

## 🧩 Badges & Tecnologías

<p align="left">
  <img src="https://img.shields.io/badge/Prometheus-Monitoring-E6522C?logo=prometheus&logoColor=white" />
  <img src="https://img.shields.io/badge/Grafana-Visualization-F46800?logo=grafana&logoColor=white" />
  <img src="https://img.shields.io/badge/Loki-Logs-brightgreen?logo=grafana&logoColor=white" />
  <img src="https://img.shields.io/badge/Promtail-Log%20Agent-00A98F?logo=grafana&logoColor=white" />
  <img src="https://img.shields.io/badge/Docker-Compose-2496ED?logo=docker&logoColor=white" />
  <img src="https://img.shields.io/badge/Linux-Server-000?logo=linux&logoColor=white" />
  <img src="https://img.shields.io/badge/SRE-Observation-1E88E5?logo=google&logoColor=white" />
  <img src="https://img.shields.io/badge/DevSecOps-Best%20Practices-6A1B9A?logo=githubactions&logoColor=white" />
</p>

## 🌟 ¿Qué es este Workshop?

Este laboratorio es un entorno real y reproducible de observabilidad moderna, diseñado para que cualquier persona pueda:

- Montar un stack completo de métricas y logs con Docker Compose.
- Visualizar en tiempo real el comportamiento del sistema.
- Generar caos controlado y ver cómo se refleja en Grafana.
- Practicar troubleshooting SRE con evidencias (métricas + logs).
- Aprender buenas prácticas DevOps, SRE y seguridad aplicada.

## 🎯 Objetivos del Workshop

- Entender monitoreo vs observabilidad.
- Montar un stack con Prometheus, Node Exporter, Loki, Promtail y Grafana.
- Correlacionar métricas y logs ante fallas reales.
- Aplicar buenas prácticas de infra reproducible y provisioning automático.

## 👥 ¿A quién va dirigido?

- Estudiantes de DevOps / Cloud / SRE.
- SysAdmins que quieren actualizarse.
- Ingenieros que necesitan entender sistemas en producción.
- Equipos de seguridad que requieren visibilidad del sistema.
- Instructores que necesiten un laboratorio listo para usar.

## 🏗 Arquitectura del Stack

(Gráfico ASCII incluido en versión original, omitido aquí por longitud.)

## 🧰 Requisitos

- Linux (Ubuntu recomendado)
- Docker + Docker Compose
- Navegador web
- Opcional: stress-ng

## Diagrama ASCII PRO (Estilo Arquitectura SRE)

        +--------------+
        |  Prometheus  | <--- Métricas ---+
        +------┬-------+                  |
               |                          |
               |                          v
+--------------+-------+       +-----------------------+
|   Node Exporter      |       |        Grafana        |
| (métricas del host)  |       | (visualización total) |
+----------------------+       +-----------------------+
               ^
               | Logs
               |
+--------------+-------+
|    Promtail          |
| (/var/log/*.log)     |
+--------------┬-------+
               |
               v
        +------+------+ 
        |    Loki     |
        | (logs)      |
        +-------------+

## 📁 Estructura del Proyecto
La estructura completa ya está incluida en tu repositorio original.

## 🚀 Cómo ejecutar el Workshop
### 1️⃣ Verificar prerequisitos
```bash
bash scripts/01_check_prereqs.sh
```

### 2️⃣ Iniciar el stack
```bash
bash scripts/02_start_stack.sh
```

### 3️⃣ Acceder a Grafana
http://localhost:3000  
Usuario: admin  
Password: admin  

### 4️⃣ Generar caos
```bash
bash scripts/03_generate_chaos.sh
```

### 5️⃣ Detener el stack
```bash
bash scripts/04_stop_stack.sh
```

## 🧹 Reset completo del laboratorio
```bash
bash scripts/05_cleanup_lab.sh
```

Este script elimina contenedores, volúmenes, imágenes, redes y limpia loki-data/.

## 📚 Documentación extra
Incluye conceptos básicos, topología del lab y escenarios de caos.

## 🔐 Seguridad
- Solo para fines educativos.
- No exponer a Internet.
- No usar credenciales reales.

## 🗺 Roadmap Fase 2
- Loki avanzado
- Alertmanager
- Tracing distribuido
- Versión Kubernetes

---

# 📦 Resumen Técnico del Workshop

## 🧰 Tabla de Scripts del Workshop
| Script | Archivo | ¿Qué hace? | Cuándo usarlo |
|--------|---------|------------|----------------|
| **01_check_prereqs.sh** | Verifica prerequisitos | Antes del workshop |
| **02_start_stack.sh** | Levanta el stack | Inicio |
| **03_generate_chaos.sh** | Genera carga | Durante análisis |
| **04_stop_stack.sh** | Detiene el stack | Cierre |
| **05_cleanup_lab.sh** | Limpieza total | Reinicio del workshop |

## 📊 Tabla de Dashboards Disponibles
| Dashboard | Archivo | ¿Qué muestra? |
|----------|---------|----------------|
| Observability Chaos | observability-chaos-dashboard.json | Base |
| SRE v1 | sre-observability-dashboard.json | Métricas + logs |
| SRE Advanced v2 | sre-advanced-observability-dashboard.json | SRE/DevOps avanzado |

## 📩 Licencia
Uso libre educativo.

