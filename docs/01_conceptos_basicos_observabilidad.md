# Conceptos básicos de observabilidad

## Monitoreo vs Observabilidad

- **Monitoreo**: mirar métricas y gráficos para saber si algo está “rojo” o “verde”.
- **Observabilidad**: capacidad de entender qué está pasando por dentro de un sistema solo mirando:
  - Métricas
  - Logs
  - (y opcionalmente) Trazas

## Métricas

- Valores numéricos en el tiempo (CPU, RAM, disco, peticiones por segundo).
- Prometheus es el estándar de facto para métricas.

## Logs

- Mensajes de texto que describen eventos.
- Loki + Promtail permiten centralizar logs y consultarlos de forma eficiente.

## Dashboards

- Paneles visuales (Grafana) que combinan métricas y logs.
- Sirven para entender el “estado” del sistema y detectar anomalías.

