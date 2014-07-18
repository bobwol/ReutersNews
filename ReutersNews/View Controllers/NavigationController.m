//
//  NavigationController.m
//  ReutersNews
//
//  Created by Barney on 7/13/14.
//  Copyright (c) 2014 pvllnspk. All rights reserved.
//

#import "NavigationController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImage+Additions.h"

@interface NavigationController ()

@end

@implementation NavigationController

-(void) viewDidLoad{
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    
    NSDictionary *_titleTextAttributes = @{UITextAttributeTextColor: [UIColor blackColor],
                                           UITextAttributeTextShadowColor : [UIColor clearColor],
                                           UITextAttributeFont : [[UIFont fontWithName:@"HelveticaNeue-Light" size:15] fontWithSize:20.0f]};
    
    [[UINavigationBar appearance] setTitleTextAttributes:_titleTextAttributes];
    [[UINavigationBar appearance]setShadowImage:[UIImage imageWithColor:[UIColor colorWithRed:0.80f green:0.80f blue:0.80f alpha:1.00f]]];
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(animated)
    {
        CABasicAnimation *stretchAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
        [stretchAnimation setToValue:[NSNumber numberWithFloat:1.04]];
        [stretchAnimation setRemovedOnCompletion:YES];
        [stretchAnimation setFillMode:kCAFillModeRemoved];
        [stretchAnimation setAutoreverses:YES];
        [stretchAnimation setDuration:0.15];
        [stretchAnimation setBeginTime:CACurrentMediaTime() + 0.3];
        [stretchAnimation setDelegate:self];
        [stretchAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [self.view.layer addAnimation:stretchAnimation forKey:@"stretchAnimation"];
        
        CATransition *transition = [CATransition animation];
        UIInterfaceOrientation interfaceOrientation = viewController.interfaceOrientation;
        NSString *subtypeTransition = kCATransitionFromRight;
        switch (interfaceOrientation)
        {
            case UIInterfaceOrientationLandscapeLeft:
                subtypeTransition = kCATransitionFromBottom;
                break;
            case UIInterfaceOrientationLandscapeRight:
                subtypeTransition = kCATransitionFromTop;
                break;
            case UIInterfaceOrientationPortraitUpsideDown:
                subtypeTransition = kCATransitionFromLeft;
                break;
            default: break;
        }
        transition.duration = 0.4f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionMoveIn;
        transition.subtype = subtypeTransition;
        transition.removedOnCompletion = YES;
        transition.fillMode = kCAFillModeRemoved;
        [self.view.layer addAnimation:transition forKey:nil];
    }
    [super pushViewController:viewController animated:NO];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
    
    if(animated)
    {
        CATransition *transition = [CATransition animation];
        transition.duration = 0.3f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = kCATransitionReveal;
        UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
        NSString *subtypeTransition = kCATransitionFromLeft;
        switch (interfaceOrientation)
        {
            case UIInterfaceOrientationLandscapeLeft:
                subtypeTransition = kCATransitionFromTop;
                break;
            case UIInterfaceOrientationLandscapeRight:
                subtypeTransition = kCATransitionFromBottom;
                break;
            case UIInterfaceOrientationPortraitUpsideDown:
                subtypeTransition = kCATransitionFromRight;
                break;
            default: break;
        }
        transition.subtype = subtypeTransition;
        transition.removedOnCompletion = YES;
        transition.fillMode = kCAFillModeRemoved;
        [self.view.layer addAnimation:transition forKey:nil];
    }
    return [super popViewControllerAnimated:NO];
}


@end
