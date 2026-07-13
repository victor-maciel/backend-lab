#!/bin/bash

###############################################################
# Backend Lab
#
# Atualiza o ambiente
###############################################################

echo ""

echo "Atualizando repositório..."

git pull

echo ""

echo "Atualizando imagens..."

docker compose pull

echo ""

echo "Recriando containers..."

docker compose up -d

echo ""

docker compose ps