# Server Setup

Este documento descreve todo o processo de preparação de um servidor Ubuntu Server para execução do Backend Lab.

---

# Requisitos

- Ubuntu Server 24.04 LTS
- Acesso SSH
- Usuário com sudo

---

# Atualização do sistema

```bash
sudo apt update
sudo apt upgrade -y
```

---

# Instalação do Git

```bash
sudo apt install git -y
```

# Instalação do Make

```bash
sudo apt install make
```


---
# Configurando o acesso SSH

Após instalar o Ubuntu Server, faça login localmente e execute os passos abaixo.

---

## 1. Instalar o OpenSSH Server

```bash
sudo apt update

sudo apt install -y openssh-server
```

---

## 2. Verificar o serviço

```bash
sudo systemctl status ssh
```

O resultado esperado deve conter:

```
Active: active (running)
```

Caso não esteja ativo:

```bash
sudo systemctl enable ssh

sudo systemctl start ssh
```

---

## 3. Descobrir o endereço IP

```bash
hostname -I
```

Exemplo:

```
192.168.18.46
```

Anote esse endereço.

---

## 4. Liberar o SSH no Firewall (opcional)

Caso utilize o UFW:

```bash
sudo ufw allow ssh

sudo ufw enable

sudo ufw status
```

Se o UFW estiver desabilitado, este passo pode ser ignorado.

---

## 5. Testar o SSH

No computador Windows execute:

```powershell
ssh usuario@192.168.18.46
```

Exemplo:

```powershell
ssh vieira@192.168.18.46
```

Aceite a chave do servidor quando solicitado.

Se aparecer o prompt do Ubuntu:

```text
vieira@ubuntu-server:~$
```

o SSH está funcionando corretamente.

---

# Configurando autenticação por chave (recomendado)

A autenticação por chave elimina a necessidade de informar senha e aumenta a segurança.

## 1. Gerar a chave no Windows

Abra o PowerShell.

```powershell
ssh-keygen -t ed25519
```

Pressione ENTER para aceitar o local padrão.

Arquivos gerados:

```
C:\Users\<usuario>\.ssh\
    id_ed25519
    id_ed25519.pub
```

---

## 2. Copiar a chave pública para o servidor

Se o comando abaixo estiver disponível:

```powershell
type $HOME\.ssh\id_ed25519.pub | ssh vieira@192.168.18.46 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```

Caso prefira, copie manualmente o conteúdo do arquivo:

```
id_ed25519.pub
```

e cole no arquivo do servidor:

```bash
nano ~/.ssh/authorized_keys
```

Depois ajuste as permissões:

```bash
chmod 700 ~/.ssh

chmod 600 ~/.ssh/authorized_keys
```

---

## 3. Testar

No Windows:

```powershell
ssh vieira@192.168.18.46
```

O login deverá ocorrer sem solicitar senha.

---

# Criando um alias SSH

No Windows, crie o arquivo:

```
C:\Users\<usuario>\.ssh\config
```

Conteúdo:

```text
Host backend-lab
    HostName 192.168.18.46
    User vieira
    IdentityFile C:\Users\<usuario>\.ssh\id_ed25519

    ServerAliveInterval 60
    ServerAliveCountMax 3
    Compression yes
    TCPKeepAlive yes
```

Agora basta utilizar:

```powershell
ssh backend-lab
```

---

# Transferência de arquivos (SCP)

Com a mesma configuração, copie arquivos utilizando:

```powershell
scp arquivo.txt backend-lab:/home/vieira/
```

Ou copie diretórios inteiros:

```powershell
scp -r backend-lab backend-lab:/home/vieira/
```

---

# Validação

Execute:

```powershell
ssh backend-lab
```

Resultado esperado:

```text
Last login...

nome-do-pc@ubuntu-server:~$
```

Neste momento o servidor está pronto para ser administrado remotamente.
---

# Instalação do Docker

Adicionar repositório oficial.

```bash
sudo apt install \
ca-certificates \
curl \
gnupg \
lsb-release
```

Adicionar chave GPG.

```bash
sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

Adicionar repositório.

```bash
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
noble stable" | \
sudo tee /etc/apt/sources.list.d/docker.list
```

Instalar.

```bash
sudo apt update

sudo apt install \
docker-ce \
docker-ce-cli \
containerd.io \
docker-buildx-plugin \
docker-compose-plugin
```

---

# Adicionar usuário ao grupo Docker

```bash
sudo usermod -aG docker $USER
```

Faça logout e login novamente (ou reinicie a sessão SSH).

---

# Clonar projeto

```bash
git clone <repositorio>
```

---

# Configurar

Entrar na pasta

```bash
cd backend-lab/
```
Fazer a copia do arquivo .env exemplo e criando uma .env

```bash
cp .env.example .env
```

Editar.

```bash
nano .env
```

---

# Permitir a execução dos scripts

```bash
find scripts -type f -name "*.sh" -exec chmod +x {} \;
```

---



# Iniciar

```bash
make start
```

---

# Validar

```bash
make health
```

---

# Atualizar

```bash
make update
```

---

# Parar

```bash
make stop
```

---

# Reiniciar

```bash
make restart
```

---

# Backup

Volumes Docker:

```
backend-lab_postgres_data

backend-lab_kafka_data

backend-lab_redis_data
```

Nunca remova os volumes sem possuir backup.

---

## Checklist Final

- Docker instalado
- Docker Compose instalado
- Dockhand instalado
- Git instalado
- SSH funcionando
- Projeto clonado
- `.env` configurado
- Containers iniciados
- Health Check executado
- Ambiente pronto para desenvolvimento