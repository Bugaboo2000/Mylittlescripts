#!/bin/bash

# activate redshift

redshift -O 5500

#deactivate redshift

source disable.sh

#create a config file

touch ~/.config/redshift.conf
