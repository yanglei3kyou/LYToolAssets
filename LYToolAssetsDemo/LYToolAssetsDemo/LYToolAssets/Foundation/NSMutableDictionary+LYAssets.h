//
//  NSMutableDictionary+LYAssets.h
//  LYToolAssetsLocal
//
//  Created by ylei on 16/8/23.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface NSMutableDictionary (LYAssets)

#pragma mark - 安全操作
/**
 *  设置Key - Value object
 *
 *  @param anObject   object
 *  @param aKey key
 */
- (void)ly_setObject:(id)anObject forKey:(NSString *)aKey;

/**
 *  设置Key - Value String
 *
 *  @param aString   String
 *  @param aKey key
 */
- (void)ly_setString:(NSString *)aString forKey:(NSString *)aKey;

/**
 *  设置Key - Value Bool
 *
 *  @param aBool   Bool
 *  @param aKey key
 */
- (void)ly_setBool:(BOOL)aBool forKey:(NSString *)aKey;

/**
 *  设置Key - Value Int
 *
 *  @param aInt   Int
 *  @param aKey key
 */
- (void)ly_setInt:(int)aInt forKey:(NSString *)aKey;

/**
 *  设置Key - Value Integer
 *
 *  @param aInteger  Integer
 *  @param aKey key
 */
- (void)ly_setInteger:(NSInteger)aInteger forKey:(NSString *)aKey;

/**
 *  设置Key - Value UnsignedInteger
 *
 *  @param aUInteger   UnsignedInteger
 *  @param key key
 */
- (void)ly_setUnsignedInteger:(NSUInteger)aUInteger forKey:(NSString *)aKey;

/**
 *  设置Key - Value Char
 *
 *  @param aChar   Char
 *  @param aKey key
 */
- (void)ly_setChar:(char)aChar forKey:(NSString *)aKey;

/**
 *  设置Key - Value Float
 *
 *  @param aFloat   Float
 *  @param aKey key
 */
- (void)ly_setFloat:(float)aFloat forKey:(NSString *)aKey;

/**
 *  设置Key - Value Double
 *
 *  @param aDouble   Double
 *  @param aKey key
 */
- (void)ly_setDouble:(double)aDouble forKey:(NSString *)aKey;

/**
 *  设置Key - Value LongLong
 *
 *  @param alonglong   LongLong
 *  @param aKey key
 */
- (void)ly_setLongLong:(long long)alonglong forKey:(NSString *)aKey;

/**
 *  设置Key - Value CGFloat
 *
 *  @param aCGFloat   CGFloat
 *  @param aKey key
 */
- (void)ly_setCGFloat:(CGFloat)aCGFloat forKey:(NSString *)aKey;

/**
 *  设置Key - Value Point
 *
 *  @param aPoint   Point
 *  @param aKey key
 */
- (void)ly_setPoint:(CGPoint)aPoint forKey:(NSString *)aKey;

/**
 *  设置Key - Value Size
 *
 *  @param aSize   Size
 *  @param aKey key
 */
- (void)ly_setSize:(CGSize)aSize forKey:(NSString *)aKey;

/**
 *  设置Key - Value Rect
 *
 *  @param aRect   Rect
 *  @param aKey key
 */
- (void)ly_setRect:(CGRect)aRect forKey:(NSString *)aKey;

@end
