#!/bin/bash

set -e

echo "========================================="
echo " Backend Lab"
echo "Reiniciando ambiente..."
echo "========================================="

docker compose down

docker compose up -d

echo
echo "Ambiente reiniciado."
echo

docker compose ps