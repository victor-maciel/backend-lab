#!/bin/bash

###############################################################
# Backend Lab
#
# Finaliza o ambiente
###############################################################

echo ""
echo "========================================="
echo " Parando Backend Lab"
echo "========================================="

docker compose down

echo ""

echo "Containers finalizados."

echo "Volumes preservados."

echo "Network preservada."