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

---

## Diagrama ASCII PRO (Estilo Arquitectura SRE)

                          ┌──────────────────────────┐
                          │        Linux Host        │
                          │    (tu máquina local)    │
                          └────────────┬─────────────┘
                                       │
                                       │  🔍 Métricas del sistema
                                       ▼
                         ┌──────────────────────────┐
                         │      Node Exporter       │
                         │  (CPU, RAM, Disco, Red)  │
                         └────────────┬─────────────┘
                                       │  Metrics
                                       ▼
 ┌──────────────────────────┐     ┌──────────────────────────┐
 │        Promtail          │Logs │       Prometheus          │
 │  (/var/log/*.log → Loki) ├────►│ (Scraping de métricas)    │
 └────────────┬─────────────┘     └────────────┬─────────────┘
              │                                  │
              │ Logs                              │ Metrics
              ▼                                  ▼
     ┌──────────────────────┐        ┌──────────────────────┐
     │         Loki         │        │       Grafana        │
     │  (almacena logs)     │◄──────►│ (dashboards + paneles│
     └──────────────────────┘        │   SRE + logs + caos) │
                                      └──────────────────────┘

                            🔥 Observability Chaos Lab
                 Métricas + Logs + Correlación + Carga + Falla
---

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

Este script elimina:

- Contenedores
- Volúmenes
- Imágenes del lab
- Red
- Datos de loki-data/

## 📚 Documentación extra

Incluye conceptos básicos, topología del lab y escenarios de caos.

## 🔐 Seguridad

- Este lab es solo para fines educativos.
- No exponer a Internet.
- No usar credenciales reales.

## 🗺 Roadmap Fase 2

- Loki avanzado
- Alertmanager
- Tracing distribuido
- Versión Kubernetes

---

# 📦 Resumen Técnico del Workshop

Esta sección resume los componentes esenciales del laboratorio para uso profesional, auditorías, instructores y documentación interna.

---

# 🧰 Tabla de Scripts del Workshop

| Script | Archivo | ¿Qué hace? | Cuándo usarlo |
|--------|---------|------------|----------------|
| **01_check_prereqs.sh** | `scripts/01_check_prereqs.sh` | Verifica que Docker y Docker Compose estén instalados y funcionando sin sudo. | *Siempre antes de iniciar el workshop.* |
| **02_start_stack.sh** | `scripts/02_start_stack.sh` | Levanta todo el stack: Prometheus, Node Exporter, Loki, Promtail y Grafana. | *Inicio normal del laboratorio.* |
| **03_generate_chaos.sh** | `scripts/03_generate_chaos.sh` | Genera carga de CPU, IO y memoria usando stress-ng. | *Para ver gráficas y logs reaccionar en tiempo real.* |
| **04_stop_stack.sh** | `scripts/04_stop_stack.sh` | Detiene el stack pero **sin borrar datos ni imágenes**. | *Cuando terminaste la sesión pero quieres mantener el entorno.* |
| **05_cleanup_lab.sh** | `scripts/05_cleanup_lab.sh` | **Elimina contenedores, imágenes, la red y limpia loki-data**. Deja todo como fábrica. | *Para reiniciar el workshop desde cero o preparar un aula.* |

---

# 📊 Tabla de Dashboards Disponibles

| Dashboard | Archivo | ¿Qué muestra? | Público objetivo |
|----------|---------|----------------|------------------|
| **Observability Chaos Dashboard** | `observability-chaos-dashboard.json` | Panel base para ver CPU, RAM y logs del sistema. | Estudiantes iniciales. |
| **SRE Observability Dashboard (v1)** | `sre-observability-dashboard.json` | Métricas clave: CPU, memoria, red, disco y logs Loki. | SysAdmins / DevOps. |
| **SRE Advanced Observability Dashboard (v2)** | `sre-advanced-observability-dashboard.json` | Panel SRE completo: health checks, targets caídos, TSDB, SSH events logs y correlación avanzada. | SRE, Arquitectos, Instructores. |

---

# 🧩 Arquitectura Modular del Repo

| Carpeta | Contenido | Propósito |
|---------|-----------|-----------|
| **config/** | Configs de Prometheus, Loki y Promtail | Separación lógica y fácil mantenimiento |
| **grafana/provisioning/** | Dashboards + datasources automáticos | Grafana arranca totalmente preconfigurado |
| **grafana/dashboards/** | JSONs listos para producción | Dashboards SRE y del Workshop |
| **scripts/** | Automatización del laboratorio | Permite reproducibilidad total |
| **docs/** | Documentación académica (teoría + caos) | Perfecto para cursos o onboarding |
| **loki-data/** | Datos de runtime | Ignorados por git; limpieza sencilla |
| **docker-compose.yml** | Declaración central del stack | Infra reproducible estilo DevOps |

---

# 🏁 Estado Final del Repo (v1 estable)

✔ Listo para instructores  
✔ Listo para estudiantes  
✔ Provisioning automático  
✔ Dashboards avanzados incluidos  
✔ Scripts productivos y didácticos  
✔ Preparado para Fase 2 (Alertmanager / Tempo / K8s)

---


## 📄 Licencia

Uso libre para educación y training.


