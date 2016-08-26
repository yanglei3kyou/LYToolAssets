//
//  NSMutableArray+LYAssets.m
//  LYToolAssetsLocal
//
//  Created by ylei on 16/8/23.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import "NSMutableArray+LYAssets.h"

@implementation NSMutableArray (LYAssets)

#pragma mark - 增加或删除对象
/**
 *  插入一个元素到指定位置
 *
 *  @param anObject 需要插入的元素
 *  @param index  位置
 */
- (void)ly_insertObject:(id)anObject atIndexIfNotNil:(NSUInteger)index {
    if (anObject && index < self.count) {
        [self insertObject:anObject atIndex:index];
    }
}

/**
 *  移动对象 从一个位置到另一个位置
 *
 *  @param index   原位置
 *  @param toIndex 目标位置
 */
- (void)ly_moveObjectAtIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex {
    if (index < self.count && toIndex < self.count) {
        id object = [self objectAtIndex:index];
        if (index > toIndex) {
            [self removeObjectAtIndex:index];
            [self insertObject:object atIndex:toIndex];
        } else if (index < toIndex){
            [self removeObjectAtIndex:index];
            [self insertObject:object atIndex:toIndex - 1];
        }
    }
}

/**
 *  移除首个对象
 */
- (void)ly_removeFirstObject {
    if (self.count > 0) {
        [self removeObjectAtIndex:0];
    }
}

#pragma mark - 排序
/**
 *  重组数组(打乱顺序)
 *
 */
- (void)ly_shuffle {
    NSMutableArray *copy = [self mutableCopy];
    [self removeAllObjects];
    while ([copy count] > 0) {
        int index = arc4random() % [copy count];
        id objectToMove = [copy objectAtIndex:index];
        [self addObject:objectToMove];
        [copy removeObjectAtIndex:index];
    }
}

/**
 *  数组倒序
 *
 */
- (void)ly_reverse {
    NSArray *reversedArray = [[self reverseObjectEnumerator] allObjects];
    [self removeAllObjects];
    [self addObjectsFromArray:reversedArray];
}

/**
 *  数组去除相同的元素
 */
- (void)ly_unique {
    NSSet *set = [NSSet setWithArray:self];
    NSArray *array = [[NSArray alloc] initWithArray:[set allObjects]];
    [self removeAllObjects];
    [self addObjectsFromArray:array];}

/**
 *  根据关键词 对本数组的内容进行排序
 *
 *  @param parameters 对象中的KeyPath
 *  @param ascending  YES 升序 NO 降序
 *
 */
- (void)ly_sorting:(NSString *)parameters ascending:(BOOL)ascending {
    NSSortDescriptor *sorter = [[NSSortDescriptor alloc] initWithKey:parameters ascending:ascending];
    NSMutableArray *sortDescriptors = [[NSMutableArray alloc] initWithObjects:&sorter count:1];
    NSArray *sortArray = [self sortedArrayUsingDescriptors:sortDescriptors];
    [self removeAllObjects];
    [self addObjectsFromArray:sortArray];
}

#pragma - mark 安全操作
/**
 *  添加新对象
 *
 *  @param anObject 添加的对象
 */
- (void)ly_addObject:(id)anObject {
    if (anObject) {
        [self addObject:anObject];
    }
}

/**
 *  添加字符串
 *
 *  @param aString 添加的字符串
 */
- (void)ly_addString:(NSString *)aString {
    if (aString) {
        [self addObject:aString];
    }
}

/**
 *  添加Bool
 *
 *  @param aBool 添加的Bool
 */
- (void)ly_addBool:(BOOL)aBool {
    [self addObject:@(aBool)];
}

/**
 *  添加Int
 *
 *  @param anInt 添加的Int
 */
- (void)ly_addInt:(int)anInt {
    [self addObject:@(anInt)];
}

/**
 *  添加Integer
 *
 *  @param anInteger 添加的Integer
 */
- (void)ly_addInteger:(NSInteger)anInteger {
    [self addObject:@(anInteger)];
}

/**
 *  添加UnsignedInteger
 *
 *  @param anUInteger 添加的UnsignedInteger
 */
- (void)ly_addUnsignedInteger:(NSUInteger)anUInteger {
    [self addObject:@(anUInteger)];
}

/**
 *  添加CGFloat
 *
 *  @param aCGFloat 添加的CGFloat
 */
- (void)ly_addCGFloat:(CGFloat)aCGFloat {
    [self addObject:@(aCGFloat)];
}

/**
 *  添加Char
 *
 *  @param aChar 添加的Char
 */
- (void)ly_addChar:(char)aChar {
    [self addObject:@(aChar)];
}

/**
 *  添加Float
 *
 *  @param aFloat 添加的Float
 */
- (void)ly_addFloat:(float)aFloat {
    [self addObject:@(aFloat)];
}

/**
 *  添加Point
 *
 *  @param aCGPoint 添加的Point
 */
- (void)ly_addCGPoint:(CGPoint)aCGPoint {
    [self addObject:NSStringFromCGPoint(aCGPoint)];
}

/**
 *  添加Size
 *
 *  @param aCGSize 添加的Size
 */
- (void)ly_addCGSize:(CGSize)aCGSize {
    [self addObject:NSStringFromCGSize(aCGSize)];
}

/**
 *  添加Rect
 *
 *  @param aCGRect 添加的Rect
 */
- (void)ly_addCGRect:(CGRect)aCGRect {
    [self addObject:NSStringFromCGRect(aCGRect)];
}

@end
