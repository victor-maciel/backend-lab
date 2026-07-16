# Backend Lab

> Ambiente completo de desenvolvimento para aplicações Backend Java utilizando Docker.

O **Backend Lab** tem como objetivo fornecer uma infraestrutura reutilizável para o desenvolvimento de aplicações Java, eliminando a necessidade de configurar manualmente bancos de dados, mensageria e ferramentas administrativas a cada novo projeto.

Todo o ambiente é executado utilizando **Docker Compose**, permitindo que qualquer projeto compartilhe a mesma infraestrutura.

---

# Objetivos

- Aprender Docker na prática.
- Aprender Apache Kafka.
- Padronizar ambientes de desenvolvimento.
- Possuir uma infraestrutura reutilizável.
- Documentar todo o processo de instalação.
- Utilizar boas práticas de infraestrutura.

---

# Tecnologias

| Tecnologia       | Versão      |
|------------------|-------------|
| PostgreSQL       | 17          |
| Apache Kafka     | 4.x (KRaft) |
| Kafbat UI        | Latest      |
| Redis            | 7.4         |
| pgAdmin          | 9.x         |
| Docker           | Engine      |
| Docker Compose   | V2          |
| Dockhand | Latest     |

---

# Arquitetura

```
                +----------------------+
                |   Aplicações Java    |
                +----------+-----------+
                           |
         ----------------------------------------
         |             Docker Network           |
         ----------------------------------------
            |        |        |        |
      PostgreSQL   Kafka    Redis   pgAdmin
                     |
                 Kafbat UI
```

Todos os serviços comunicam-se através da rede Docker **backend-network**.

---

# Estrutura do Projeto

```
backend-lab
│
├── docs/
│   ├── docker.md
│   ├── roadmap.md
│   └── server-setup.md
│
├── scripts/
│   ├── linux/
│   └── windows/
│
├── .env.example
├── docker-compose.yml
├── Makefile
└── README.md
```

---

# Pré-requisitos

- Git
- Docker Engine
- Docker Compose V2
- Make (Linux)

---

# Instalação

Clone o projeto.

```bash
git clone https://github.com/victor-maciel/backend-lab.git
```

Entre na pasta.

```bash
cd backend-lab
```

Crie o arquivo `.env`.

```bash
cp .env.example .env
```

Configure as variáveis do ambiente.

---

# Inicializando

```bash
make start
```

ou

```bash
./scripts/linux/start.sh
```

---

# Validando

```bash
make health
```

---

# Parando

```bash
make stop
```

---

# Atualizando

```bash
make update
```

---

# Documentação

Toda a documentação encontra-se na pasta **docs**.

- docker.md
- server-setup.md
- linux-server.md

---

# Roadmap

## Sprint 1

- Infraestrutura Docker
- PostgreSQL
- Redis
- Kafka
- Kafbat
- pgAdmin

## Sprint 2

- API Pedidos
- API Estoque
- Kafka Producer
- Kafka Consumer

## Sprint 3

- Observabilidade
- Prometheus
- Grafana

## Sprint 4

- Deploy
- CI/CD
- GitHub Actions

---

# Licença

MIT