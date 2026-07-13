###############################################################
# Backend Lab
#
# Makefile
#
# Facilita a execução dos scripts do projeto.
###############################################################

.DEFAULT_GOAL := help

.PHONY: \
	help \
	start \
	stop \
	restart \
	status \
	logs \
	health \
	update \
	clean \
	ps \
	pull \
	config

###############################################################
# Ajuda
###############################################################

help:
	@echo ""
	@echo "==============================================="
	@echo " Backend Lab"
	@echo "==============================================="
	@echo ""
	@echo "Comandos disponíveis:"
	@echo ""
	@echo "  make start      Inicia o ambiente"
	@echo "  make stop       Para o ambiente"
	@echo "  make restart    Reinicia o ambiente"
	@echo "  make status     Exibe o status"
	@echo "  make logs       Visualiza logs"
	@echo "  make health     Executa Health Check"
	@echo "  make update     Atualiza imagens e containers"
	@echo "  make clean      Remove containers e volumes"
	@echo ""
	@echo "Docker Compose"
	@echo ""
	@echo "  make ps         docker compose ps"
	@echo "  make pull       docker compose pull"
	@echo "  make config     Valida docker-compose.yml"
	@echo ""

###############################################################
# Scripts
###############################################################

start:
	@./scripts/linux/start.sh

stop:
	@./scripts/linux/stop.sh

restart:
	@./scripts/linux/restart.sh

status:
	@./scripts/linux/status.sh

logs:
	@./scripts/linux/logs.sh

health:
	@./scripts/linux/health.sh

update:
	@./scripts/linux/update.sh

clean:
	@./scripts/linux/clean.sh

###############################################################
# Docker Compose
###############################################################

ps:
	@docker compose ps

pull:
	@docker compose pull

config:
	@docker compose config