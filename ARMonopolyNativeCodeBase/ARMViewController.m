﻿#import "UnityAppController.h"
#import "ARMViewController.h"
#import "iPhone_View.h"


@implementation ARMViewController
{
	UIImage *navigationBarBackgroundImage;
	UIImage *navigationBarShadowImage;
	UIColor *navigationBarBackgroundColor;
	BOOL navigationBarIsTranslucent;
}


- (void) viewDidLoad
{
	[super viewDidLoad];
	
	UnityAppController *appDelegate = (UnityAppController *)
									[[UIApplication sharedApplication] delegate];
	[self.view addSubview:(UIView *)appDelegate.unityView];
	[self.view sendSubviewToBack:appDelegate.unityView];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	//Manually set the navigation bar to be a clear image for this view while storing the original value for later
	if (!navigationBarBackgroundImage)
	{
		navigationBarBackgroundImage = [UIImage new];
	}
	if (!navigationBarShadowImage)
	{
		navigationBarShadowImage = [UIImage new];
	}
	if (!navigationBarBackgroundColor)
	{
		navigationBarBackgroundColor = [UIColor clearColor];
		navigationBarIsTranslucent = YES;
	}
	
	[self swapNavigationBackgound]; // switch the navigation bar from what it was before to translucent.
}

- (void) viewDidDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	[self swapNavigationBackgound]; 		// switch the navigation bar from translucent to what it was before.
	
}

/* Convenience method to swap the background from its previous
 * Value to translucent in this view. This method is called
 * from viewWillAppear and viewWillDisappear
 */
- (void) swapNavigationBackgound
{
	// swap all values.
	id swapPointer;
	BOOL temp;
	swapPointer = navigationBarBackgroundImage;
	navigationBarBackgroundImage = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
	[self.navigationController.navigationBar setBackgroundImage:swapPointer forBarMetrics:UIBarMetricsDefault];
	
	swapPointer = navigationBarShadowImage;
	navigationBarShadowImage = self.navigationController.navigationBar.shadowImage;
	self.navigationController.navigationBar.shadowImage = swapPointer;
	
	swapPointer = navigationBarBackgroundColor;
	navigationBarBackgroundColor = self.navigationController.view.backgroundColor;
	self.navigationController.view.backgroundColor = swapPointer;
	
	temp = navigationBarIsTranslucent;
	navigationBarIsTranslucent = self.navigationController.navigationBar.translucent;
	self.navigationController.navigationBar.translucent = navigationBarIsTranslucent;
}



@end

