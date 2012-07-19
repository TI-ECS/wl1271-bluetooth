#!/bin/sh
#/***************************************************************************
# * \file    BT_OPP_Remote_Push.sh
# *
# * \brief   Script to demonstrate object push by the remote devove over BT-OPP
# *
# * \author  Sinoj@Mistral
# *
# * \version 01a, 17Nov09, created
# * \version 02a, 27Sep10, modified
# * \version 03a, 09Dec10, modified
# ***************************************************************************/

echo "
/*
 * ############################### BT-OPP ##################################
 * Object Push Profile (OPP) is for sending objects such as pictures,
 * virtual business cards etc. It is called push because the transfers
 * are always instigated by the sender (client), not the  receiver (server).
 * #########################################################################
 */
 "

echo "--- Object Push from Remote-Device to WL1271-Host ---"

echo "Ignore the following debug messages if you get it;
      \"Unknown event!\" /
      \"Link broken (this does not have to be an error)! \" /
      \"OBEX_HandleInput() returned!! \" "
echo ""
echo "Received files will be copied to pwd -\
      $PWD"

oppserver &
sleep 2
echo -n "Press \"Enter\" to stop the OPP server: "
echo ""
read OPP_KEY

killall -9 oppserver &> /dev/null
