LOCALES=("en_US.UTF-8 UTF-8" "pl_PL.UTF-8 UTF-8")
LOCALE_LANG=en_US.UTF-8
LOCALE_NUMERIC=pl_PL.UTF-8
LOCALE_TIME=pl_PL.UTF-8
LOCALE_MONETARY=pl_PL.UTF-8
LOCALE_PAPER=pl_PL.UTF-8
LOCALE_MEASUREMENT=pl_PL.UTF-8

TIMEZONE="Europe/Warsaw"

HOSTNAME="tars"

SERVICES=("NetworkManager.service" "systemd-timesyncd.service")
SERVICES+=("systemd-resolved.service" "firewalld.service" "sshd.service")
SERVICES+=("docker.service reflector.timer paccache.timer")

# Generate locales
printf "%s\n" "${LOCALES[@]}" > /etc/locale.gen
locale-gen

# Configure locales
cat > /etc/locale.conf <<EOF
LANG=$LOCALE_LANG
LC_NUMERIC=$LOCALE_NUMERIC
LC_TIME=$LOCALE_TIME
LC_MONETARY=$LOCALE_MONETARY
LC_PAPER=$LOCALE_PAPER
LC_MEASUREMENT=$LOCALE_MEASUREMENT
EOF

# Configure timezone
ln -sf "/usr/share/zoneinfo/$TIMEZONE" /etc/localtime

# Configure hostname
printf "%s\n" "$HOSTNAME" > /etc/hostname

# Configure services
systemctl enable "${SERVICES[@]}"

