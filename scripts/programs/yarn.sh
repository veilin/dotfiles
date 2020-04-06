#!/bin/bash

(curl -sSL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -) \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list \
  && sudo apt update -y \
  && sudo apt install yarn -y
