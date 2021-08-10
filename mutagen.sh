mutagen sync create --sync-mode=one-way-safe --default-owner-beta=www-data \
--name=vc-dev \
~/WebSites/connect.vinnies.org.au/wp-content/mu-plugins/ docker://vc_dev/var/www/html/wp-content/mu-plugins

mutagen sync monitor