//
//  LJAnimatedTransitioning.m
//  LJArrowController
//
//  Created by 刘俊杰 on 16/6/14.
//  Copyright © 2016年 BJ. All rights reserved.
//

#import "LJAnimatedTransitioning.h"

@implementation LJAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    UIView *containerView = transitionContext.containerView;
    
    if (self.isPresentation) {
        [containerView addSubview:toView];
    }
    
    UIViewController *animatingVC = self.isPresentation?toVC:fromVC;
    UIView *animatingView = animatingVC.view;
    
    CGRect finalFrameForVC = [transitionContext finalFrameForViewController:animatingVC];
    
    CGRect initialFrameForVC = finalFrameForVC;
    initialFrameForVC.origin.x += initialFrameForVC.size.width;
    
    CGRect initialFrame = self.isPresentation ? initialFrameForVC : finalFrameForVC;
    CGRect finalFrame = self.isPresentation ? finalFrameForVC : initialFrameForVC;
    
    animatingView.frame = initialFrame;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:300.0 initialSpringVelocity:5.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        animatingView.frame = finalFrame;
    } completion:^(BOOL finished) {
        if (!self.isPresentation) {
            [fromView removeFromSuperview];
        }
        [transitionContext completeTransition:YES];
    }];
}

@end
