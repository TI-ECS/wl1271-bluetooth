#!/bin/sh
#/***************************************************************************
# * \file    BT_Pair.sh
# *
# * \brief   Script to demonstrate BT pairing to remote device 
# *
# * \author  Sinoj@Mistral
# *
# * \version 03b,18Oct10, modified
# ***************************************************************************/

echo "
/*
 * ########## BT-Pair ########
 * Pair to a remote BT device
 * ###########################
 */
 "

BDADDR_FILE=bd_addr.txt


echo -n "Enter the BD Addr of remote Device to Pair
====> "
read BD_ADDR

echo "Pairing with $BD_ADDR, press 'yes' when asked"
/usr/share/bluetooth/simple-agent hci0 $BD_ADDR -c "DisplayYesNo" -t 60000
