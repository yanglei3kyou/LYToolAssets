//
//  LYMacrosHeaders.h
//  LYToolAssetsLocal
//
//  Created by ylei on 16/6/12.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#ifndef LYMacrosHeaders_h
#define LYMacrosHeaders_h

#pragma mark - Block 对象修改
#define LYWeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;
#define LYStrongObj(o) autoreleasepool{} __strong typeof(o) o = o##Weak;

#pragma mark - AppDelegate 别称
#define SharedApp ((AppDelegate*)[[UIApplication sharedApplication] delegate])

#define ImageCreateWithName(a) [UIImage imageNamed:a]

#pragma mark - LLog 自定制输出语句
#ifdef DEBUG
    #define LLog(fmt, ...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
    #define LLog(fmt, ...)
#endif

#pragma mark - Color 输出
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define HEXCOLOR(hex)       [UIColor ly_colorWithHexString:hex]
#define HEXACOLOR(hex,a)       [UIColor ly_colorWithHexString:hex alpha:a]

#pragma mark - Font 输入
#define SystemFont(a)           [UIFont systemFontOfSize:a]
#define SystemWFont(a,b)        [UIFont systemFontOfSize:a weight:b]
#define BlodFont(a)             [UIFont boldSystemFontOfSize:a]


#pragma mark - Size 屏幕尺寸
#define LYDeviceScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define LYDeviceScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)
#define LYDeviceScreenStatusBarHeight 20.0f
#define LYDeviceScreenNavigationBarHeight 44.0f
#define LYDeviceScreenTabBarHeight 49.0f

#endif /* LYMacrosHeaders_h */

