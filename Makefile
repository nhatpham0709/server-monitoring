stack-up:
	docker stack deploy -c stack.yml monitoring

stack-down:
	docker stack rm monitoring
	

stack-logs:
	docker service logs -f monitoring_prometheus
	docker service logs -f monitoring_node-exporter
	docker service logs -f monitoring_alertmanager
	docker service logs -f monitoring_cadvisor
	docker service logs -f monitoring_grafana