//
//  ARMPlayerInfo.m
//  ARMonopolyNativeCodeBase
//
//  Created by Samuel Howes on 2/8/14.
//  Copyright (c) 2014 Samuel Howes. All rights reserved.
//

#import "ARMPlayerInfo.h"

@implementation ARMPlayerInfo

@synthesize playerDisplayName;
@synthesize playerDisplayImage;
@synthesize gameTileBluetoothID;
@synthesize sessionID;
@synthesize playersInSession;


- (id) init
{
	self = [super init];
	if (self) {
		[self loadSavedData];
		playersInSession = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void) loadSavedData
{
	// Load the persistent data on the device
}

@end
