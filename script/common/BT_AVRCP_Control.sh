#!/bin/sh

echo "
/*
 * ############ BT-AVRCP-Control #############
 * AVRCP controls (play/pause/rewind/forward)
 * ###########################################
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

dbus-send --system --print-reply --dest=org.bluez $BT_ADAPTER/dev_$BD_ADDR_XX org.bluez.AudioSink.Connect &> /dev/null
dbus-send --system --print-reply --dest=org.bluez $BT_ADAPTER/dev_$BD_ADDR_XX org.bluez.AudioSink.IsConnected 2>&1 | grep "boolean true" > /dev/null
if [ "$?" -ne 0 ]; then
        echo ""
        echo "Connecting failure ..."
else
	BD_ADDR_YY=`echo $BD_ADDR | sed 's/^[ \t]*//;s/[ \t]*$//'`
	input_file=`grep "\(Name=\)\|\(Handlers=\)" /proc/bus/input/devices | grep -A 1 "$BD_ADDR_YY" | tail -1 | sed -n 's/.*[ \t]*\(event[0-9]*\)[ \t]*.*/\1/pg'`
	if [ ! -n "${input_file}" ]; then
		echo "Could not obtain input filename "
	else
		eventdump /dev/input/${input_file} &
		echo -n "
#################################################
Press play/pause/rewind/forward on your headset
Press enter to end the test
#################################################
"
		read
		killall eventdump >& /dev/null
	fi
fi
