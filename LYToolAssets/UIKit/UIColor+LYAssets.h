//
//  UIColor+LYAssets.h
//  CAXA-KanTu
//
//  Created by ylei on 2016/11/25.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LYAssets)
/**
 16进制字符串 转换颜色

 @param stringToConvert 16进制颜色字符串
 @return 颜色
 */
+ (UIColor *)ly_colorWithHexString:(NSString *)stringToConvert;


/**
 16进制字符串 转换颜色

 @param stringToConvert 16进制颜色字符串
 @param alpha 透明度
 @return 颜色
 */
+ (UIColor *)ly_colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha;


/**
 以16进制字符串的形式输出当前颜色

 @param color 颜色
 @return 16进制字符串
 */
+ (NSString *)ly_stringFromColor:(UIColor *)color;


/**
 随机生成颜色

 @return 颜色
 */
+ (UIColor *)ly_randomColor;


@end
