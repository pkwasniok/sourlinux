# Sourlinux

## Time and locales

1. Set font

```
setfont lat2-14
```

2. Generate locales

```
echo "en_US UTF-8" >> /etc/locale.gen
echo "pl_PL UTF-8" >> /etc/locale.gen
locale-gen
```

3. Set locales

```
localectl --set-keymap pl
localectl --set-locale LANG=en_US.UTF-8
localectl --set-locale LC_TIME=pl_PL.UTF-8
```

4. Set timezone

```
timedatectl --set-timezone Europe/Warsaw
```

5. Synchronize hardware clock

```
hwclock --systohc
```

## Disks and filesystems

### Layout

| # | Label  | Filesystem | Size    | Mountpoint |
| - | ------ | ---------- | ------- | ---------- |
| 1 | EFI    | FAT32      | 1 GiB   | `/boot`    |
| 1 | SWAP   | SWAP       | 32 GiB  | `[swap]`   |
| 2 | SYSTEM | BTRFS      | ~       | `/`        |

### Formatting

```
mkfs.fat -F 32 /dev/[EFI]
```

```
mkswap /dev/[SWAP]
```

```
mkfs.btrfs /dev/[SYSTEM]
```

## Installation

TBD

