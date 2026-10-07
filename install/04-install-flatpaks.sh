# Messaging
FLATPAKS=("com.discordapp.Discord" "org.signal.Signal" "org.telegram.desktop")

# Games
FLATPAKS+=("com.valvesoftware.Steam")

# Utilities
FLATPAKS+=("org.gnome.Calendar" "org.gnome.clocks" "org.gnome.TextEditor" "org.gnome.Calculator")
FLATPAKS+=("org.gnome.Characters" "org.gnome.font-viewer")
FLATPAKS+=("io.missioncenter.MissionCenter")

# Viewers
FLATPAKS+=("org.gnome.Papers" "org.gnome.Loupe" "org.gnome.Showtime" "org.gnome.Decibels" "com.github.johnfactotum.Foliate")

flatpak install "${FLATPAKS[@]}"

