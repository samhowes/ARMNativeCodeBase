#import "UnityAppController.h"
#import "ARMViewController.h"
#import "iPhone_View.h"


@implementation ARMViewController

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
	
	[self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
	self.navigationController.navigationBar.shadowImage = [UIImage new];
	self.navigationController.view.backgroundColor = [UIColor clearColor];
	self.navigationController.navigationBar.translucent = YES;
}


@end

