//
//  ARMPlayerInfo.h
//  ARMonopolyNativeCodeBase
//
//  Created by Samuel Howes on 2/8/14.
//  Copyright (c) 2014 Samuel Howes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface ARMPlayerInfo : NSObject

// Local Player info
@property NSString *playerDisplayName;

@property UIImage *playerDisplayImage;

@property NSString *gameTileBluetoothID;

// Networking Properties
@property NSString *sessionID;

@property NSMutableArray *playersInSession;


@end
