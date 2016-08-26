//
//  NSMutableString+LYAssets.m
//  LYToolAssetsLocal
//
//  Created by ylei on 16/8/26.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import "NSMutableString+LYAssets.h"

@implementation NSMutableString (LYAssets)

/**
 *  用指定字符串替换占位的字符串，修改原值
 *
 *  @param target      原先字符串
 *  @param replacement 替换字符串
 */
- (void)ly_stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement {
    [self setString:[self stringByReplacingOccurrencesOfString:target withString:replacement]];
}

/**
 *  用指定字符串替换占位的字符串，修改原值
 *
 *  @param target      原先字符串
 *  @param replacement 替换字符串
 *  @param options     查找规则
 *  @param searchRange 查找范围
 */
- (void)ly_stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange {
    [self setString:[self stringByReplacingOccurrencesOfString:target withString:replacement options:options range:searchRange]];
}

/**
 *  字符串中去除空格
 */
- (void)ly_removeSpace {
    [self ly_stringByReplacingOccurrencesOfString:@" " withString:@""];
}

/**
 *  将字符串正常化(去除Nil、Null)
 */
- (void)ly_removeNilAndNull {
    if (!(self && ![self isKindOfClass:[NSNull class]]&& self.length != 0 && ![self isEqualToString:@"<null>"])) {
        [self setString:@""];
    }
}


@end
