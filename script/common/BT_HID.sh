#!/bin/sh

echo "
/*
 * ############ BT-HID ###############
 * Connect/disconnect from HID device 
 * ###################################
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

BOOL=""
echo -n "Connect/Disconnect/Quit? (c/d/q)
====> "
read BOOL

if [ "${BOOL}" == "c" ]; then
	echo -n "
####################################################################################
Reminder No. 1: Before this stage, press the device's small connect button
Reminder No. 2: After this stage, you may need to press the pincode on the keyboard,
                (e.g: to press 0 + 0 + 0 + 0 + <Enter> on the keyboard).
####################################################################################
Continue? (y/n)
====> "
	read BOOL
	if [ "${BOOL}" == "y" ]; then	
		echo "Connecting..."
		dbus-send --system --print-reply --dest=org.bluez $BT_ADAPTER/dev_$BD_ADDR_XX org.bluez.Input.Connect
	fi
elif [ "${BOOL}" == "d" ]; then
	echo "Disconnecting..."
	dbus-send --system --print-reply --dest=org.bluez $BT_ADAPTER/dev_$BD_ADDR_XX org.bluez.Input.Disconnect
fi
