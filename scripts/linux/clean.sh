#!/bin/bash

###############################################################
# Backend Lab
#
# Remove completamente o ambiente
###############################################################

echo ""

read -p "Remover containers, volumes e imagens não utilizadas? (y/N): " opcao

if [[ "$opcao" != "y" && "$opcao" != "Y" ]]; then
    echo "Operação cancelada."
    exit 0
fi

docker compose down -v

docker image prune -f

docker volume prune -f

echo ""

echo "Limpeza concluída."