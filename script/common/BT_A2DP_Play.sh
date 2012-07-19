#!/bin/sh
#/***************************************************************************
# * \file    BT_A2DP_Play.sh
# *
# * \brief   Script to demonstrate A2DP feature of WL1271
# *
# * \author  Sinoj@Mistral
# *
# * \version 02a,28Jul10, modified
# * \version 02b,09Dec10, modified
# ***************************************************************************/

FILE_WAV_PATH=$GALLERY
echo "Select Any Audio File  ..."
echo ""
echo "The following files are available at gallery($FILE_WAV_PATH);"
ls $FILE_WAV_PATH
echo ""

echo -n "Enter the Audio wav File Name ... 
====> "
read WAV_FILE_NAME

ls $FILE_WAV_PATH/$WAV_FILE_NAME &> /dev/null
if [ "$?" -ne 0 ]; then
    aplay -Dplug:bluetooth $WAV_FILE_NAME > /dev/null > /dev/null &
else
    aplay -Dplug:bluetooth $FILE_WAV_PATH/$WAV_FILE_NAME > /dev/null > /dev/null &
fi
