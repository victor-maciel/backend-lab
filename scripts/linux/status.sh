#!/bin/bash

###############################################################
# Backend Lab
#
# Exibe o status do ambiente
###############################################################

echo ""
echo "========================================="
echo " Backend Lab Status"
echo "========================================="
echo ""

docker compose ps

echo ""

echo "Volumes"

docker volume ls | grep backend-lab

echo ""

echo "Network"

docker network ls | grep backend-network