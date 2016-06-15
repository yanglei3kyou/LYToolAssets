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

/**
 *  设置NavigationBar Title
 *
 *  @param titleString Title字符串
 */
- (void)ly_configNavigationBarDisplayTitle:(nonnull NSString *)titleString;

/**
 *  设置导航栏左侧按钮相关信息
 *
 *  @param titleString 左侧按钮标题
 *  @param callBack    事件回调
 */
- (void)ly_configLeftNavigationItemWithTitle:(nonnull NSString *)titleString withCallBack:(nullable LYNavigationItemCallBack)callBack;

/**
 *  设置导航栏左侧按钮相关信息
 *
 *  @param imageString 左侧按钮图片名称
 *  @param callBack    事件回调
 */
- (void)ly_configLeftNavigationItemWithImageString:(nonnull NSString *)imageString withCallBack:(nullable LYNavigationItemCallBack)callBack;

/**
 *  设置导航栏右侧按钮相关信息
 *
 *  @param titleString 右侧按钮标题
 *  @param callBack    事件回调
 */
- (void)ly_configRightNavigationItemWithTitle:(nonnull NSString *)titleString withCallBack:(nullable LYNavigationItemCallBack)callBack;

/**
 *  设置导航栏右侧按钮相关信息
 *
 *  @param imageString 右侧按钮图片名称
 *  @param callBack    事件回调
 */
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
