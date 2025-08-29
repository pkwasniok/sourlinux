# Sourlinux

## Pre-installation

### Locales

1. Set console font

```sh
$ setfont lat2-14
```

2. Generate locales

```sh
$ echo "en_US UTF-8" >> /etc/locale.gen
$ echo "pl_PL UTF-8" >> /etc/locale.gen
$ locale-gen
```

3. Set locales

```sh
$ timedatectl set-keymap pl
$ timedatectl set-locale LANG=en_US.UTF-8
$ timedatectl set-locale LC_TIME=pl_PL.UTF-8
```

### Internet

Connect to the internet.

### Timezone

1. Set timezone

```sh
$ timedatectl set-timezone Europe/Warsaw
```

2. Synchronize hardware clock

```sh
$ hwclock --systohc
```

### Disks

1. Partitions layout

| # | Mount point | Type                  | Size   | Filesystem |
| - | ----------- | --------------------- | ------ | ---------- |
| 1 | `/boot`     | EFI partition (1)     | 1 GiB  | FAT32      |
| 2 | ~           | Linux swap (19)       | 32 GiB | swap       |
| 3 | ~           | Linux filesystem (20) | ~      | btrfs      |

2. Subvolumes layout

| # | Mount point        | Name     |
| - | ------------------ | -------- |
| 1 | `/`                | `@`      |
| 2 | `/home`            | `@home`  |
| 3 | `/usr/share/games` | `@games` |

3. Mounting

```sh
$ mount -o subvol=@ /dev/<Root partition> /mnt
```

```sh
$ mkdir -p /mnt/home
$ mount -o subvol=@home /dev/<Root partition> /mnt/home
```

```sh
$ mkdir -p /mnt/games
$ mount -o subvol=@games /dev/<Root partition> /usr/share/games
```

```sh
$ mkdir -p /mnt/boot
$ mount /dev/<EFI partition> /mnt/boot
```

```sh
$ swapon /dev/<Swap partition>
```

## Installation

TBD

## Post-installation

1. Generate fstab

```sh
$ genfstab /mnt > /mnt/etc/fstab
```

2. Change root

```sh
$ arch-chroot /mnt
```

3. Install bootloader

```sh
$ bootctl install
```

```
PRESETS=('default')

default_kver='/boot/vmlinuz-linux'
default_uki='/boot/arch-linux.efi'
```

```
PRESETS=('fallback')

fallback_kver='/boot/vmlinuz-linux-lts'
fallback_uki='/boot/arch-linux-fallback.efi'
```

```
root=UUID=[UUID] rootflags=subvol=@
```

```
efibootmgr --create --label 'Arch Linux' --unicode --disk /dev/[efi part] --loader '\arch-linux.efi'
efibootmgr --create --label 'Arch Linux (fallback)' --unicode --disk /dev/[efi part] --loader '\arch-linux-fallback.efi'
efibootmgr --create --label 'Shell' --unicode --disk /dev/[efi part] --loader '\edk2-shell.efi'
```




