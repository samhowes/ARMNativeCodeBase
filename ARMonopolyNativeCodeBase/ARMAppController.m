#import <UIKit/UIKit.h>
#import "UnityAppController.h"
#import "UI/UnityView.h"
#import "ARMAppController.h"
#import "ARMViewController.h"

@implementation ARMAppController

@synthesize window;

- (void)createViewHierarchyImpl;
{
	/* Manually load the storyboard file
	 * Instantiate a window, root view controller, and it's root view
	 */
	UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	UIViewController *mainVC = [storyBoard instantiateInitialViewController];
	
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.rootViewController = mainVC;
	
	for (UIViewController*vc in [(UINavigationController *)mainVC viewControllers])
	{
		if ([vc isKindOfClass: [ARMViewController class]])
		{
			[vc.view addSubview:_unityView];
			[vc.view sendSubviewToBack:_unityView];
			break;
		}
	}
	
	_rootController = [self.window rootViewController];
	_rootView = _rootController.view;
}

- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder
{
	return YES;
}

- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder
{
	return YES;
}

@end

// Tell unity to replace the AppController with this class
IMPL_APP_CONTROLLER_SUBCLASS(ARMAppController)
