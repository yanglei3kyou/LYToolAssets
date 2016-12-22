//
//  UIViewController+LYAssets.m
//  LYToolAssetsLocal
//
//  Created by ylei on 16/6/12.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import "UIViewController+LYAssets.h"

#if TARGET_IPHONE_SIMULATOR
    #import <objc/objc-runtime.h>
#else
    #import <objc/runtime.h>
    #import <objc/message.h>
#endif

@implementation UIViewController (LYAssets)

- (void)setLy_leftCallBack:(LYNavigationItemCallBack)ly_leftCallBack {
    objc_setAssociatedObject(self, @selector(ly_leftCallBack), ly_leftCallBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (LYNavigationItemCallBack)ly_leftCallBack {
    return objc_getAssociatedObject(self, @selector(ly_leftCallBack));
}

- (void)setLy_rightCallBack:(LYNavigationItemCallBack)ly_rightCallBack {
    objc_setAssociatedObject(self, @selector(ly_rightCallBack), ly_rightCallBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (LYNavigationItemCallBack)ly_rightCallBack {
    return objc_getAssociatedObject(self, @selector(ly_rightCallBack));
}


- (void)ly_configNavigationBarDisplayTitle:(nonnull NSString *)titleString titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont {
    if (self.navigationController && self.navigationItem) {
        
        self.navigationItem.title = titleString;
        if (titleColor && titleFont) {
            [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor,NSFontAttributeName:titleFont}];
        }
        else if (titleFont) {
            [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:titleFont}];
        }
        else if (titleColor){
            [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor}];
        }
        
    }
}

- (void)ly_configNavigationBarDisplayTitle:(nonnull NSString *)titleString titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont topOffset:(CGFloat)offset {
    if (self.navigationController && self.navigationItem) {
        
        // 将导航栏 Title 向下方调整 offset
        [self.navigationController .navigationBar setTitleVerticalPositionAdjustment:offset forBarMetrics:UIBarMetricsDefault];
        
        
        self.navigationItem.title = titleString;
        if (titleColor && titleFont) {
            [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor,NSFontAttributeName:titleFont}];
        }
        else if (titleFont) {
            [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:titleFont}];
        }
        else if (titleColor){
            [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor}];
        }
        
    }
}

- (void)ly_configLeftNavigationItemWithTitle:(nonnull NSString *)titleString withCallBack:(nullable LYNavigationItemCallBack)callBack {
    if (self.navigationController) {
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:titleString style:UIBarButtonItemStyleDone target:self action:@selector(leftItemClicked:)];
        self.ly_leftCallBack = callBack;
        self.navigationItem.leftBarButtonItem = leftItem;
    }
}

- (void)ly_configLeftNavigationItemWithImageString:(nonnull NSString *)imageString withCallBack:(nullable LYNavigationItemCallBack)callBack {
    if (self.navigationController) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 51, 23.5)];
        [button setImage:[UIImage imageNamed:imageString] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(leftItemClicked:) forControlEvents:UIControlEventTouchUpInside];
        button.imageView.contentMode = UIViewContentModeScaleAspectFit;
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = leftItem;
        self.ly_leftCallBack = callBack;
        
    }
}

- (void)ly_configLeftNavigationItemWithCustomView:(nonnull UIView *)customView bounds:(CGRect)bounds toLeft:(CGFloat)toLeft withCallBack:(nullable LYNavigationItemCallBack)callBack {
    if (self.navigationController) {
        
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftItemClicked:)];
        [customView addGestureRecognizer:tapGes];
        customView.frame = bounds;
        
        
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil ];
        negativeSpacer.width = toLeft+5-20 ;//这个数值可以根据情况自由变化
        
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:customView];

        if (toLeft != 0) {
            self.navigationItem.leftBarButtonItems = @[negativeSpacer,leftItem];
        } else {
            self.navigationItem.leftBarButtonItem = leftItem;
        }

        self.ly_leftCallBack = callBack;
    }
}



- (void)leftItemClicked:(id)sender {
    if (self.ly_leftCallBack) {
        self.ly_leftCallBack();
    }
}



- (void)ly_configRightNavigationItemWithTitle:(nonnull NSString *)titleString withCallBack:(nullable LYNavigationItemCallBack)callBack {
    if (self.navigationController) {
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:titleString style:UIBarButtonItemStyleDone target:self action:@selector(rightItemClicked:)];
        self.ly_rightCallBack = callBack;
        self.navigationItem.rightBarButtonItem = rightItem;
    }
}

- (void)ly_configRightNavigationItemWithImageString:(nonnull NSString *)imageString withCallBack:(nullable LYNavigationItemCallBack)callBack {
    if (self.navigationController) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
        [button setImage:[UIImage imageNamed:imageString] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(rightItemClicked:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.rightBarButtonItem = rightItem;
        self.ly_rightCallBack = callBack;
    }
}

- (void)rightItemClicked:(id)sender {
    if (self.ly_rightCallBack) {
        self.ly_rightCallBack();
    }
}


/**
 *  push新的控制器到导航控制器
 *
 *  @param viewController 目标新的视图控制器
 */
- (void)ly_pushViewController:(nonnull UIViewController *)viewController {
    if (self.navigationController && viewController) {
        [self.navigationController pushViewController:viewController animated:YES];
    } else {
        NSLog(@"%s 当前 ViewController || NavigationController 为空",__func__);
    }
    
}

/**
 *  push新的控制器到导航控制器
 *
 *  @param viewController 目标新的视图控制器
 *  @param isHidden 是否隐藏tabbar
 */
- (void)ly_pushViewController:(nonnull UIViewController *)viewController hiddenTabBar:(BOOL)isHidden {
    if (self.navigationController && viewController) {
        viewController.hidesBottomBarWhenPushed = isHidden;
        UIBarButtonItem *backBarItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
        [self.navigationItem setBackBarButtonItem:backBarItem];
        [self.navigationController pushViewController:viewController animated:YES];
    } else {
        NSLog(@"%s 当前 ViewController || NavigationController 为空",__func__);
    }
}

/**
 *  退出至上一层界面
 */
- (void)ly_popViewController {
    if (self.navigationController && self.navigationController.viewControllers.count != 1) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


@end
