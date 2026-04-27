#!/bin/bash
set -e

SERVER_MOTD=${SERVER_MOTD:-"Docker Minecraft Server!"}
SERVER_DIFFICULTY=${SERVER_DIFFICULTY:-easy}
SERVER_GAMEMODE=${SERVER_GAMEMODE:-survival}
SERVER_LEVEL_NAME=${SERVER_LEVEL_NAME:-world}
SERVER_MAX_PLAYERS=${SERVER_MAX_PLAYERS:-2}
SERVER_PVP=${SERVER_PVP:-on}

echo "motd=$SERVER_MOTD" > server.properties
echo "difficulty=$SERVER_DIFFICULTY" >> server.properties
echo "gamemode=$SERVER_GAMEMODE" >> server.properties
echo "max-players=$SERVER_MAX_PLAYERS" >> server.properties
echo "pvp=$SERVER_PVP" >> server.properties


java -Xms1G -Xmx2G -jar server.jar nogui

