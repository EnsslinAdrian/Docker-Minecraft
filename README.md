# Minecraft Server – Dockerized (DevSecOps Project)
This project provides a Minecraft Java Server running in its own Docker container.<br>
Configuration is done via environment variables, the world is persistently stored, <br>
and the server can be started reproducibly using Docker Compose.


## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Project Structure](#project-structure)
3. [Quickstart](#quickstart)
4. [Usage](#usage)
5. [Configuration](#configuration)
6. [Environment Variables](#environment-variables)
7. [Persistent Data](#persistent-data)


## Prerequisites
Before running this project, ensure you have:

- **Docker** installed  
- **Docker Compose** installed  


## Project Structure
```
/
├── Dockerfile
├── compose.yml
├── entrypoint.sh
├── server.jar               
├── eula.txt                
└── README.md
```


## Quickstart
Clone the repository from GitHub:
```bash
git clone git@github.com:EnsslinAdrian/Docker-Minecraft.git minecraft_docker
```

Navigate into the cloned folder:
```bash
cd minecraft_docker
```

Create a `.env` file using this command and fill in the variables:

```bash
cp .env.template .env
```

Run the server directly:
```bash
docker compose up -d
```

Then connect via Minecraft (Java Edition):

```
<YOUR_IP>:8888
```

If deployed to a cloud VM:

```
<YOUR_VM_IP>:8888
```


## Usage
To start or stop the server:

```bash
docker compose up -d
docker compose down
```

To view logs:

```bash
docker logs -f mc-server
```

To completely reset the world:

```bash
rm -r world/
docker compose up --build
```

## Configuration
The server configuration is stored in:

```
/app/server.properties
```

This file is generated automatically at container startup based on the environment variables you define in `compose.yml`.


## Environment Variables
These variables control the server configuration and are applied through `entrypoint.sh`.

| Variable | Default | Description |
|----------|---------|-------------|
| `SERVER_MOTD` | Docker Minecraft Server! | Server message shown in the client |
| `SERVER_DIFFICULTY` | easy | Difficulty level |
| `SERVER_GAMEMODE` | survival | Default game mode |
| `SERVER_MAX_PLAYERS` | 20 | Maximum number of players |
| `SERVER_PVP` | on | Enables or disables PvP |

Example from `compose.yml`:

```yaml
environment:
  - SERVER_MOTD=${SERVER_MOTD}
  - SERVER_DIFFICULTY=${SERVER_DIFFICULTY}
  - SERVER_GAMEMODE=${SERVER_GAMEMODE}
  - SERVER_MAX_PLAYERS=${SERVER_MAX_PLAYERS}
  - SERVER_PVP=${SERVER_PVP}
```


## Persistent Data
The world directory is mounted into the container:

```yaml
volumes:
  - ./world:/app/world
```

This ensures:

- Worlds remain saved across container restarts  
- Server configuration is always preserved  
- No game data is lost when rebuilding the image  

The `.dockerignore` intentionally excludes `world/` so the build context stays clean.


## Author
**Adrian Enßlin**  
