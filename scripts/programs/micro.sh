#!/bin/bash

# micro editor
curl https://getmic.ro | bash
sudo mv ./micro /usr/local/bin/
micro -plugin install comment
micro -plugin install monokai-dark
micro -plugin install filemanager
micro -plugin install fmt

