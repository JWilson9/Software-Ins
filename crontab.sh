#!/bin/bash

###############################################
#James Wilson
#DT211/3 Software Installations
#
# i have also made a bash script for my crontab
# as well as using the crontab -e
#
##############################################


sudo crontab -l > mycron


echo "0 2 * * 5 tar -zcf home/$USER/Software-Installations/script.tar.gz" >>mycron

crontab mycron

