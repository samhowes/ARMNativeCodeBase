#import <UIKit/UIKit.h>
#import "UnityAppController.h"
#import "UI/UnityView.h"
#import "ARMAppController.h"
//#import "ARMViewController.h"

@implementation ARMAppController

@synthesize window;

- (void)createViewHierarchyImpl;
{
	UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	UIViewController *mainVC = [storyBoard instantiateInitialViewController];
	
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.rootViewController = mainVC;
	
	_rootController = [self.window rootViewController];
	_rootView = _rootController.view;
}
@end

IMPL_APP_CONTROLLER_SUBCLASS(ARMAppController)