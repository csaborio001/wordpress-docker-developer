# 01- Docker Setup
#scorpio-dev/project-checklist

Running Docker on the Mac can be quite sluggish. After doing some research I decided to use Mutagen to sync things. Ever since the process has been incredibly faster.

Follow these steps to configure your environment.

## Cloning the Repo

1. From the root of your WordPress install:

``` bash
git clone https://github.com/csaborio001/wordpress-docker-developer.git deployment
```

This will create a deployment directory with all the files inside. 

Change directory to deployment:

``` bash
cd deployment
```

3. You can get rid of the git stuff:

``` bash
sudo git rm .git
```

## Configure the .env file
1. Open the ``.env`` file.
2. In line ``4`` change PROJECT_NAME to your project name (lowercase, underscores - for example: ``kdstudio_dev``)
3. Save and close  the file.

## Configure the docker-compose.yml file
1. Open ``docker-compose.yml``
2. Change the default ports for the web server (line 45) and the mySQL server (line 59)
3. Save and close the file.

## Build and run.
1. Build and run the docker image:
```
docker-compose build
docker-compose up -d 
```

This will start the build process, this is what is happening:

* A docker image containing WordPress + Apache + mySQL is being built.
* All the WP files are being place in the root directory (the one above deployment).

This process can take a while (usually two minutes). Once that is finished you can visit localhost with the port you specified. For instance, if I specified port ``11424`` I would go to:

http://localhost:11424

## Configure the WP install
1. When you access the web server, you will be prompted to select the language of your WP install, choose the one that best suits.
2. Follow the wizard and finish installing WordPress

That is basically it if you want to use Mutagen with WordPress carry on…

The idea is that nothing is synced between your machine and the docker container other than what you are currently developing. In this scenario we will assume you are working on a plugin called ``nougato``

## Install
1. Download and install [Mutagen](https://mutagen.io)

2. If you have Brew install, you can just run this command:

```
brew install mutagen-io/mutagen/mutagen
```


## Modify docker-compose.yml file

1. Bring down the Docker container

```
docker-compose down
```

2. Open ``docker-compose.yml``
3. Comment out line 32:
``` bash
# - ../:/var/www/html 
```

4. Save and close the file.

**What does this do?** From now on, the volume is not mapped (this is what slows down your Mac to a crawl). Every time you start that docker container, it will have the default ``wp-content/plugins``` and ```wp-content-uploads``` folders.

5. Start the docker instance:

```
docker-compose up -d
```

## Configure Mutagen
Assuming you want to copy the ``nougato`` plugin to the WordPress install, you would enter the following command to copy that folder over to the docker container:

``` bash
mutagen sync create --sync-mode=one-way-safe --default-owner-beta=www-data --default-group-beta=www-data \
--name=NAME-YOU-WANT-YOUR-MUTAGEN-SYNC-TO-HAVE \
~/nougato docker://YOUR_DOCKER_CONTAINER_NAME/var/www/html/wp-content/plugins
```

* Change NAME-YOU-WANT-YOUR-MUTAGEN-SYNC-TO-HAVE to a name of your choice, no underscores.
* Change YOUR_DOCKER_CONTAINER_NAME to the name of your docker setup.
* This example assumes your plugins files are inside ``~/nougato``

You can now type:

```
mutagen sync monitor YOUR-MUTAGEN-SYNC-NAME
```

To view the changes.



