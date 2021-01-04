#!/bin/bash

GAME_DIR=/steam/7dtd

# Default config does not exist, copy in place
if [ ! -f /config/serverconfig.xml ]; then
    echo "ERROR: Config not created yet. Copying default to /config then exiting."
    echo "Make sure the volume is mounted!"
    cp ${GAME_DIR}/serverconfig.xml /config
    exit 1
fi

if [ ! -d /config/Saves ]; then
    echo "Creating Saves directory"
    mkdir /config/Saves
fi

# dlopen failed trying to load: steamclient.so, update ld path
export LD_LIBRARY_PATH=${GAME_DIR}/7DaysToDieServer_Data/Plugins/x86_64:$LD_LIBRARY_PATH

# Wire up save dirs
mkdir -p /steam/.local/share/7DaysToDie/
ln -nsf /config/Saves /steam/.local/share/7DaysToDie/Saves

# Some mods get pissed if its not in the right dir.
cd ${GAME_DIR}
echo "Starting game with arguments '${START_ARGS}'"
${GAME_DIR}/7DaysToDieServer.x86_64 ${START_ARGS} -configfile=/config/serverconfig.xml
