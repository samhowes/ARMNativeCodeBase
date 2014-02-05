//
//  TestSettingsViewController.h
//  ARMonopolyNativeCodeBase
//
//  Created by Samuel Howes on 2/5/14.
//  Copyright (c) 2014 Samuel Howes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestSettingsViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *userDisplayStringField;

@property (weak, nonatomic) IBOutlet UIImageView *userDisplayImageView;

@property (weak, nonatomic) IBOutlet UITableViewCell *bluetoothPlaceHolderCell1;

@property (weak, nonatomic) IBOutlet UITableViewCell *bluetoothPlaceHolderCell2;

@property (weak, nonatomic) IBOutlet UITableViewCell *bluetoothPlaceHolderCell3;

@property (weak, nonatomic) IBOutlet UITableViewCell *networkPlaceholderCell1;

@property (weak, nonatomic) IBOutlet UITableViewCell *networkPlaceholderCell2;

@property (weak, nonatomic) IBOutlet UIView *createSessionCell;

@end
