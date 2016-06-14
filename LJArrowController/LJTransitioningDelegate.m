//
//  LJTransitioningDelegate.m
//  LJArrowController
//
//  Created by 刘俊杰 on 16/6/14.
//  Copyright © 2016年 BJ. All rights reserved.
//

#import "LJTransitioningDelegate.h"
#import "LJPresentationController.h"
#import "LJAnimatedTransitioning.h"

@implementation LJTransitioningDelegate

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return [[LJPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    LJAnimatedTransitioning *animationController = [[LJAnimatedTransitioning alloc] init];
    animationController.isPresentation = YES;
    return animationController;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    LJAnimatedTransitioning *animationController = [[LJAnimatedTransitioning alloc] init];
    animationController.isPresentation = YES;
    return animationController;
}

@end
