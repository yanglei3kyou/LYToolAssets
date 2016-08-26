//
//  NSMutableString+LYAssets.h
//  LYToolAssetsLocal
//
//  Created by ylei on 16/8/26.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableString (LYAssets)

/**
 *  用指定字符串替换占位的字符串，修改原值
 *
 *  @param target      原先字符串
 *  @param replacement 替换字符串
 */
- (void)ly_stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement;

/**
 *  用指定字符串替换占位的字符串，修改原值
 *
 *  @param target      原先字符串
 *  @param replacement 替换字符串
 *  @param options     查找规则
 *  @param searchRange 查找范围
 */
- (void)ly_stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange;

/**
 *  字符串中去除空格
 */
- (void)ly_removeSpace;

/**
 *  将字符串正常化(去除Nil、Null)
 */
- (void)ly_removeNilAndNull;


@end
