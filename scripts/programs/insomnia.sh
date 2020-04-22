#!/bin/bash

wget https://updates.insomnia.rest/downloads/ubuntu/latest
mv latest insomnia.deb
sudo dpkg -i insomnia.deb
