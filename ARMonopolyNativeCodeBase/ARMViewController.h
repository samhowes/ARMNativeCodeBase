#import <UIKit/UIKit.h>
#import "iPhone_View.h"

@interface ARMViewController : UnityDefaultViewController

// I'm using the "arm" prefix here to make sure that I don't
// conflict with any unity names.
@property (strong, nonatomic) IBOutlet UIView *armUnitySubView;

@end

