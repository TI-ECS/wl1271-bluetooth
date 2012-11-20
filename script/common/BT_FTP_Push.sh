#!/bin/sh
#/***************************************************************************
# * \file    BT_FTP_Push.sh
# *
# * \brief   Script to demonstarte FTP over BT
# *
# * \author  Sinoj@Mistral
# *
# * \version 02a,28Jul10, modified
# * \version 02b,09Dec10, modified
# ***************************************************************************/

echo "
/*
 * ########################## BT-FTP ################################
 * File Transfer Profile (FTP) provides capability to transfer files
 * and folders in an object store (file system) of another system.
 * ##################################################################
 */
"
echo "FTP from OMAP3EVM to remote device"
echo "
Note: 
    For this test ensure that we have BD_ADDR of remote device and CH_NUM of
    this remote device for FTP service
"

echo -n "Enter the BD_ADDR of the remote Device for FTP test
====> "
read BD_ADDR

FTP_FILE_PATH=$GALLERY

echo ""                                                                      
echo "Local File Available under \"$FTP_FILE_PATH\""                                               
echo ""                                                                       
ls $FTP_FILE_PATH                                                             
echo ""                                                                       
                                                                              
echo -n "Enter the local file name to be sent over FTP
====> "                                                                       
read LFILE                                                                   
                                                                             
. /tmp/bt-demo-env

ls $FTP_FILE_PATH/$LFILE &> /dev/null                                        
if [ "$?" -ne 0 ]; then                                                      
	/usr/share/bluetooth/ftp-client -d $BD_ADDR  -p $LFILE
else                                                                         
	/usr/share/bluetooth/ftp-client -d $BD_ADDR  -p $FTP_FILE_PATH/$LFILE
fi  
