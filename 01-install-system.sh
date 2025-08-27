pacstrap -K /mnt \

    # Linux
    linux linux-lts linux-firmware sof-firmware amd-ucode base base-devel sudo \

    # EFI extensions
    edk2-shell efibootmgr \

    # Basic tools
    tmux neovim fish curl htop rsync \
    7zip zip \
    openssl openssh \

    # Development tools
    git mercurial \
    gdb cmake \

    # Python
    python ipython python-pip python-numpy python-matplotlib python-scipy \

    # Pacman extensions
    pacman-contrib reflector \

    # Networking
    networkmanager iptables bluez bluez-utils \

    # Filesystems
    btrfs-progs dosfstools \

    # Docs
    man-db man-page \

    # Runtimes
    docker docker-compose docker-buildx flatpak \

    # Others
    cups tlp

