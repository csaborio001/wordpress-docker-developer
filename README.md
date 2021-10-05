# What is this?

This is a set of scripts that I have created to help me with rapid WordPress
development for my projects.

Totally undocumented, but just having it public in case someone benefits from
any of the configuration files.

# Version History

## 0.0.1 

* Basic version working

## 0.0.2

* Included the scripts folder and a shell script to copy files directly (such as dist folder) to docker container
* Moved all shell scripts inside the scripts folder
* Included new version of mutagen.sh that excludes dist directory
* Updated docker file to WP 5.8
* Modified .gitignote to include scripts folder
* changed .env file to support Apple M1 chips
* Added environment variables and a way for scripts to load them 
* changed copyDistFolder to hold ,env variables
* Compatible with mySQL workaround for M1 chips
* Mutagen script correctly loads values
* Deply script working crrectly with env variables
* Halt script works with variables

# 0.0.6

* Got rid of all dead scripts and anything related to mutagen
* Commented out the xdebug stuff from deployment/xdebug/files-to-copy/usr/local/etc/php/conf.d/xdebug.ini

