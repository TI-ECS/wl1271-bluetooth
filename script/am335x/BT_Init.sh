#!/bin/sh
#/***************************************************************************
# * \file    BT_Init.sh
# *
# * \brief   Script to Initialize the BT
# *
# * \author  Sinoj@Mistral
# *
# * \version 01a,17Nov09, created
# * \version 02a,27Sep10, modified
# * \version 03a,25Oct10, modified
# * \version 02b,09Dec10, reverted, modified
# * \version 03a,09Dec10, modified
# ***************************************************************************/

FTP_STORE_PATH=$GALLERY
echo "
/*
 * #################################################
 *                  Initialize BT
 * #################################################
 */
 "
#hciattach /dev/ttyO1 texas 3000000 & 
hciconfig hci0 up
sleep 5
hciconfig hci0 piscan &> /dev/null
agent --path /org/bluez/agent 0000 &> /dev/null &
sleep 2
sdptool add OPUSH &> /dev/null
sdptool add FTP &> /dev/null
dbus-launch --auto-syntax > /tmp/bt-demo-env
. /tmp/bt-demo-env
/usr/libexec/obexd -r /usr/share/wl1271-demos/bluetooth/ftp_folder -a -p "bluetooth:opp:ftp:filesystem"
