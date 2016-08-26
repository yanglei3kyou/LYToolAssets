//
//  NSDictionary+LYAssets.h
//  LYToolAssetsLocal
//
//  Created by ylei on 16/8/23.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface NSDictionary (LYAssets)

#pragma mark - 安全操作
/**
 *  判断字典对于给定Key是否有内容
 *
 *  @param aKey 给定的Key
 *
 *  @return YES 存在 NO 不存在
 */
- (BOOL)ly_hasKey:(NSString *)aKey;

/**
 *  获取字符串
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的字符串
 */
- (NSString *)ly_stringForKey:(id)aKey;

/**
 *  获取number
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的number
 */
- (NSNumber *)ly_numberForKey:(id)aKey;

/**
 *  获取array
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的array
 */
- (NSArray *)ly_arrayForKey:(id)aKey;

/**
 *  获取dictionary
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的dictionary
 */
- (NSDictionary *)ly_dictionaryForKey:(id)aKey;

/**
 *  获取integer
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的integer
 */
- (NSInteger)ly_integerForKey:(id)aKey;

/**
 *  获取unsignedInteger
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的unsignedInteger
 */
- (NSUInteger)ly_unsignedIntegerForKey:(id)aKey;

/**
 *  获取bool
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的bool
 */
- (BOOL)ly_boolForKey:(id)aKey;

/**
 *  获取字典Key对应的Bool值
 *
 *  @param aKey         Key值
 *  @param defaultValue 默认返回值
 *
 *  @return 返回值
 */
- (BOOL)ly_boolForKey:(id)aKey defaultValue:(BOOL)defaultValue;

/**
 *  获取int16
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的int16
 */
- (int16_t)ly_int16ForKey:(id)aKey;

/**
 *  获取int32
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的int32
 */
- (int32_t)ly_int32ForKey:(id)aKey;

/**
 *  获取int64
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的int64
 */
- (int64_t)ly_int64ForKey:(id)aKey;

/**
 *  获取char
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的char
 */
- (char)ly_charForKey:(id)aKey;

/**
 *  获取short
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的short
 */
- (short)ly_shortForKey:(id)aKey;

/**
 *  获取float
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的float
 */
- (float)ly_floatForKey:(id)aKey;

/**
 *  获取double
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的double
 */
- (double)ly_doubleForKey:(id)aKey;

/**
 *  获取longLong
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的longLong
 */
- (long long)ly_longLongForKey:(id)aKey;

/**
 *  获取unsignedLongLong
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的unsignedLongLong
 */
- (unsigned long long)ly_unsignedLongLongForKey:(id)aKey;

/**
 *  获取CGFloat
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的CGFloat
 */
- (CGFloat)ly_CGFloatForKey:(id)aKey;

/**
 *  获取point
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的point
 */
- (CGPoint)ly_pointForKey:(id)aKey;

/**
 *  获取size
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的size
 */
- (CGSize)ly_sizeForKey:(id)aKey;

/**
 *  获取rect
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的rect
 */
- (CGRect)ly_rectForKey:(id)aKey;


#pragma mark - 合并
/**
 *  合并两个字典
 *
 *  @param aDictionary 第一个字典
 *  @param otherDictionary 第二个字典
 *
 *  @return 合并之后得到的字典
 */
+ (NSDictionary *)ly_dictionaryByMerging:(NSDictionary *)aDictionary with:(NSDictionary *)otherDictionary;

/**
 *  与另一个字典合并
 *
 *  @param otherDictionary 将要合并过来的字典
 *
 *  @return 合并后的字典
 */
- (NSDictionary *)ly_dictionaryByMergingWith:(NSDictionary *)otherDictionary;


#pragma mark - JSON
/**
 *  将字典转换成JSON字串符
 *
 *  @return JSON字符串
 */
- (NSString *)ly_JSONString;

@end
