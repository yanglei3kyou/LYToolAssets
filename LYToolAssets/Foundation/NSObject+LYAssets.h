//
//  NSObject+LYAssets.h
//  LYToolAssetsLocal
//
//  Created by ylei on 16/8/26.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LYAssets)

#pragma mark - Associated

/**
 *  获取运行时设置的Key对应的值
 *
 *  @param key 运行时设置的Key
 *
 *  @return 对应的值
 */
- (id)ly_getAssociatedObjectForKey:(const char *)key;

/**
 *  以Copy方式 将对象obj存在路径key上，并返回key之前对应的值
 *
 *  @param obj 要保存的对象
 *  @param key 保存的路径
 *
 *  @return key之前对应的值
 */
- (id)ly_copyAssociatedObject:(id)obj forKey:(const char *)key;

/**
 *  以Retain方式 将对象obj存在路径key上，并返回key之前对应的值
 *
 *  @param obj 要保存的对象
 *  @param key 保存的路径
 *
 *  @return key之前对应的值
 */
- (id)ly_retainAssociatedObject:(id)obj forKey:(const char *)key;

/**
 *  以Assign方式 将对象obj存在路径key上，并返回key之前对应的值
 *
 *  @param obj 要保存的对象
 *  @param key 保存的路径
 *
 *  @return key之前对应的值
 */
- (id)ly_assignAssociatedObject:(id)obj forKey:(const char *)key;

/**
 *  删除本对象在路径key中存储的值
 *
 *  @param key 对应路径
 */
- (void)ly_removeAssociatedObjectForKey:(const char *)key;

/**
 *  删除本对象运行时所关联的所有对象
 */
- (void)ly_removeAllAssociatedObjects;


@end
