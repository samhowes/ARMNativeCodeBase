#!/bin/sh

#  Script.sh
#  ARMonopolyNativeCodeBase
#
#  Created by Samuel Howes on 2/1/14.
#  Copyright (c) 2014 Samuel Howes. All rights reserved.
PLUGIN_FILES="ARMViewController.h ARMViewController.m ARMAppController.h ARMAppController.m Base.lproj/Main.storyboard"
COMPILE_DIR=../../ARMonopolyNative/Libraries


for file in $PLUGIN_FILES
do
	cp $file $COMPILE_DIR
done


