# 🎓 Guía del Instructor — Observability Chaos Lab
### Manual oficial para docentes, facilitadores y entrenadores DevOps/SRE

---

## 🎯 Propósito de este documento
Esta guía está diseñada para:
- Ayudarte a impartir el workshop de forma fluida y profesional.
- Maximizar el aprendizaje de tus estudiantes.
- Entregar sugerencias didácticas, tiempos, dinámicas y puntos clave.
- Dejar lineamientos de diagnóstico y troubleshooting en vivo.
- Proveer técnicas para generar caos controlado durante la clase.

Este documento es **solo para instructores**. No debe entregarse a estudiantes.

---

## 🧭 1. Objetivo pedagógico del Workshop
El objetivo central es desarrollar **criterio técnico SRE**:
- Enseñar a observar un sistema mediante métricas/logs.
- Experimentar fallas reales y cómo se reflejan en Grafana.
- Comprender la relación entre Prometheus, Loki, Promtail y Grafana.
- Potenciar habilidades de troubleshooting basadas en evidencias.

Es un laboratorio enfocado en *cómo piensa un SRE* al enfrentar incidentes.

---

## 🧱 2. Pre-requisitos para impartir la clase

### Técnicos
- Docker + Docker Compose.
- Sistema Linux (Ubuntu recomendado).
- 4 GB RAM mínimo.
- Navegador moderno.

### Académicos  
- Familiaridad básica con Linux.
- Conocimiento general de contenedores.
- Opcional: experiencia con Grafana o Prometheus.

---

## 🕒 3. Duración sugerida (modalidad clase)

| Módulo | Tiempo | Objetivo |
|--------|--------|----------|
| Introducción a Observabilidad | 20 min | Conceptos clave |
| Arquitectura del Stack | 10 min | Entender flujos |
| Arranque del entorno | 10 min | docker compose up |
| Explorar Grafana | 20 min | Datasources + dashboard |
| Generación de caos | 30 min | Fallas controladas |
| Diagnóstico guiado | 30 min | Leer métricas/logs |
| Break | 10 min | — |
| Troubleshooting avanzado | 30 min | Fallas profundas |
| Cierre | 10 min | — |

Duración total sugerida: **2h 30m – 3h**.

---

## 🚀 4. Inicio de la clase (narrativa recomendada)

### Paso 1: Engancha con una pregunta
> “¿Cómo sabes que tu sistema está fallando, incluso antes de que un usuario lo reporte?”

### Paso 2: Conecta con casos reales
- Logs vacíos.
- Paneles sin datos.
- Servicios caídos.
- Gaps en gráficas.
- Problemas de red.

### Paso 3: Explica objetivo del workshop
> “Hoy aprenderás a diagnosticar incidentes reales observando la telemetría del sistema.”

---

## 🧩 5. Explica el stack ANTES de levantarlo

### Prometheus  
Recolector de métricas.

### Node Exporter  
Expone métricas del host.

### Loki  
Backend de logs.

### Promtail  
Agente que envía logs a Loki.

### Grafana  
Tablero unificado de observabilidad.

### Docker Compose  
Orquestación reproducible.

Haz énfasis en la **separación de responsabilidades**.

---

## 🔌 6. Puesta en marcha

Indica al alumno:

```bash
docker compose up -d
```

Verifica:
- Pueden entrar a Grafana en http://localhost:3000  
- Datasources creados automáticamente.
- Dashboard del lab disponible.
- Métricas fluyendo.
- Logs visibles.

---

## 🔥 7. Fase de caos — guía para impartirla

### 🔥 Nivel 1 — Caos básico  
Detener Prometheus:
```bash
docker stop obs-prometheus
```
Observar gaps y “No data”.

Haz preguntas:
> “¿Qué evidencia muestra el fallo?”

---

### 🔥 Nivel 2 — Caos medio  
Detener Loki:
```bash
docker stop obs-loki
```
En Grafana: logs desaparecen.

Pregunta:
> “¿Qué datasource está fallando y por qué?”

---

### 🔥 Nivel 3 — Caos avanzado  
Romper Promtail:
```bash
vi config/promtail-config.yml
docker restart obs-promtail
```
Logs dejan de llegar.

Pregunta:
> “¿Dónde está el origen del fallo?”

---

### 🔥 Nivel 4 — Caos extremo  
Desconectar Loki de la red:
```bash
docker network disconnect observability obs-loki
```

Grafana mostrará:
```
lookup loki on 127.0.0.11:53: server misbehaving
```

Este escenario replica EXACTAMENTE la falla que tuviste.

---

## 🩺 8. Diagnóstico guiado — lo más valioso del curso

### Validar contenedores
```bash
docker ps
```

### Revisar logs
```bash
docker logs obs-loki
docker logs obs-prometheus
docker logs obs-promtail
```

### Revisar red
```bash
docker network inspect observability
```

### Desde Grafana
```bash
docker exec -it obs-grafana ping loki
```

### Evidencias en Grafana
- Paneles vacíos.
- Ausencia de logs.
- Error de datasource.
- Gaps en series de tiempo.

### Enseña el ciclo de diagnóstico SRE:
1. Observar  
2. Formular hipótesis  
3. Validar  
4. Reparar  
5. Confirmar  

---

## 🧩 9. Versión avanzada del workshop

Recomendada para grupos más expertos.

### Incluye:
- Uso de `config/loki-config.yml`
- Persistencia con `loki-data/`
- Retención avanzada
- Compactor
- File system backend
- Troubleshooting de configuración

---

## 🧪 10. Actividad de evaluación sugerida

### Falla:
Grafana no muestra logs.

### El estudiante debe entregar:
- Estado de contenedores.
- Logs del servicio fallado.
- Diagnóstico.
- Causa raíz.
- Solución.

Simula un ticket real SRE/NOC.

---

## 🏁 11. Cierre recomendado por el instructor

Recomendar:
- Replicar el lab en casa.
- Agregar dashboards propios.
- Integrar apps reales.
- Añadir exporters.
- Probar más caos.

> El estudiante que domina esta práctica obtiene criterio real de observabilidad.

---

## 🧙 12. Consejos de instructor experimentado

- Mantén calma cuando algo falla: enseñas seguridad técnica.
- Pregunta antes de responder.
- Haz que los estudiantes “lean” el sistema.
- Gamifica el caos: quién diagnostica más rápido.
- Valida comprensión constantemente.
- Repite: *“miren la evidencia”*.

---

## 📎 13. Material adicional opcional
- Alertmanager  
- Jaeger (tracing)  
- stress-ng  
- Exporters adicionales  
- Versión Kubernetes (K3s, KinD)

---

## 📄 Licencia
Uso educativo y libre adaptación para instructores.

