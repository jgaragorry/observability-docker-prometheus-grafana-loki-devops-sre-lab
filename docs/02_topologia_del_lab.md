# Topología del laboratorio de observabilidad

En este lab tenemos:

- **Prometheus**: recolecta métricas de:
  - node-exporter
  - sí mismo (prometheus)
  - Loki

- **Node Exporter**: expone métricas del sistema (CPU, memoria, disco, red).

- **Loki**: recibe logs enviados por Promtail.

- **Promtail**: lee logs de `/var/log/*.log` y los envía a Loki.

- **Grafana**: se conecta a Prometheus y a Loki para mostrar:
  - Gráficos de métricas
  - Búsquedas de logs

Todos los servicios se conectan a través de la red Docker `observability`.

