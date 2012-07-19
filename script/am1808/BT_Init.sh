#!/bin/sh
#/***************************************************************************
# * \file    BT_Init.sh
# *
# * \brief   Script to Initialize the BT
# *
# * \author  Sinoj@Mistral
# *
# * \version 01a, 09Dec10, created
# ***************************************************************************/

FTP_STORE_PATH=$GALLERY

echo "
/*
 * #################################################
 *                  Initialize BT
 * #################################################
 */
 "
rm   /var/run/messagebus.pid &> /dev/null
rm   /var/run/dbus/pid &> /dev/null
sleep 1
dbus-daemon --system &> /dev/null &
insmod `find /lib/modules/ -name "gpio_en.ko"`
sleep 2
hciattach /dev/ttyS1 texas 2000000 & 
sleep 10
hciconfig hci0 piscan &> /dev/null
agent --path /org/bluez/agent 0000 &> /dev/null &
sleep 2
sdptool add OPUSH &> /dev/null
sdptool add FTP &> /dev/null
dbus-launch --auto-syntax > /tmp/bt-demo-env
. /tmp/bt-demo-env
/usr/libexec/obexd -r /usr/share/wl1271-demos/bluetooth/ftp_folder --opp --ftp -a
