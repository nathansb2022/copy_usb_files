#!/bin/bash

echo 'A script to mount/unmount and copy data for RHEL desktop.'
mkdir /mnt/Data
mount /dev/sdc1 /mnt/Data
sleep 1
#Show if there is actual files to be copied
ls /mnt/Data
#If there are files, let's copy them over
if [[ -d /mnt/Data ]]
then
 oData=$(ls /mnt/Data | grep -i "filename")
 cp -r /mnt/Data ~/Documents/
 sleep 1
 ls -tl ~/Documents/ | head
 #Match the files from the usb drive with the ~/Documents/ directory to make sure of a good copy
 for FILE in $oData
 do
  if [[ -f ~/Documents/$FILE ]]
  then
   echo "${FILE} has been copied to the Documents folder!"
  fi
 done
 #After good copy then unmount the media
 umount /mnt/Data
#If there are no files, then unmountMedia
else
 umount /mnt/Data
fi
