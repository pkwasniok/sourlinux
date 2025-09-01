# Conigure kernel arguments
mkdir /etc/cmdline.d
echo 'root=UUID=[UUID] rootflags=subvol=@' > /etc/cmdline.d/root.conf
echo 'quiet' > /etc/cmdline.d/other.conf

# Remove EFI boot entries
efibootmgr | awk '/Boot[0-9]{4}/ { printf "efibootmgr --bootnum %s --delete-bootnum\n", substr($1, 5, 4) }' | sh

# Add EFI boot entries
efibootmgr --create --unicode --label "Arch Linux" --disk /dev/nvme0n1p1 --loader '\arch-linux.efi'
efibootmgr --create --unicode --label "Arch Linux (fallback)" --disk /dev/nvme0n1p1 --loader '\arch-linux-fallback.efi'
efibootmgr --create --unicode --label "Shell" --disk /dev/nvme0n1p1 --loader '\edk2-shell.efi'

