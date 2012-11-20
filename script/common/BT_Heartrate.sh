#!/bin/sh
#/***************************************************************************
# * \file    BT_Heartrate.sh
# *
# * \brief   Script to demonstrate Heartrate Bluetooth profile
# *
# * \author  Sinoj@Mistral
# *
# * \version 03b,18Oct10, modified
# ***************************************************************************/

echo "
/*
 * ########## BT-Heartrate #######################
 * Gets heart rates from remote device. 
 * Please pair device before performing this test
 * ###############################################
 */
 "

BDADDR_FILE=bd_addr.txt


echo -n "Enter the BD Addr of remote Device
====> "                                                                      
read BD_ADDR         

echo "Press <Enter> to stop demo"
/usr/share/bluetooth/test-heartrate -i hci0 -b $BD_ADDR &
read KEY
killall test-heartrate

