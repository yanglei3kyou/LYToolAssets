//
//  NSMutableArray+LYAssets.h
//  LYToolAssetsLocal
//
//  Created by ylei on 16/8/23.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface NSMutableArray (LYAssets)

#pragma mark - 增加或删除对象
/**
 *  插入一个元素到指定位置
 *
 *  @param anObject 需要插入的元素
 *  @param index  位置
 */
- (void)ly_insertObject:(id)anObject atIndexIfNotNil:(NSUInteger)index;

/**
 *  移动对象 从一个位置到另一个位置
 *
 *  @param index   原位置
 *  @param toIndex 目标位置
 */
- (void)ly_moveObjectAtIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex;

/**
 *  移除首个对象
 */
- (void)ly_removeFirstObject;


#pragma mark - 排序
/**
 *  重组数组(打乱顺序)
 *
 */
- (void)ly_shuffle;

/**
 *  数组倒序
 *
 */
- (void)ly_reverse;

/**
 *  数组去除相同的元素
 */
- (void)ly_unique;

/**
 *  根据关键词 对本数组的内容进行排序
 *
 *  @param parameters 对象中的KeyPath
 *  @param ascending  YES 升序 NO 降序
 *
 */
- (void)ly_sorting:(NSString *)parameters ascending:(BOOL)ascending;


#pragma - mark 安全操作
/**
 *  添加新对象
 *
 *  @param anObject 添加的对象
 */
- (void)ly_addObject:(id)anObject;

/**
 *  添加字符串
 *
 *  @param aString 添加的字符串
 */
- (void)ly_addString:(NSString *)aString;

/**
 *  添加Bool
 *
 *  @param aBool 添加的Bool
 */
- (void)ly_addBool:(BOOL)aBool;

/**
 *  添加Int
 *
 *  @param anInt 添加的Int
 */
- (void)ly_addInt:(int)anInt;

/**
 *  添加Integer
 *
 *  @param anInteger 添加的Integer
 */
- (void)ly_addInteger:(NSInteger)anInteger;

/**
 *  添加UnsignedInteger
 *
 *  @param anUInteger 添加的UnsignedInteger
 */
- (void)ly_addUnsignedInteger:(NSUInteger)anUInteger;

/**
 *  添加CGFloat
 *
 *  @param aCGFloat 添加的CGFloat
 */
- (void)ly_addCGFloat:(CGFloat)aCGFloat;

/**
 *  添加Char
 *
 *  @param aChar 添加的Char
 */
- (void)ly_addChar:(char)aChar;

/**
 *  添加Float
 *
 *  @param aFloat 添加的Float
 */
- (void)ly_addFloat:(float)aFloat;

/**
 *  添加Point
 *
 *  @param aCGPoint 添加的Point
 */
- (void)ly_addCGPoint:(CGPoint)aCGPoint;

/**
 *  添加Size
 *
 *  @param aCGSize 添加的Size
 */
- (void)ly_addCGSize:(CGSize)aCGSize;

/**
 *  添加Rect
 *
 *  @param aCGRect 添加的Rect
 */
- (void)ly_addCGRect:(CGRect)aCGRect;

@end
