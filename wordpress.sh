#!/bin/bash

# Script is deploying wordpress on server
curl https://wordpress.org/latest.tar.gz --output /home/${USER}/wordpress.tar.gz
tar xf /home/$USER/wordpress.tar.gz
chown -r $USER:$USER /var/www/html
cp -r wordpress /var/www/html
