# Base
PACKAGES=("linux" "linux-lts" "linux-firmware" "sof-firmware" "amd-ucode")
PACKAGES+=("base" "base-devel" "sudo" "zsh")

# EFI
PACKAGES+=("efibootmgr" "edk2-shell")

# Tools
PACKAGES+=("neovim" "tmux" "curl" "wget" "htop" "tree" "rsync" "fzf" "less")
PACKAGES+=("syncthing" "openssl" "openssh")
PACKAGES+=("git" "mercurial" "gdb" "cmake")

# Python
PACKAGES+=("python" "python-pip" "uv")

# Pacman
PACKAGES+=("pacman-contrib" "reflector")

# Connectivity
PACKAGES+=("networkmanager" "firewalld" "wireguard-tools" "inetutils")
PACKAGES+=("bluez" "bluez-utils")

# Filesystems
PACKAGES+=("btrfs-progs" "e2fsprogs" "dosfstools" "exfatprogs")

# Documentation
PACKAGES+=("man-db" "man-pages" "texinfo")

# Containers
PACKAGES+=("docker" "docker-compose" "docker-buildx")

# Misc
PACKAGES+=("cups" "tlp" "flatpak")

# Audio
PACKAGES+=("pipewire" "wireplumber")
PACKAGES+=("pipewire-audio" "pipewire-alsa" "pipewire-pulse" "pipewire-jack")

# Graphics
PACKAGES+=("mesa" "vulkan-radeon")

# Fonts
PACKAGES+=("noto-fonts" "noto-fonts-extra" "noto-fonts-cjk" "noto-fonts-emoji")
PACKAGES+=("woff2-font-awesome" "ttc-iosevka")

# Gnome
PACKAGES+=("gdm" "gnome-shell" "gnome-keyring" "gnome-settings-daemon")
PACKAGES+=("gnome-backgrounds" "gnome-control-center" "gnome-tweaks")
PACKAGES+=("ptyxis" "firefox" "wl-clipboard")

# Install packages
pacstrap -K /mnt "${PACKAGES[@]}"

# Generate fstab
genfstab -U /mnt > /mnt/etc/fstab

