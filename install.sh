#!/bin/bash

cd ~
git clone https://github.com/ahdinosaur/dotfiles.git
cd dotfiles/
cp -r ./ ../
cd ../
rm -rf dotfiles
