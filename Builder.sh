#!/usr/bin/bash

echo 'K-Nel Projects Builder'
echo 'Powered By K-Nel Developers'
echo '-------------------------------------'
echo '1. Build Kernel'
echo '2. Upload Sources To Github'
echo '3. Exit'
echo 'Enter numbers to select your option:'
read -r option

if [ $option = 1 ]
    then
    echo 'Please select a device:'
    echo '1. Meizu M6 Note (M1721)'
    echo '2. Exit'
    echo 'Enter numbers to select your device:'
    read -r device
    if [ $device = 1 ]
        then 
        cd ./Sources/M1721/
        bash build-kernel.sh | tee /root/K-Nel-Projects/OutFiles/Build-Kernel-M1721.log
        if [ -e '/root/K-Nel-Projects/OutFiles/K-Nel-M1721.zip' ]
          then rm '/root/K-Nel-Projects/OutFiles/K-Nel-M1721.zip'
        fi
        if [ -e out/arch/arm64/boot/Image.gz ]
        then
            echo 'Pack Starting······'
            cp -r out/arch/arm64/boot/Image.gz /root/K-Nel-Projects/Toolchain/Anykernel3/
            cd /root/K-Nel-Projects/Toolchain/Anykernel3/
            zip -r '/root/K-Nel-Projects/OutFiles/K-Nel-M1721.zip' *
        else
        echo 'Build Failed!'
        exit
        fi
        if [ -s '/root/K-Nel-Projects/OutFiles/K-Nel-M1721.zip' ]
          then echo 'Pack Successed!'
          else
            echo 'Pack Failed!'
            exit
        fi
        echo 'Build Successed!'
    fi
    if [ $device = 2 ]
        then exit
    fi
fi

if [ $option = 2 ]
then bash ./Sources/upload-sources.sh | tee ./OutFiles/Upload-Sources.log
fi

if [ $option = 3 ]
then exit
fi