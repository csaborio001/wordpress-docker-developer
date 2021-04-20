# WordPress Docker Developer

This configuration is what I use to create WordPress docker contains for development and 
testing. The container created with the Docker container is a bit slower, so I recommend 
using the image that uses the official WordPress container for running tests, especially
acceptance tests.

## Instructions

1- Clone the repo:

```git clone https://github.com/csaborio001/wordpress-docker-developer.git deployment```

2- CD into deployment

3- Open **.env-sample** and change PROJECT_NAME to your project name and remove **-sample** from filename.

4- Open **docker-compose-sample.yml** and change the port numbers (if required) and remove **-sample** from filename.

5- Open a terminal and CD into **deployment**

6- Build the docker image:

```docker-compose build```

7- Start the docker container:

```docker-compose up -d```

8- Wait for a bit as the WordPress install finishes.

9- Visit: ``http://localhost:PORT_YOU_CHOSE``

10- Carry out the WordPress install.

11- You're done!

Optional: Docker on mac is really slow, so I suggest you use Mutagen to keep files between the container and your files synced. Read on to find out how this is done.

### Mutagen

Before you begin you must comment this line from your docker-compose.yml file:

```
- ../:/var/www/html
```

1- Download and install [Mutagen](https://mutagen.io)

2- If you have Brew install, you can just run this command:

```brew install mutagen-io/mutagen/mutagen```

3- Bring down the Docker container:

```docker-compose down```

4- Start the docker container:

```docker-compose up -d```

4- Run the following command to sync the wp-content directory from your machine to the docker container:

```
mutagen sync create --sync-mode=one-way-safe --default-owner-beta=www-data --default-group-beta=www-data \
--name=NAME_OF_MUTAGEN_SYNC \
PATH_TO_YOUR_WP_CONTENT_FOLDER docker://DOCKER_CONTAINER_NAME/var/www/html/wp-content
```

For example:

mutagen sync create --sync-mode=one-way-safe --default-owner-beta=www-data --default-group-beta=www-data \
--name=esaanz-docker-sync \
~/WebSites/esaanz.org.au/wp-content docker://esaanz_dev/var/www/html/wp-content

5- Wait a bit mutagen will start the one-way sync to the folder.

### Visual Studio Code Debug Configuration

```
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Listen for XDebug",
            "type": "php",
            "request": "launch",
            "port": 9000,
            "pathMappings": {
                "/var/www/html":"${workspaceFolder}"
            }
        },
        {
            "name": "Launch currently open script",
            "type": "php",
            "request": "launch",
            "program": "${file}",
            "cwd": "${fileDirname}",
            "port": 9000
        }
    ]
}
```

## To run:

```docker-composer up```

** Do not use `docker composer up` as the variables won't bread.

# Reference

* https://hub.docker.com/_/wordpress/
* https://www.wpdiaries.com/wordpress-with-xdebug-for-docker/#comment-100
* https://medium.com/@jasonterando/debugging-with-visual-studio-code-xdebug-and-docker-on-windows-b63a10b0dec
* https://github.com/kassambara/wordpress-docker-compose

## Version History

# 0.0.4

Added deloy.sh script

# 0.0.1

* Created Version History
* Added mutagen.sh.
* Added code to install VIM on base image.