#!/bin/sh
#/***************************************************************************
# * \file    BT_Inquiry.sh
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
hcitool scan --refresh
