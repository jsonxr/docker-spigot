#!/bin/sh -e

trap exit HUP
trap exit INT
trap exit TERM
trap exit QUIT
trap exit ABRT

# Copy eula to minecraft directory so this works
if [ ! -f /minecraft/eula.txt ]; then
  # Tell minecraft we accept the license
  echo "Copying minecraft files into the proper location..."
  echo "eula=true" > /minecraft/eula.txt

  # copy the contents of the minecraft folder over
  cp /minecraft-build/spigot*.jar /minecraft/spigot.jar
  cp --recursive /minecraft-build/minecraft/* /minecraft
  cp /start.sh /minecraft/start.sh

  # copy the default settings if they don't already exist
  cp --recursive --no-clobber /minecraft-build/defaults/* /minecraft

  # Make security happy
  chown -R minecraft.minecraft /minecraft/ 
fi


java -Xms$MEMORY_MIN -Xmx$MEMORY_MAX -jar spigot.jar
