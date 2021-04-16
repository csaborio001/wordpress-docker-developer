# Copy local resources to this folder.
cp ../wp-config.php xdebug
cp -r ../wp-content/plugins xdebug/plugins
cp -r ../wp-content/uploads xdebug/uploads
docker-compose build
rm xdebug/wp-config.php
rm -R xdebug/plugins
rm -R xdebug/uploads