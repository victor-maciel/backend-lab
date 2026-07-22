#!/bin/bash

###############################################################
# Backend Lab
#
# Exibe logs dos serviços
###############################################################

echo ""
echo "========================================="
echo " Logs"
echo "========================================="
echo ""

echo "1 - PostgreSQL"
echo "2 - Redis"
echo "3 - Kafka"
echo "4 - Kafbat"
echo "5 - pgAdmin"
echo "6 - Todos"

echo ""

read -p "Escolha: " opcao

case $opcao in

1)
docker compose logs -f postgres
;;

2)
docker compose logs -f redis
;;

3)
docker compose logs -f kafka
;;

4)
docker compose logs -f kafbat
;;

5)
docker compose logs -f pgadmin
;;

6)
docker compose logs -f
;;

7)
docker compose logs  dockhand -f
;;
*)
echo "Opção inválida."
;;

esac