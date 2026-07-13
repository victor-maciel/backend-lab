#!/bin/bash

###############################################################
# Backend Lab
#
# Inicializa todo o ambiente Docker
###############################################################

set -e

echo ""
echo "========================================="
echo " Backend Lab"
echo " Inicializando ambiente..."
echo "========================================="
echo ""

#
# Verifica Docker
#
if ! command -v docker >/dev/null 2>&1; then
    echo "Docker não está instalado."
    exit 1
fi

#
# Verifica daemon
#
if ! docker info >/dev/null 2>&1; then
    echo "Docker daemon não está em execução."
    exit 1
fi

#
# Verifica .env
#
if [ ! -f ".env" ]; then
    echo "Arquivo .env não encontrado."

    if [ -f ".env.example" ]; then
        cp .env.example .env
        echo ""
        echo "Arquivo .env criado."
        echo "Configure-o antes de continuar."
    fi

    exit 1
fi

#
# Valida docker-compose
#
echo "Validando docker-compose.yml..."

docker compose config >/dev/null

echo "OK"

echo ""

echo "Iniciando containers..."

docker compose up -d

echo ""

echo "========================================="
echo " Ambiente iniciado com sucesso!"
echo "========================================="

docker compose ps