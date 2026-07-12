#!/bin/bash

set -e

echo "========================================="
echo " Backend Lab"
echo " Iniciando ambiente..."
echo "========================================="

docker compose up -d

echo
echo "Ambiente iniciado com sucesso."
echo

docker compose ps