# Generate locales
echo "en_US UTF-8" > /etc/locale.gen
echo "pl_PL UTF-8" >> /etc/locale.gen
locale-gen

# Set locale
localectl set-keymap pl
localectl set-locale LANG=pl_PL.UTF-8
localectl set-locale LC_MESSAGES=en_US.UTF-8

# Set timezone
timedatectl set-timezone Europe/Warsaw

