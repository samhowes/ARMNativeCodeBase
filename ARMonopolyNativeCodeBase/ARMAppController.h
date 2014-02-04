//
//  ARMAppController.h
//  Unity-iPhone
//
//  Created by Samuel Howes on 2/1/14.
//
//

#import <UIKit/UIKit.h>
#import "UnityAppController.h"
#import "UI/UnityView.h"
#import "ARMViewController.h"

@interface ARMAppController : UnityAppController

@property (strong, nonatomic) UIWindow *window;

- (void)createViewHierarchyImpl;

@end
