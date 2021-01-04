# WordPress Docker Developer

This configuration is what I use to create WordPress docker containes for development and 
testing. The container created with the Docker container is a bit slower, so I recomemnd 
using the image that uses the official WordPress container for running tests, especially
acceptance tests.

## Instructions

### .env file

Modify the values in the env file to match your project.

### docker-compose.yml

There are two included WordPress configurations, one is meant to be used for local
development and has xdebug integration, the other one is based off the WordPress image
and works perfectlt for acceptance testing.

## To run:

```docker-composer up```

** Do not use `docker composer up` as the variables won't bread.

# Reference

* https://hub.docker.com/_/wordpress/
* https://www.wpdiaries.com/wordpress-with-xdebug-for-docker/#comment-100
* https://medium.com/@jasonterando/debugging-with-visual-studio-code-xdebug-and-docker-on-windows-b63a10b0dec
* https://github.com/kassambara/wordpress-docker-compose