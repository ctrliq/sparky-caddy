# Check caddy is enabled and running
sudo systemctl is-enabled caddy
sudo systemctl is-enabled php83-php-fpm
sudo systemctl is-active caddy
sudo systemctl is-active php83-php-fpm

# Check example.com is working
curl -sk --resolve example.com:443:127.0.0.1 https://example.com/
curl -sk --resolve example.com:443:127.0.0.1 https://example.com/phpinfo.php -w "%{http_code}\n" -o /dev/null