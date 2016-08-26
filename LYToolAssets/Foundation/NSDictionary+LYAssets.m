//
//  NSDictionary+LYAssets.m
//  LYToolAssetsLocal
//
//  Created by ylei on 16/8/23.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import "NSDictionary+LYAssets.h"

@implementation NSDictionary (LYAssets)
#pragma mark - 安全操作
/**
 *  判断字典对于给定Key是否有内容
 *
 *  @param aKey 给定的Key
 *
 *  @return YES 存在 NO 不存在
 */
- (BOOL)ly_hasKey:(NSString *)aKey {
    if (aKey && aKey.length > 0) {
        return [self.allKeys containsObject:aKey];
    }
    return NO;
}

/**
 *  获取字符串
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的字符串
 */
- (NSString *)ly_stringForKey:(id)aKey {
    id value = [self objectForKey:aKey];
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
 *  获取number
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的number
 */
- (NSNumber *)ly_numberForKey:(id)aKey {
    id value = [self objectForKey:aKey];
    if ([value isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)value;
    }
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        return [f numberFromString:(NSString*)value];
    }
    return nil;
}

/**
 *  获取array
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的array
 */
- (NSArray *)ly_arrayForKey:(id)aKey {
    id value = [self objectForKey:aKey];
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    if ([value isKindOfClass:[NSArray class]]) {
        return value;
    }
    return nil;
}

/**
 *  获取dictionary
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的dictionary
 */
- (NSDictionary *)ly_dictionaryForKey:(id)aKey {
    id value = [self objectForKey:aKey];
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    if ([value isKindOfClass:[NSDictionary class]]) {
        return value;
    }
    return nil;
}

/**
 *  获取integer
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的integer
 */
- (NSInteger)ly_integerForKey:(id)aKey {
    id value = [self objectForKey:aKey];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value integerValue];
    }
    return 0;
}

/**
 *  获取unsignedInteger
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的unsignedInteger
 */
- (NSUInteger)ly_unsignedIntegerForKey:(id)aKey {
    id value = [self objectForKey:aKey];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value unsignedIntegerValue];
    }
    return 0;
}

/**
 *  获取bool
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的bool
 */
- (BOOL)ly_boolForKey:(id)aKey {
    id value = [self objectForKey:aKey];
    
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
 *  获取字典Key对应的Bool值
 *
 *  @param aKey         Key值
 *  @param defaultValue 默认返回值
 *
 *  @return 返回值
 */
- (BOOL)ly_boolForKey:(id)aKey defaultValue:(BOOL)defaultValue {
    BOOL ret = defaultValue;
    if ([[self objectForKey:aKey] respondsToSelector:@selector(boolValue)]) {
        ret = [[self objectForKey:aKey] boolValue];
    }
    return ret;
}

/**
 *  获取int16
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的int16
 */
- (int16_t)ly_int16ForKey:(id)aKey {
    id value = [self objectForKey:aKey];
    
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
 *  获取int32
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的int32
 */
- (int32_t)ly_int32ForKey:(id)aKey {
    id value = [self objectForKey:aKey];
    
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value intValue];
    }
    return 0;
}

/**
 *  获取int64
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的int64
 */
- (int64_t)ly_int64ForKey:(id)aKey {
    id value = [self objectForKey:aKey];
    
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value longLongValue];
    }
    return 0;
}

/**
 *  获取char
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的char
 */
- (char)ly_charForKey:(id)aKey {
    id value = [self objectForKey:aKey];
    
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value charValue];
    }
    return 0;
}

/**
 *  获取short
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的short
 */
- (short)ly_shortForKey:(id)aKey {
    id value = [self objectForKey:aKey];
    
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
 *  获取float
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的float
 */
- (float)ly_floatForKey:(id)aKey {
    id value = [self objectForKey:aKey];
    
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value floatValue];
    }
    return 0;
}

/**
 *  获取double
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的double
 */
- (double)ly_doubleForKey:(id)aKey {
    id value = [self objectForKey:aKey];
    
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value doubleValue];
    }
    return 0;
}

/**
 *  获取longLong
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的longLong
 */
- (long long)ly_longLongForKey:(id)aKey {
    id value = [self objectForKey:aKey];
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value longLongValue];
    }
    return 0;
}

/**
 *  获取unsignedLongLong
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的unsignedLongLong
 */
- (unsigned long long)ly_unsignedLongLongForKey:(id)aKey {
    id value = [self objectForKey:aKey];
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
        value = [nf numberFromString:value];
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedLongLongValue];
    }
    return 0;
}

/**
 *  获取CGFloat
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的CGFloat
 */
- (CGFloat)ly_CGFloatForKey:(id)aKey {
    CGFloat f = [self[aKey] doubleValue];
    return f;
}

/**
 *  获取point
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的point
 */
- (CGPoint)ly_pointForKey:(id)aKey {
    CGPoint point = CGPointFromString(self[aKey]);
    return point;
}

/**
 *  获取size
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的size
 */
- (CGSize)ly_sizeForKey:(id)aKey {
    CGSize size = CGSizeFromString(self[aKey]);
    return size;
}

/**
 *  获取rect
 *
 *  @param aKey 给定的key
 *
 *  @return 获得的rect
 */
- (CGRect)ly_rectForKey:(id)aKey {
    CGRect rect = CGRectFromString(self[aKey]);
    return rect;
}

#pragma mark - 合并
/**
 *  合并两个字典
 *
 *  @param aDictionary 第一个字典
 *  @param otherDictionary 第二个字典
 *
 *  @return 合并之后得到的字典
 */
+ (NSDictionary *)ly_dictionaryByMerging:(NSDictionary *)aDictionary with:(NSDictionary *)otherDictionary {
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithDictionary:aDictionary];
    [otherDictionary enumerateKeysAndObjectsUsingBlock: ^(id key, id obj, BOOL *stop) {
        if (![aDictionary ly_hasKey:key]) {
            [result setObject:obj forKey:key];
        }
    }];
    return (NSDictionary *)[result mutableCopy];
}

/**
 *  与另一个字典合并
 *
 *  @param otherDictionary 将要合并过来的字典
 *
 *  @return 合并后的字典
 */
- (NSDictionary *)ly_dictionaryByMergingWith:(NSDictionary *)otherDictionary {
    return [[self class] ly_dictionaryByMerging:self with:otherDictionary];
}

#pragma mark - JSON
/**
 *  将字典转换成JSON字串符
 *
 *  @return JSON字符串
 */
- (NSString *)ly_JSONString {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (jsonData == nil) {
#ifdef DEBUG
        NSLog(@"fail to get JSON from dictionary: %@, error: %@", self, error);
#endif
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}


@end
