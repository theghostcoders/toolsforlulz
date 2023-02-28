#!/bin/bash

#ddsconverter
#an easy way to
#batch convert all dds to png
#and vice versa
#Dependencies: imagemagick
#Author: theghostcoders

OP=0
EXT1="dds"
EXT2="png"

echo "[Grand Fantasia UI converter]"
echo "[1] - DDS to PNG"
echo "[2] - PNG to DDS"
echo "[3] - Quit"
echo "Option:"
read OP

case $OP in
1)
EXT1="dds"
EXT2="png"
;;
2)
EXT1="png"
EXT2="dds"
;;
3)
echo "Ok, see you next time!"
exit 1
;;
*)
echo "Option not found! Quitting!"
exit 1
esac

#Check if input folder exists
if [[ ! -d $EXT1 ]]
then
    echo -e "\e[1;31mERROR!"
    echo "Directory '$EXT1' doesnt exist!"
    echo "This means you have no input data to convert!"
    echo "Please check if you have the .dds files"
    echo "so you can put them in $EXT1 directory"
    echo "in the same folder as this script."
    echo -e "Thank you! Aborting now!\e[0m"
    exit 2
fi

#Check if output folder exists
if [[ ! -d $EXT2 ]]
then
    echo -e "\e[1;33mWARNING!"
    echo "Directory '$EXT2' doesnt exist!"
    echo "This means you have no output directory!"
    echo "Program will create it now if you have "
    echo "permissions to createa directory in the"
    echo "same folder as this script."
    echo "INFO: YOU CAN IGNORE THIS MESSAGE IF THIS IS"
    echo "YOUR FIRST TIME RUNNING THIS SCRIPT"
    echo -e "\e[1;32mThe script will continue now!\e[0m"
    mkdir $EXT2
fi

echo "-----------------------"
echo "Converting $EXT1 to $EXT2"
echo "-----------------------"

cd $EXT1

for file in *.$EXT1
do
    #separate filename from extension
    filename="${file%.*}"
    echo "$file --> $filename.$EXT2"
    convert $file ../$EXT2/$filename.$EXT2
done
