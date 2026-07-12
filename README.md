# Backend Lab

Laboratório completo para desenvolvimento Backend utilizando Docker.

O objetivo deste projeto é disponibilizar um ambiente reutilizável para desenvolvimento de aplicações Java/Spring Boot, evitando a necessidade de configurar bancos de dados, mensageria e ferramentas de apoio a cada novo projeto.


---

## Objetivos

- Aprender Docker de forma prática
- Aprender Apache Kafka
- Utilizar PostgreSQL como banco principal
- Utilizar Redis para cache
- Disponibilizar um ambiente reutilizável para qualquer projeto backend
- Evoluir continuamente através de Sprints

---

## Tecnologias

- Docker
- Docker Compose
- PostgreSQL 17
- Apache Kafka 4 (KRaft)
- Kafka UI
- pgAdmin 4
- Redis
- Portainer

---

## Estrutura

backend-lab/

├── docker-compose.yml

├── .env

├── docs

├── postgres

├── kafka

├── redis

└── scripts

---

## Arquitetura

Spring Boot

├── PostgreSQL

├── Redis

└── Kafka

└── Kafka UI

---

## Como iniciar

```bash
docker compose up -d
```

---

## Como parar

```bash
docker compose down
```

---

## Atualizar imagens

```bash
docker compose pull
docker compose up -d
```

---

## Roadmap

### Sprint 1

- PostgreSQL
- Kafka
- Redis
- Kafka UI
- pgAdmin

### Sprint 2

- Mailpit
- MinIO
- Keycloak

### Sprint 3

- Prometheus
- Grafana
- Loki

### Sprint 4

- SonarQube
- Jenkins

---

## Licença

Projeto destinado para estudos e desenvolvimento backend.

## Obervações
Esse .md foi formatado com ajuda de IA