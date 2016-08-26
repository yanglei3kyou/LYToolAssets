//
//  NSArray+LYAssets.m
//  LYToolAssetsLocal
//
//  Created by ylei on 16/6/12.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import "NSArray+LYAssets.h"

@implementation NSArray (LYAssets)
/**
 *  数组合法性(存在且非空)
 *
 *  @return 合法结果
 */
- (BOOL)ly_isValid {
    BOOL isValid = NO;
    if (self && self.count != 0) {
        isValid = YES;
    }
    return isValid;
}

#pragma mark - 取值
/**
 *  获取数组的第一个元素
 *
 *  @return 取得的元素
 */
- (id)ly_firstObject {
    if ([self count] > 0) {
        return [self objectAtIndex:0];
    } else {
        return nil;
    }
}

/**
 *  随机取数组里的一个元素
 *
 *  @return 随机取得的元素
 */
- (id)ly_randomObject {
    if ([self count] > 0) {
        int index = arc4random() % [self count];
        id object = [self objectAtIndex:index];
        return object;
    } else {
        return nil;
    }
}

#pragma mark - 排序
/**
 *  重组数组(打乱顺序)
 *
 *  @return 重组之后的数组
 */
- (NSArray *)ly_shuffledArray {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSMutableArray *copy = [self mutableCopy];
    while ([copy count] > 0)
    {
        int index = arc4random() % [copy count];
        id objectToMove = [copy objectAtIndex:index];
        [array addObject:objectToMove];
        [copy removeObjectAtIndex:index];
    }
    return array;
}

/**
 *  数组倒序
 *
 *  @return 将数组倒序后得到的数组
 */
- (NSArray *)ly_reversedArray {
    NSArray *reversedArray = [[self reverseObjectEnumerator] allObjects];
    return reversedArray;
}

/**
 *  数组去除相同的元素，并获得新的array
 *
 *  @return 去除相同元素后的array
 */
- (NSArray *)ly_uniqueArray {
    NSSet *set = [NSSet setWithArray:self];
    NSArray *array = [[NSArray alloc] initWithArray:[set allObjects]];
    return array;
}

/**
 *  根据关键词 对array的内容进行排序，并返回排序后的array
 *
 *  @param parameters 数组对象的KeyPath
 *  @param ascending  YES 升序 NO 降序
 *
 *  @return 经过排序后的数组
 */
- (NSArray *)ly_arraySorting:(NSString *)parameters ascending:(BOOL)ascending {
    NSSortDescriptor *sorter = [[NSSortDescriptor alloc] initWithKey:parameters ascending:ascending];
    NSMutableArray *sortDescriptors = [[NSMutableArray alloc] initWithObjects:&sorter count:1];
    NSArray *sortArray = [self sortedArrayUsingDescriptors:sortDescriptors];
    return sortArray;
}

#pragma mark - 安全操作
/**
 *  获取下标为index的对象
 *
 *  @param index 下标
 *
 *  @return 获得的对象
 */
- (id)ly_objectAtIndex:(NSUInteger)index {
    if (index < self.count) {
        return self[index];
    } else {
        return nil;
    }
}

/**
 *  获取下标为index的字符串，不存在返回空，能转为string的转，不能的返回nil
 *
 *  @param index 下标
 *
 *  @return 获得的字符串
 */
- (NSString *)ly_stringAtIndex:(NSUInteger)index {
    id value = [self ly_objectAtIndex:index];
    if (value == nil || value == [NSNull null]) {
        return @"";
    }
    if ([value isKindOfClass:[NSString class]]) {
        return (NSString *)value;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value stringValue];
    }
    
    return nil;
}

/**
 *  获取下标为index的number，不存在返回空，能转为number的转，不能的返回nil
 *
 *  @param index 下标
 *
 *  @return 获得的number
 */
- (NSNumber *)ly_numberAtIndex:(NSUInteger)index {
    id value = [self ly_objectAtIndex:index];
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)value;
    }
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        return [f numberFromString:(NSString *)value];
    }
    return nil;
}

/**
 *  获取下标为index的array，不存返回nil
 *
 *  @param index 下标
 *
 *  @return 获得的array
 */
- (NSArray *)ly_arrayAtIndex:(NSUInteger)index {
    id value = [self ly_objectAtIndex:index];
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    if ([value isKindOfClass:[NSArray class]]) {
        return value;
    }
    return nil;
}

/**
 *  获取下标为index的Dictionary，不存返回nil
 *
 *  @param index 下标
 *
 *  @return 获得的Dictionary
 */
- (NSDictionary *)ly_dictionaryAtIndex:(NSUInteger)index {
    id value = [self ly_objectAtIndex:index];
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    if ([value isKindOfClass:[NSDictionary class]]) {
        return value;
    }
    return nil;
}

