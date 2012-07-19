#!/bin/sh
#/***************************************************************************
# * \file    BT_A2DP_Play.sh
# *
# * \brief   Run A2DP several times for testing
# *
# * \author  Sinoj@Mistral
# *
# * \version 01a, 05Oct10, created
# * \version 01b, 09Dec10, modified
# ***************************************************************************/


echo ""
echo ""
echo "A2DP streaming.. repeat it for several times... till headset dies!!"

echo "Is the headset paired ? y/n"
read PAIR
if [ "$PAIR" != "y" ] ; then
exit
fi

echo "Enter number of times to play:"
read COUNT

GALLERY=/usr/share/wl1271-demos/bluetooth/gallery

chmod 777 BT_A2DP_Init.sh
. ./BT_A2DP_Init.sh

IDX=0

while [ "$IDX" -ne "$COUNT" ] 
do
 IDX=`expr $IDX + 1`
 echo "Count = "$IDX""
 aplay -Dplug:bluetooth $GALLERY/Pop.wav 
 sleep 2
done

