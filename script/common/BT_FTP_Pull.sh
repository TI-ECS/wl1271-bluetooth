#!/bin/sh
#/***************************************************************************
# * \file    BT_FTP_Pull.sh
# *
# * \brief   Script to demonstarte FTP over BT
# *
# * \author  Sinoj@Mistral
# *
# * \version 02a,28Jul10, modified
# * \version 02b,27Sep10, modified
# * \version 03a,25Oct10, modified
# * \version 03b,09Dec10, modified
# ***************************************************************************/

echo "
/*
 * ########################### BT-FTP ###############################
 * File Transfer Profile (FTP) provides capability to transfer files
 * and folders in an object store (file system) of another system.
 * Following are the two ways of testing FTP
 * ##################################################################
 */
"

sleep 2

echo "

Note:
    - FTP Server started, send the files over BT-FTP from the remote
      device. There will not be any notification on the EVM when the data
      transfer completes. Ensure that its present in the path $GALLERY.

"
echo -n "Enter Any key After FTP transfer: "
echo ""
read FTP_KEY
