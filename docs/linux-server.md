# Linux Server - Backend Lab

## Objetivo

Este documento descreve todo o processo de preparação do servidor Linux utilizado pelo Backend Lab.

Ao final deste guia o servidor estará preparado para:

- Docker
- Docker Compose
- PostgreSQL
- Kafka
- Redis
- Portainer
- pgAdmin
- Kafka UI
- Git
- SSH
- SCP

Todo o gerenciamento poderá ser realizado diretamente pelo Windows utilizando SSH.

---

# Pré-requisitos

- Linux Mint XFCE instalado
- Acesso à internet
- Usuário com permissão sudo
- Mesmo segmento de rede da máquina Windows

---

# Atualizando o sistema

Atualize a lista de pacotes.

```bash
sudo apt update
```

Atualize os pacotes instalados.

```bash
sudo apt upgrade -y
```

Remova pacotes desnecessários.

```bash
sudo apt autoremove -y
```

---

# Instalando ferramentas básicas

```bash
sudo apt install -y \
git \
curl \
wget \
vim \
nano \
htop \
net-tools \
tree \
zip \
unzip
```

Verifique as versões.

```bash
git --version

curl --version

tree --version
```

---

# Instalando OpenSSH Server

Instale o servidor SSH.

```bash
sudo apt install openssh-server -y
```

Verifique o status.

```bash
sudo systemctl status ssh
```

A saída deverá indicar:

```
active (running)
```

Caso não esteja iniciado:

```bash
sudo systemctl start ssh
```

Habilite o serviço na inicialização.

```bash
sudo systemctl enable ssh
```

Confirme novamente.

```bash
sudo systemctl status ssh
```

---

# Descobrindo o IP do servidor

Execute:

```bash
hostname -I
```

Exemplo:

```
192.168.18.46
```

Esse será o IP utilizado pelo Windows.

---

# Testando acesso pelo Windows

Abra o PowerShell.

Conecte utilizando:

```powershell
ssh vieira@192.168.18.46
```

Na primeira conexão será exibida a mensagem:

```
Are you sure you want to continue connecting?
```

Digite:

```
yes
```

Informe a senha do usuário Linux.

Se tudo estiver correto aparecerá:

```bash
vieira@vieira-M2-Air:~$
```

---

# Gerando chave SSH no Windows

No PowerShell execute:

```powershell
ssh-keygen -t ed25519 -C "Victor Backend Lab"
```

Pressione ENTER para todas as perguntas.

Ao final serão criados:

```
C:\Users\Victor\.ssh\id_ed25519

C:\Users\Victor\.ssh\id_ed25519.pub
```

Verifique:

```powershell
dir $HOME\.ssh
```

Resultado esperado:

```
id_ed25519

id_ed25519.pub

known_hosts
```

---

# Copiando a chave para o Linux

Execute:

```powershell
type $HOME\.ssh\id_ed25519.pub | ssh vieira@192.168.18.46 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys"
```

Informe a senha apenas essa única vez.

---

# Testando autenticação sem senha

Execute:

```powershell
ssh vieira@192.168.18.46
```

A conexão deverá ocorrer sem solicitar senha.

---

# Criando um alias SSH

Crie o arquivo de configuração.

```powershell
notepad $HOME\.ssh\config
```

Adicione:

```text
Host backend-lab
    HostName 192.168.18.46
    User vieira
    IdentityFile C:\Users\Victor\.ssh\id_ed25519

    ServerAliveInterval 60
    ServerAliveCountMax 3

    Compression yes

    TCPKeepAlive yes
```

Salve o arquivo.

Agora basta executar:

```powershell
ssh backend-lab
```

---

# Explicação da configuração

## Host

Nome utilizado para acessar o servidor.

```
backend-lab
```

Permite conectar utilizando:

```powershell
ssh backend-lab
```

---

## HostName

IP do servidor Linux.

```
192.168.18.46
```

---

## User

Usuário utilizado para login.

```
vieira
```

---

## IdentityFile

Chave privada utilizada para autenticação.

```
C:\Users\Victor\.ssh\id_ed25519
```

---

## ServerAliveInterval

Envia um pacote ao servidor a cada 60 segundos para manter a conexão ativa.

---

## ServerAliveCountMax

Número máximo de tentativas antes da conexão ser encerrada.

---

## Compression

Habilita compressão na comunicação SSH.

---

## TCPKeepAlive

Evita desconexões por inatividade.

---

# Transferindo arquivos com SCP

Copiar um arquivo do Windows para o Linux.

```powershell
scp C:\Temp\arquivo.txt backend-lab:~
```

Copiar uma pasta.

```powershell
scp -r C:\workspace\backend-lab backend-lab:~
```

Copiar um arquivo do Linux para o Windows.

```powershell
scp backend-lab:~/docker-compose.yml C:\Temp\
```

Copiar uma pasta inteira do Linux.

```powershell
scp -r backend-lab:~/logs C:\Temp\
```

---

# Estrutura do diretório .ssh

Windows

```
C:\Users\Victor\.ssh
```

Arquivos:

```
config

id_ed25519

id_ed25519.pub

known_hosts
```

Descrição:

| Arquivo | Descrição |
|----------|-----------|
| id_ed25519 | Chave privada. Nunca compartilhe. |
| id_ed25519.pub | Chave pública utilizada no servidor. |
| known_hosts | Lista de servidores conhecidos. |
| config | Configuração dos aliases SSH. |

---

# Fluxo de trabalho

Desenvolvimento:

```
Windows
    │
    ▼
IntelliJ IDEA
    │
    ▼
git add
git commit
git push
    │
    ▼
GitHub
    │
    ▼
Servidor Linux
    │
    ▼
ssh backend-lab
    │
    ▼
git pull
    │
    ▼
./scripts/linux/start.sh
```

---

# Checklist

- [ ] Linux instalado
- [ ] Sistema atualizado
- [ ] Git instalado
- [ ] OpenSSH instalado
- [ ] SSH habilitado
- [ ] Chave SSH criada
- [ ] Chave copiada para o Linux
- [ ] Alias backend-lab criado
- [ ] Login sem senha funcionando
- [ ] SCP funcionando
- [ ] Docker instalado
- [ ] Docker Compose instalado
- [ ] GitHub configurado
- [ ] Repositório clonado
- [ ] Ambiente Docker iniciado

---

# Próximos passos

Após concluir este guia, prossiga com:

1. Configuração do GitHub via SSH.
2. Clonagem do repositório Backend Lab.
3. Validação do Docker Compose.
4. Inicialização dos containers.
5. Validação dos serviços PostgreSQL, Redis, Kafka e pgAdmin.