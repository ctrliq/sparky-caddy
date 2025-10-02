# Sparky Caddy

Verify Caddy installation cookbook on Rocky Linux using Sparky

## Cookbook

<https://docs.rockylinux.org/guides/web/caddy/>

## Report example

```console
[task stdout]
17:15:20 :: Last metadata expiration check: 0:39:03 ago on Thu 02 Oct 2025 04:36:17 PM CDT.
17:15:20 :: Package epel-release-9-10.el9.noarch is already installed.
17:15:20 :: Dependencies resolved.
17:15:20 :: Nothing to do.
17:15:20 :: Complete!
17:15:21 :: Last metadata expiration check: 0:39:03 ago on Thu 02 Oct 2025 04:36:17 PM CDT.
17:15:21 :: Package caddy-2.6.4-2.el9.x86_64 is already installed.
17:15:21 :: Dependencies resolved.
17:15:21 :: Nothing to do.
17:15:21 :: Complete!
17:15:21 :: 
17:15:21 :: # BEGIN example.com block
17:15:21 :: example.com {
17:15:21 ::     root * /usr/share/caddy/example.com
17:15:21 ::     file_server
17:15:21 ::     tls internal
17:15:21 ::     php_fastcgi 127.0.0.1:9000
17:15:21 :: }
17:15:21 :: # END example.com block
17:15:21 :: <h1>Hi!</h1>
17:15:22 :: Last metadata expiration check: 0:39:05 ago on Thu 02 Oct 2025 04:36:17 PM CDT.
17:15:22 :: remi-release-9.rpm                               69 kB/s |  32 kB     00:00    
17:15:22 :: Package remi-release-9.5-2.el9.remi.noarch is already installed.
17:15:22 :: Dependencies resolved.
17:15:22 :: Nothing to do.
17:15:22 :: Complete!
17:15:23 :: Last metadata expiration check: 0:39:06 ago on Thu 02 Oct 2025 04:36:17 PM CDT.
17:15:23 :: Package php83-php-fpm-8.3.26-1.el9.remi.x86_64 is already installed.
17:15:23 :: Dependencies resolved.
17:15:23 :: Nothing to do.
17:15:23 :: Complete!
17:15:23 :: <?php phpinfo(); ?>
[task stderr]
17:15:39 :: Removed "/etc/systemd/system/multi-user.target.wants/caddy.service".
17:15:39 :: Created symlink /etc/systemd/system/multi-user.target.wants/caddy.service → /usr/lib/systemd/system/caddy.service.
[task run: task.bash - tasks/caddy-test]
[task stdout]
17:15:39 :: enabled
17:15:39 :: enabled
17:15:39 :: active
17:15:39 :: active
17:15:39 :: <h1>Hi!</h1>
17:15:39 :: 200
[task check]
stdout match (s) <enabled> True
stdout match (s) <enabled> True
stdout match (s) <active> True
stdout match (s) <active> True
stdout match (s) <<h1>Hi!</h1>> True
stdout match (s) <200> True
```
