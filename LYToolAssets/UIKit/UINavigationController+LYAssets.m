//
//  UINavigationController+LYAssets.m
//  CAXA-KanTu
//
//  Created by ylei on 2016/12/20.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import "UINavigationController+LYAssets.h"

@implementation UINavigationController (LYAssets)
- (UIViewController *)rootViewController {
    if (self.viewControllers && self.viewControllers.count > 0) {
        return [self.viewControllers objectAtIndex:0];
    }
    return nil;
}

@end
