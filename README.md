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

# 0.0.7

* Fixed the export path inside scripts, included maria db in env, included mailhog
* Added Maria DB in mysql config to work with both intel and mi macs

# 0.0.8

* Added code to mirror wp-config and others
* Rmoved xdebug from dockerfile
* Removed WPCLI
* Changes in docker file to include libxml2 and sopa

# 0.0.9

* Removed leftover mutagen files
* Added quotes to ports in dockerconifg file
* Changed WordPress version to 6.0.3
* Added version # to read me file

# 0.0.10

* Changed PHP and WordPress versions
* Changed mailhog version to include jcalonso version which runs natively on M1 Macs* WP, PHP, Mailhog changes


# 0.0.11 

* Included myql libraries so that it works with Shipper, WP version changes, changed default website port to 80

# 0.0.12 

* Got rid of xdebug folder, modiifed DockerFile to be more efficient
* Forced config folder b/c gitignore can be a bit of..
* Newer versions that do not include buggy line
* Moved the WP ALLOW ROOT to end of Dockerfile and updated WP verion to 6.7.1
