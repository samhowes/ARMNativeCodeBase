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


- (NSArray *)keysForEncoding;
{
	return [NSArray arrayWithObjects:@"playerDisplayName",
			@"playerDisplayImage", @"gameTileBluetoothID", nil];
}

- (id)init
{
	self = [super init];
	if (self) {
		playersInSession = [[NSMutableArray alloc] init];
	}
	return self;
}

// We are asked to be archived, encode our data
- (void)encodeWithCoder:(NSCoder *)encoder
{
	for (NSString *key in self.keysForEncoding)
	{
		[encoder encodeObject:[self valueForKey:key] forKey:key];
	}
}

- (void)initWithCoder:(NSCoder *)decoder
{
	for (NSString *key in self.keysForEncoding)
	{
		[self setValue:[decoder decodeObjectForKey:key] forKey:key];
	}
}

@end
