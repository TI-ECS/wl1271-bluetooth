#!/bin/sh

echo "
/*
 * ######## BT-AVRCP-Volume #########
 * Change AVRCP volume
 * ##################################
 */
 "

BDADDR_FILE=bd_addr.txt


echo -n "Enter the BD Addr of remote Device
====> "
read BD_ADDR

echo $BD_ADDR > $BDADDR_FILE
BD_ADDR_XX=`sed -e s/:/_/g $BDADDR_FILE`
rm $BDADDR_FILE

BT_ADAPTER=`dbus-send --system --print-reply --dest=org.bluez / \
org.bluez.Manager.DefaultAdapter|awk '/object path/ {print $3}'`

echo $BT_ADAPTER > $BDADDR_FILE
BT_ADAPTER=`sed s/\"//g $BDADDR_FILE`
rm $BDADDR_FILE

VOLBOOL=""
while [ "${VOLBOOL}" != "q" ]; do
	echo -n "Volume up/down/quit? (u/d/q)
====> "
	read VOLBOOL

	if [ "${VOLBOOL}" == "u" ]; then
		echo "Changing volume up"
		dbus-send --system --print-reply --dest=org.bluez $BT_ADAPTER/dev_$BD_ADDR_XX org.bluez.Control.VolumeUp &> /dev/null
	elif [ "${VOLBOOL}" == "d" ]; then
		echo "Changing volume down"
		dbus-send --system --print-reply --dest=org.bluez $BT_ADAPTER/dev_$BD_ADDR_XX org.bluez.Control.VolumeDown &> /dev/null
	else
		VOLBOOL="q"
	fi
done 
