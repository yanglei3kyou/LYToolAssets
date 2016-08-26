//
//  LYNavigationController.m
//  LYToolAssetsLocal
//
//  Created by ylei on 16/8/17.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import "LYNavigationController.h"
#import <objc/runtime.h>

@interface LYNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, strong) id popGestureDelegate;

@end

@implementation LYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.popGestureDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
    
    id _target = [self.interactivePopGestureRecognizer valueForKeyPath:@"_targets"];
    id temp = [_target[0] valueForKey:@"target"];
    
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wundeclared-selector"
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:temp action:@selector(handleNavigationTransition:)];
    #pragma clang diagnostic pop

    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([self.topViewController isEqual:self.viewControllers[0]]) {
        self.interactivePopGestureRecognizer.delegate = self.popGestureDelegate;
    } else {
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([self.topViewController isEqual:self.viewControllers[0]]) {
        return NO;
    } else {
        return YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
