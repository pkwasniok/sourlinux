$ROOT_UUID=

cat > /etc/cmdline.d/root.conf <<EOF
rd.luks.name=$ROOT_UUID=root root=/dev/mapper/root rw
EOF

cat > /etc/mkinitcpio.conf.d/hooks.conf << EOF
HOOKS=(base systemd autodetect microcode modconf kms keyboard sd-vconsole block sd-encrypt filesystems fsck)
EOF

cat > /etc/mkinitcpio.d/linux.preset <<EOF
PRESETS=('default')
default_kver="/boot/vmlinuz-linux"
default_options="--splash=/usr/share/systemd/bootctl/splash-arch.bmp"
default_uki="/efi/arch-linux.efi"
EOF

cat > /etc/mkinitcpio.d/linux-lts.preset <<EOF
PRESETS=('fallback')
fallback_kver="/boot/vmlinuz-linux-lts"
fallback_uki="/efi/arch-linux-fallback.efi"
EOF

efibootmgr --create --disk /dev/nvme0n1 --part 1 \
    --label "Arch Linux" --loader "\arch-linux.efi"

efibootmgr --create --disk /dev/nvme0n1 --part 1 \
    --label "Arch Linux (fallback)" --loader "\arch-linux-fallback.efi"

