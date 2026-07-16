# Docker

Este documento descreve toda a infraestrutura Docker utilizada pelo Backend Lab.

---

# Serviços

## PostgreSQL

Banco de dados principal utilizado pelas aplicações Java.

Porta:

```
5432
```

Container:

```
backend-postgres
```

Volume:

```
backend-lab_postgres_data
```

---

## Redis

Utilizado para cache, sessões e filas.

Porta:

```
6379
```

Container:

```
backend-redis
```

---

## Apache Kafka

Broker responsável pela mensageria.

Modo:

```
KRaft
```

Sem ZooKeeper.

Porta:

```
9092
```

Container:

```
backend-kafka
```

---

## Kafbat

Interface Web para gerenciamento do Kafka.

Porta:

```
8080
```

Container:

```
backend-kafbat
```

---

## pgAdmin

Administração do PostgreSQL.

Porta:

```
5050
```

Container:

```
backend-pgadmin
```

## Dockhand

Interface Web para gerenciamento do Docker.

Container:
```
backend-dockhand
```
Porta:
```
3000
```
Acesso:
```
http://IP_DO_SERVIDOR:3000
```
---

# Volumes

| Volume | Descrição |
|---------|-----------|
| postgres_data | Dados PostgreSQL |
| redis_data | Persistência Redis |
| kafka_data | Dados Kafka |
| pgadmin_data | Configuração pgAdmin |

---

# Network

Todos os serviços utilizam:

```
backend-network
```

---

# Variáveis de Ambiente

Todas as configurações encontram-se no arquivo `.env`.

Exemplo:

```
POSTGRES_DB=pedidos
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres

HOST_IP=192.168.18.46
```

---

# Comandos úteis

Validar compose

```bash
docker compose config
```

Subir ambiente

```bash
docker compose up -d
```

Parar ambiente

```bash
docker compose down
```

Ver containers

```bash
docker compose ps
```

Health Check

```bash
make health
```

---

# Troubleshooting

## Porta ocupada

```
Bind for 9092 failed
```

Identifique o processo.

```bash
docker ps
```

Pare o container conflitante.

---

## Variáveis não encontradas

```
POSTGRES_USER variable is not set
```

Crie o arquivo `.env`.

```bash
cp .env.example .env
```

---

## Kafka não inicia

Verifique os logs.

```bash
make logs
```

Selecione Kafka.

---

## pgAdmin não inicia

Verifique permissões do volume.

```bash
docker volume inspect
```