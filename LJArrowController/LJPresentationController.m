//
//  LJPresentationController.m
//  LJArrowController
//
//  Created by 刘俊杰 on 16/6/14.
//  Copyright © 2016年 BJ. All rights reserved.
//

#import "LJPresentationController.h"

@interface LJPresentationController ()

@property (nonatomic, strong) UIView *chromeView;

@end

@implementation LJPresentationController

- (CGRect)frameOfPresentedViewInContainerView {
    CGRect presentedViewFrame = CGRectZero;
    CGRect containerBounds = self.containerView.bounds;
    presentedViewFrame.size = [self sizeForChildContentContainer:self.presentedViewController withParentContainerSize:containerBounds.size];
    presentedViewFrame.origin.x = containerBounds.size.width - presentedViewFrame.size.width;
    
    return presentedViewFrame;
}


- (void)presentationTransitionWillBegin {
    self.chromeView.frame = self.containerView.bounds;
    self.chromeView.alpha = 0.0;
    [self.containerView insertSubview:self.chromeView atIndex:0];
    
    id <UIViewControllerTransitionCoordinator> coordinator = self.presentedViewController.transitionCoordinator;
    if (coordinator) {
        [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            self.chromeView.alpha = 1.0f;
        } completion:nil];
    } else {
        self.chromeView.alpha = 1.0f;
    }
    
}

- (void)dismissalTransitionWillBegin {
    id <UIViewControllerTransitionCoordinator> coordinator = self.presentedViewController.transitionCoordinator;
    if (coordinator) {
        [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            self.chromeView.alpha = 0.0f;
        } completion:nil];
    } else {
        self.chromeView.alpha = 0.0f;
    }
}




- (CGSize)sizeForChildContentContainer:(id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    return CGSizeMake((floorf(parentSize.width / 3.0)), parentSize.height);
}
- (void)containerViewWillLayoutSubviews {
    self.chromeView.frame = self.containerView.bounds;
    self.presentedView.frame = [self frameOfPresentedViewInContainerView];
}
- (BOOL)shouldPresentInFullscreen {
    return YES;
}
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationFullScreen;
}

- (void)chromeViewTapped:(UIGestureRecognizer *)tap {
    if (tap.state == UIGestureRecognizerStateEnded) {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (UIView *)chromeView {
    if (!_chromeView) {
        _chromeView = [[UIView alloc] init];
        _chromeView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.4];
        _chromeView.alpha = 0.0f;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chromeViewTapped:)];
        [_chromeView addGestureRecognizer:tap];
    }
    return _chromeView;
}
@end