/**
 *  获取下标为index的integer，不存返回0
 *
 *  @param index 下标
 *
 *  @return 获得的integer
 */
- (NSInteger)ly_integerAtIndex:(NSUInteger)index {
    id value = [self ly_objectAtIndex:index];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value integerValue];
    }
    return 0;
}

/**
 *  获取下标为index的unsignedInteger，不存返回0
 *
 *  @param index 下标
 *
 *  @return 获得的unsignedInteger
 */
- (NSUInteger)ly_unsignedIntegerAtIndex:(NSUInteger)index {
    id value = [self ly_objectAtIndex:index];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value unsignedIntegerValue];
    }
    return 0;
}

/**
 *  获取下标为index的bool，不存返回NO
 *
 *  @param index 下标
 *
 *  @return 获得的bool
 */
- (BOOL)ly_boolAtIndex:(NSUInteger)index {
    id value = [self ly_objectAtIndex:index];
    
    if (value == nil || value == [NSNull null]) {
        return NO;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value boolValue];
    }
    if ([value isKindOfClass:[NSString class]]) {
        return [value boolValue];
    }
    return NO;
}

/**
 *  获取下标为index的int16，不存返回0
 *
 *  @param index 下标
 *
 *  @return 获得的int16
 */
- (int16_t)ly_int16AtIndex:(NSUInteger)index {
    id value = [self ly_objectAtIndex:index];
    
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]]) {
        return [value intValue];
    }
    return 0;
}

/**
 *  获取下标为index的int32，不存返回0
 *
 *  @param index 下标
 *
 *  @return 获得的int32
 */
- (int32_t)ly_int32AtIndex:(NSUInteger)index {
    id value = [self ly_objectAtIndex:index];
    
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value intValue];
    }
    return 0;
}

/**
 *  获取下标为index的int64，不存返回0
 *
 *  @param index 下标
 *
 *  @return 获得的int64
 */
- (int64_t)ly_int64AtIndex:(NSUInteger)index {
    id value = [self ly_objectAtIndex:index];
    
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value longLongValue];
    }
    return 0;
}

/**
 *  获取下标为index的charValue，不存返回0
 *
 *  @param index 下标
 *
 *  @return 获得的charValue
 */
- (char)ly_charAtIndex:(NSUInteger)index {
    id value = [self ly_objectAtIndex:index];
    
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value charValue];
    }
    return 0;
}

/**
 *  获取下标为index的intValue，不存返回0
 *
 *  @param index 下标
 *
 *  @return 获得的intValue
 */
- (short)ly_shortAtIndex:(NSUInteger)index {
    id value = [self ly_objectAtIndex:index];
    
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]]) {
        return [value intValue];
    }
    return 0;
}

/**
 *  获取下标为index的floatValue，不存返回0
 *
 *  @param index 下标
 *
 *  @return 获得的floatValue
 */
- (float)ly_floatAtIndex:(NSUInteger)index {
    id value = [self ly_objectAtIndex:index];
    
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value floatValue];
    }
    return 0;
}

/**
 *  获取下标为index的doubleValue，不存返回0
 *
 *  @param index 下标
 *
 *  @return 获得的doubleValue
 */
- (double)ly_doubleAtIndex:(NSUInteger)index {
    id value = [self ly_objectAtIndex:index];
    
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value doubleValue];
    }
    return 0;
}

/**
 *  获取下标为index的CGFloat
 *
 *  @param index 下标
 *
 *  @return 获得的CGFloat
 */
- (CGFloat)ly_CGFloatAtIndex:(NSUInteger)index {
    id value = [self ly_objectAtIndex:index];
    
    if (value == nil || value == [NSNull null]) {
        return 0.0;
    }
    
    CGFloat f = [value doubleValue];
    return f;
}

/**
 *  获取下标为index的point
 *
 *  @param index 下标
 *
 *  @return 获得的point
 */
- (CGPoint)ly_pointAtIndex:(NSUInteger)index {
    id value = [self ly_objectAtIndex:index];
    
    CGPoint point = CGPointFromString(value);
    
    return point;
}

/**
 *  获取下标为index的size
 *
 *  @param index 下标
 *
 *  @return 获得的size
 */
- (CGSize)ly_sizeAtIndex:(NSUInteger)index {
    id value = [self ly_objectAtIndex:index];
    
    CGSize size = CGSizeFromString(value);
    
    return size;
}

/**
 *  获取下标为index的rect
 *
 *  @param index 下标
 *
 *  @return 获得的rect
 */
- (CGRect)ly_rectAtIndex:(NSUInteger)index {
    id value = [self ly_objectAtIndex:index];

    CGRect rect = CGRectFromString(value);
    
    return rect;
}

@end
