#!/bin/sh
#/***************************************************************************
# * \file    BT_Exit.sh
# *
# * \brief   Script for Cleaningup BT
# *
# * \author  Sinoj@Mistral
# *
# * \version 02a,28Jul10, modified
# * \version 03a,09Dec10, modified
# ***************************************************************************/

echo "
/*
 * #################################################
 *                  Cleaning BT
 * #################################################
 */
 "

killall -9 obexd                   &> /dev/null
killall -9 obex-client             &> /dev/null
killall -9 bluetoothd              &> /dev/null
killall -SIGTERM hciattach         &> /dev/null
rmmod gpio_en                      &> /dev/null
