#!/bin/bash -

set -e

if [ "$(rpm -E %"{rhel}")" -eq 10 ]; then
  sudo dnf copr enable @caddy/caddy
else
  sudo dnf install epel-release -y
fi
sudo dnf install caddy -y # for host command

# Reset for idempotency
sudo systemctl disable --now caddy

# Begin

if [ ! -f /etc/caddy/Caddyfile.orig ]; then
    sudo cp /etc/caddy/Caddyfile /etc/caddy/Caddyfile.orig
fi

# Remove existing example.com block if present
sudo sed -i "/# BEGIN example.com block/,/# END example.com block/d" /etc/caddy/Caddyfile

# Add the block with markers
cat <<'EOF' | sudo tee -a /etc/caddy/Caddyfile

# BEGIN example.com block
example.com {
    root * /usr/share/caddy/example.com
    file_server
    tls internal
    php_fastcgi 127.0.0.1:9000
}
# END example.com block
EOF

mkdir -p /usr/share/caddy/example.com
echo '<h1>Hi!</h1>' | sudo tee /usr/share/caddy/example.com/index.html

sudo dnf install "https://rpms.remirepo.net/enterprise/remi-release-$(rpm -E '%{rhel}').rpm" -y
sudo dnf install -y php83-php-fpm -y

if [ ! -f /etc/opt/remi/php83/php-fpm.d/www.conf.orig ]; then
    sudo cp /etc/opt/remi/php83/php-fpm.d/www.conf /etc/opt/remi/php83/php-fpm.d/www.conf.orig
fi

sed -i 's|^listen = .*|listen = 127.0.0.1:9000|' /etc/opt/remi/php83/php-fpm.d/www.conf

echo '<?php phpinfo(); ?>' | sudo tee /usr/share/caddy/example.com/phpinfo.php

sudo systemctl enable --now php83-php-fpm
sudo systemctl enable --now caddy

sleep 15
