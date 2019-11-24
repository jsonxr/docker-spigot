# Build

    # Needed for envsubst
    brew install gettext
    brew link --force gettext
    # Build
    export SPIGOT_VERSION=1.14.4
    bin/build
    bin/install

# Run

    cd minecraft-$SPIGOT_VERSION
    docker-compose up -d

# Minecraft Prompt

    docker attach --sig-proxy=false spigot
    # To detach...  CTRL-c
