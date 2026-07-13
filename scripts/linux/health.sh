#!/bin/bash

###############################################################
# Backend Lab
#
# Executa um Health Check
###############################################################

echo ""
echo "========================================="
echo " Backend Lab Health Check"
echo "========================================="
echo ""

echo "Docker"

docker info >/dev/null && echo "OK"

echo ""

echo "Containers"

docker compose ps

echo ""

echo "PostgreSQL"

docker exec backend-postgres pg_isready -U postgres

echo ""

echo "Redis"

docker exec backend-redis redis-cli ping

echo ""

echo "Kafka"

docker exec backend-kafka \
/opt/kafka/bin/kafka-topics.sh \
--bootstrap-server localhost:9092 \
--list

echo ""

echo "Health Check concluído."