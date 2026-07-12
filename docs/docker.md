# Docker

## Subir o ambiente

```bash
docker compose up -d
```

---

## Parar o ambiente

```bash
docker compose down
```

---

## Reiniciar

```bash
docker compose restart
```

---

## Verificar containers

```bash
docker ps
```

---

## Ver logs

```bash
docker compose logs -f
```

Logs de um serviço específico:

```bash
docker compose logs postgres
docker compose logs kafka
docker compose logs redis
```

---

## Atualizar imagens

```bash
docker compose pull
docker compose up -d
```

---

## Remover containers

```bash
docker compose down
```

---

## Remover containers e volumes

```bash
docker compose down -v
```

---

## Remover imagens

```bash
docker image prune
```

---

## Limpar tudo

```bash
docker system prune -a
```

---

## Acessar um container

```bash
docker exec -it postgres17 bash
```

ou

```bash
docker exec -it kafka bash
```

---

## Status

```bash
docker ps
```

---

## Inspecionar volumes

```bash
docker volume ls
```

---

## Inspecionar redes

```bash
docker network ls
```
