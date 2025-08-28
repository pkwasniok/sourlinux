# Sourlinux

## Disk formatting

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

