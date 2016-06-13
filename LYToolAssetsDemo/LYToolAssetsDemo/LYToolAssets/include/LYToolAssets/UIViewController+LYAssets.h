//
//  UIViewController+LYAssets.h
//  LYToolAssetsLocal
//
//  Created by ylei on 16/6/12.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LYNavigationItemCallBack)();

@interface UIViewController (LYAssets)

@property (nonatomic, copy, nullable) LYNavigationItemCallBack ly_leftCallBack;
@property (nonatomic, copy, nullable) LYNavigationItemCallBack ly_rightCallBack;

- (void)ly_configNavigationBarDisplayTitle:(nonnull NSString *)titleString;

- (void)ly_configLeftNavigationItemWithTitle:(nonnull NSString *)titleString withCallBack:(nullable LYNavigationItemCallBack)callBack;
- (void)ly_configLeftNavigationItemWithImageString:(nonnull NSString *)imageString withCallBack:(nullable LYNavigationItemCallBack)callBack;

- (void)ly_configRightNavigationItemWithTitle:(nonnull NSString *)titleString withCallBack:(nullable LYNavigationItemCallBack)callBack;
- (void)ly_configRightNavigationItemWithImageString:(nonnull NSString *)imageString withCallBack:(nullable LYNavigationItemCallBack)callBack;


/**
 *  push新的控制器到导航控制器
 *
 *  @param viewController 目标新的视图控制器
 */
- (void)ly_pushViewController:(nonnull UIViewController *)viewController;

/**
 *  push新的控制器到导航控制器
 *
 *  @param viewController 目标新的视图控制器
 *  @param isHidden 是否隐藏tabbar
 */
- (void)ly_pushViewController:(nonnull UIViewController *)viewController hiddenTabBar:(BOOL)isHidden;

/**
 *  退出至上一层界面
 */
- (void)ly_popViewController;

@end
