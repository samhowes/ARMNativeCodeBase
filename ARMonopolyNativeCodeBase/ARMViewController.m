#import "UnityAppController.h"
#import "ARMViewController.h"
#import "iPhone_View.h"


@implementation ARMViewController

- (void) viewDidLoad
{
	[super viewDidLoad];
	
	UnityAppController *appDelegate = (UnityAppController *)
									[[UIApplication sharedApplication] delegate];
	self.view = (UIView *)appDelegate.unityView;
}

@end

