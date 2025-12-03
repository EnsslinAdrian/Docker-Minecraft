# Minecraft Server – Dockerized (DevSecOps Project)


This repository contains a fully Dockerized Minecraft Java Server created as part of a DevSecOps learning project.  
The purpose of this project is to:

- Build a **custom Docker image** without using a pre-made Minecraft image  
- Run the server inside a container  
- Make the configuration fully **environment-variable-driven**  
- Persist world data using **Docker volumes**  
- Provide a clear and reproducible setup for hosting a Minecraft server  
- Learn secure configuration and containerization best practices  

The server used is the official Minecraft Java Edition server JAR (version 1.21.x).

---

## Table of Contents
1. [Requirements](#requirements)
2. [Project Structure](#project-structure)
3. [Quickstart](#quickstart)
4. [Usage](#usage)
5. [Configuration](#configuration)
6. [Environment Variables](#environment-variables)
7. [Persistent Data](#persistent-data)

---

<br>

## Requirements

Before running this project, ensure you have:

- **Docker** installed  
- **Docker Compose** installed  
- The official `server.jar` downloaded from:  
  https://www.minecraft.net/en-us/download/server

---

<br>

## Project Structure

```
/
├── Dockerfile
├── compose.yml
├── entrypoint.sh
├── server.jar               
├── eula.txt
├── world/                    
└── README.md
```

---

<br>

## Quickstart

Run the server directly:

```bash
docker compose up --build
```

Then connect via Minecraft (Java Edition):

```
localhost:8888
```

If deployed to a cloud VM:

```
<YOUR_VM_PUBLIC_IP>:8888
```

---

<br>

## Usage

To start or stop the server:

```bash
docker compose up --build
docker compose down
```

To run in background:

```bash
docker compose up -d
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

---

<br>

## Configuration

The server configuration is stored in:

```
/app/server.properties
```

This file is generated automatically at container startup based on the environment variables you define in `compose.yml`.

<br>

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
  SERVER_MOTD: "My Minecraft Server"
  SERVER_DIFFICULTY: hard
  SERVER_GAMEMODE: survival
  SERVER_MAX_PLAYERS: 2
  SERVER_PVP: on
```

---

<br>

## Persistent Data

The world directory is mounted into the container:

```yaml
volumes:
  - ./world:/app/world
```

This ensures:

- Worlds remain saved across container restarts  
- Server configuration is always preserved  
- No game data is stored inside the image  

The `.dockerignore` intentionally excludes `world/` so the build context stays clean.

---

<br>

## Author
**Adrian Enßlin**  
