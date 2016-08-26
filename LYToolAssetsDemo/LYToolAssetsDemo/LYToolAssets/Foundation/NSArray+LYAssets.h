//
//  NSArray+LYAssets.h
//  LYToolAssetsLocal
//
//  Created by ylei on 16/6/12.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface NSArray (LYAssets)
/**
 *  数组合法性(存在且非空)
 *
 *  @return 合法结果
 */
- (BOOL)ly_isValid;


#pragma mark - 取值
/**
 *  获取数组的第一个元素
 *
 *  @return 取得的元素
 */
- (id)ly_firstObject;

/**
 *  随机取数组里的一个元素
 *
 *  @return 随机取得的元素
 */
- (id)ly_randomObject;


#pragma mark - 排序
/**
 *  重组数组(打乱顺序)
 *
 *  @return 重组之后的数组
 */
- (NSArray *)ly_shuffledArray;

/**
 *  数组倒序
 *
 *  @return 将数组倒序后得到的数组
 */
- (NSArray *)ly_reversedArray;

/**
 *  数组去除相同的元素，并获得新的array
 *
 *  @return 去除相同元素后的array
 */
- (NSArray *)ly_uniqueArray;

/**
 *  根据关键词 对array的内容进行排序，并返回排序后的array
 *
 *  @param parameters 数组对象的KeyPath
 *  @param ascending  YES 升序 NO 降序
 *
 *  @return 经过排序后的数组
 */
- (NSArray *)ly_arraySorting:(NSString *)parameters ascending:(BOOL)ascending;


#pragma mark - 安全操作
/**
 *  获取下标为index的对象
 *
 *  @param index 下标
 *
 *  @return 获得的对象
 */
- (id)ly_objectAtIndex:(NSUInteger)index;

/**
 *  获取下标为index的字符串，不存在返回空，能转为string的转，不能的返回nil
 *
 *  @param index 下标
 *
 *  @return 获得的字符串
 */
- (NSString *)ly_stringAtIndex:(NSUInteger)index;

/**
 *  获取下标为index的number，不存在返回空，能转为number的转，不能的返回nil
 *
 *  @param index 下标
 *
 *  @return 获得的number
 */
- (NSNumber *)ly_numberAtIndex:(NSUInteger)index;

/**
 *  获取下标为index的array，不存返回nil
 *
 *  @param index 下标
 *
 *  @return 获得的array
 */
- (NSArray *)ly_arrayAtIndex:(NSUInteger)index;

/**
 *  获取下标为index的Dictionary，不存返回nil
 *
 *  @param index 下标
 *
 *  @return 获得的Dictionary
 */
- (NSDictionary *)ly_dictionaryAtIndex:(NSUInteger)index;

/**
 *  获取下标为index的integer，不存返回0
 *
 *  @param index 下标
 *
 *  @return 获得的integer
 */
- (NSInteger)ly_integerAtIndex:(NSUInteger)index;

/**
 *  获取下标为index的unsignedInteger，不存返回0
 *
 *  @param index 下标
 *
 *  @return 获得的unsignedInteger
 */
- (NSUInteger)ly_unsignedIntegerAtIndex:(NSUInteger)index;

/**
 *  获取下标为index的bool，不存返回NO
 *
 *  @param index 下标
 *
 *  @return 获得的bool
 */
- (BOOL)ly_boolAtIndex:(NSUInteger)index;

/**
 *  获取下标为index的int16，不存返回0
 *
 *  @param index 下标
 *
 *  @return 获得的int16
 */
- (int16_t)ly_int16AtIndex:(NSUInteger)index;

/**
 *  获取下标为index的int32，不存返回0
 *
 *  @param index 下标
 *
 *  @return 获得的int32
 */
- (int32_t)ly_int32AtIndex:(NSUInteger)index;

/**
 *  获取下标为index的int64，不存返回0
 *
 *  @param index 下标
 *
 *  @return 获得的int64
 */
- (int64_t)ly_int64AtIndex:(NSUInteger)index;

/**
 *  获取下标为index的charValue，不存返回0
 *
 *  @param index 下标
 *
 *  @return 获得的charValue
 */
- (char)ly_charAtIndex:(NSUInteger)index;

/**
 *  获取下标为index的intValue，不存返回0
 *
 *  @param index 下标
 *
 *  @return 获得的intValue
 */
- (short)ly_shortAtIndex:(NSUInteger)index;

/**
 *  获取下标为index的floatValue，不存返回0
 *
 *  @param index 下标
 *
 *  @return 获得的floatValue
 */
- (float)ly_floatAtIndex:(NSUInteger)index;

/**
 *  获取下标为index的doubleValue，不存返回0
 *
 *  @param index 下标
 *
 *  @return 获得的doubleValue
 */
- (double)ly_doubleAtIndex:(NSUInteger)index;

/**
 *  获取下标为index的CGFloat
 *
 *  @param index 下标
 *
 *  @return 获得的CGFloat
 */
- (CGFloat)ly_CGFloatAtIndex:(NSUInteger)index;

/**
 *  获取下标为index的point
 *
 *  @param index 下标
 *
 *  @return 获得的point
 */
- (CGPoint)ly_pointAtIndex:(NSUInteger)index;

/**
 *  获取下标为index的size
 *
 *  @param index 下标
 *
 *  @return 获得的size
 */
- (CGSize)ly_sizeAtIndex:(NSUInteger)index;

/**
 *  获取下标为index的rect
 *
 *  @param index 下标
 *
 *  @return 获得的rect
 */
- (CGRect)ly_rectAtIndex:(NSUInteger)index;


@end
