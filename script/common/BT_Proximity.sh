#!/bin/sh
#/***************************************************************************
# * \file    BT_Proximity.sh
# *
# * \brief   Script to demonstrate Proximity profile
# *
# * \author  Sinoj@Mistral
# *
# * \version 03b,18Oct10, modified
# ***************************************************************************/

echo "
/*
 * ########## BT-Proximity #######################
 * Link loss and Find me profiles
 * Please pair device before performing this test
 * ###############################################
 */
 "

BDADDR_FILE=bd_addr.txt


echo -n "Enter the BD Addr of remote Device
====> "                                                                      
read BD_ADDR         

echo "Choose Proximity test"
echo " 1. Link loss"
echo " 2. Find Me"
echo -n "====> "
read TEST

case $TEST in
 1)
	/usr/share/bluetooth/test-proximity -b $BD_ADDR LinkLossAlertLevel high 2>&1 > /dev/null &
	echo "Please distance LE remote device from EVM until link is lost."
	echo "The remote device should make a sound."
	echo "Press <Enter> to exit"
	read KEY
	exit 0
	;;
2)
	/usr/share/bluetooth/test-proximity -b $BD_ADDR ImmediateAlertLevel high 2>&1 > /dev/null
	echo "The remote device should make a sound. Press <Enter> to exit."
	read KEY
	/usr/share/bluetooth/test-proximity -b $BD_ADDR ImmediateAlertLevel none 2>&1 > /dev/null
	exit 0
	;;
*)
	echo "Unknown option"
	;;
esac

