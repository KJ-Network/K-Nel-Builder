#!/usr/bin/bash
echo 'Please select a device:'
echo '1. Meizu M6 Note (M1721)'
echo '2. Exit'
echo 'Enter numbers to select your device:'
read -r repo
if [ $repo = 1 ]
then
    cd ./Sources/M1721
    git submodule add https://github.com/tiann/kernelsu.git KernelSU
    git add .
    git commit -m "Automatically update source code using scripts"
    git push origin Kernel
fi
if [ $repo = 2 ]
then exit
fi