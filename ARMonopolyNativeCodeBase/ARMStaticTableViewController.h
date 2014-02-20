//
//  StaticTableViewController.h
//  ARMonopolyNativeCodeBase
//
//  Created by Samuel Howes on 2/5/14.
//  Copyright (c) 2014 Samuel Howes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARMPlayerInfo.h"

@interface ARMStaticTableViewController : UITableViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *userDisplayStringTextField;
@property (strong, nonatomic) IBOutlet UIImageView *userDisplayImageView;

@property (strong, nonatomic) ARMPlayerInfo *userData;

@end
