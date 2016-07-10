#!/bin/sh -e

# Tell minecraft we accept the license
echo "Copying minecraft files into the proper location..."
echo "eula=true" > /minecraft/eula.txt

# copy the contents of the minecraft folder over
cp /minecraft-build/spigot*.jar /minecraft/spigot.jar
cp -R -f /minecraft-build/minecraft/* /minecraft
cp /start.sh /minecraft/start.sh

# copy the default settings if they don't already exist
cp -R /minecraft-build/defaults/* /minecraft

# Make security happy
chown -R minecraft.minecraft /minecraft/ 
