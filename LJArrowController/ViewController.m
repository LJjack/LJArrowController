//
//  ViewController.m
//  text11
//
//  Created by 刘俊杰 on 16/4/29.
//  Copyright © 2016年 刘俊杰. All rights reserved.
//

#import "ViewController.h"
#import "LJTransitioningDelegate.h"
#import "PopoverViewController.h"
@interface ViewController ()<UIPopoverPresentationControllerDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"1234" style:UIBarButtonItemStylePlain target:self action:@selector(clickLeftBtn:)];
}

- (void)clickLeftBtn:(UIBarButtonItem *)sender {
    PopoverViewController *pop = [[PopoverViewController alloc] init];
    
    pop.modalPresentationStyle = UIModalPresentationPopover;
    pop.preferredContentSize = CGSizeMake(200, 200);
    UIPopoverPresentationController *popover = pop.popoverPresentationController;
    popover.delegate = self;
    popover.barButtonItem = sender;
    popover.backgroundColor = [UIColor redColor];
    [self presentViewController:pop animated:YES completion:nil];
    
}
- (IBAction)clickBtn:(UIButton *)sender {
    LJTransitioningDelegate *LJTransitionDelegate = [[LJTransitioningDelegate alloc] init];
    PopoverViewController *pop = [[PopoverViewController alloc] init];
    pop.modalPresentationStyle = UIModalPresentationCustom;
    self.transitioningDelegate = LJTransitionDelegate;
    pop.transitioningDelegate = LJTransitionDelegate;
    [self presentViewController:pop animated:YES completion:nil];
    
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}
@end
