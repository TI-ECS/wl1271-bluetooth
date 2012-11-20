#!/bin/sh
#/***************************************************************************
# * \file    BT_Discover.sh
# *
# * \brief   Script to scan for the remote BT devices
# *
# * \author  Sinoj@Mistral
# *
# * \version 02a,11Aug10, modified
# ***************************************************************************/

echo "
/*
 * ########### BT-Scan #############
 * Scan for the remote BT devices
 * #################################
 */
"
echo "Press <Enter> to exit..."
/usr/share/bluetooth/test-discovery -c &
read KEY
killall test-discovery 2>&1 > /dev/null
