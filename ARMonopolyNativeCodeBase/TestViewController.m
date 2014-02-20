//
//  TestViewController.m
//  ARMonopolyNativeCodeBase
//
//  Created by Samuel Howes on 2/3/14.
//  Copyright (c) 2014 Samuel Howes. All rights reserved.
//

#import "TestViewController.h"
#import "ARMPlayerInfo.h"

@interface TestViewController ()

@property (strong, nonatomic) ARMPlayerInfo *userData;
@property (weak, nonatomic) IBOutlet UIButton *settingsButton;

@end

@implementation TestViewController

@synthesize userData;

#pragma mark Lifecycle Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		userData = [[ARMPlayerInfo alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	[self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
	self.navigationController.navigationBar.shadowImage = [UIImage new];
	self.navigationController.view.backgroundColor = [UIColor clearColor];
	self.navigationController.navigationBar.translucent = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if (sender != self.settingsButton) return;
	
	if (!userData)
	{
		userData = [[ARMPlayerInfo alloc] init];
	}
	// Make sure the Settings Controller modifies our copy of the user data
	if ([[segue destinationViewController] userData] != userData)
	{
		[[segue destinationViewController] setUserData: userData];
	}
	
}


@end
