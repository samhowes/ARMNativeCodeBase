//
//  TestViewController.m
//  ARMonopolyNativeCodeBase
//
//  Created by Samuel Howes on 2/3/14.
//  Copyright (c) 2014 Samuel Howes. All rights reserved.
//

#import "TestViewController.h"
#import "ARMPlayerInfo.h"

static NSString *kUserDataKey = @"userDataKey";


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

#pragma mark - UIStateRestoration

// this is called when the app is suspended to the background
- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"MyViewController: encodeRestorableStateWithCoder");
    
    [super encodeRestorableStateWithCoder:coder];
    
    // encode only its UUID (identifier), and later we get back the item by searching for its UUID
    [coder encodeObject:self.userData forKey:kUserDataKey];
}

// this is called when the app is re-launched
- (void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    // important: don't affect our views just yet, we might not visible or we aren't the current
    // view controller, save off our ivars and restore our text view in viewWillAppear
    //
    NSLog(@"MyViewController: decodeRestorableStateWithCoder");
    
    [super decodeRestorableStateWithCoder:coder];
    
    // decode the edited item
    if ([coder containsValueForKey:kUserDataKey])
    {
        // unarchive the UUID (identifier) and search for the item by its UUID
		self.userData = [coder decodeObjectForKey:kUserDataKey];
		//        NSString *identifier = [coder decodeObjectForKey:kUnsavedItemKey];
        //self.item = [[DataSource sharedInstance] itemWithIdentifier:identifier];
        //[self setupWithItem];
    }
}

@end
