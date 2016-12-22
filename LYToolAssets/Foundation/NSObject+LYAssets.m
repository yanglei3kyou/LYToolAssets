//
//  NSObject+LYAssets.m
//  LYToolAssetsLocal
//
//  Created by ylei on 16/8/26.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import "NSObject+LYAssets.h"
#import <objc/runtime.h>

@implementation NSObject (LYAssets)
#pragma mark - Associated

/**
 *  获取运行时设置的Key对应的值
 *
 *  @param key 运行时设置的Key
 *
 *  @return 对应的值
 */
- (id)ly_getAssociatedObjectForKey:(const char *)key {
    const char * propName = key;
    id currValue = objc_getAssociatedObject( self, propName );
    return currValue;
}

/**
 *  以Copy方式 将对象obj存在路径key上，并返回key之前对应的值
 *
 *  @param obj 要保存的对象
 *  @param key 保存的路径
 *
 *  @return key之前对应的值
 */
- (id)ly_copyAssociatedObject:(id)obj forKey:(const char *)key {
    const char * propName = key;
    id oldValue = objc_getAssociatedObject( self, propName );
    objc_setAssociatedObject( self, propName, obj, OBJC_ASSOCIATION_COPY );
    return oldValue;
}

/**
 *  以Retain方式 将对象obj存在路径key上，并返回key之前对应的值
 *
 *  @param obj 要保存的对象
 *  @param key 保存的路径
 *
 *  @return key之前对应的值
 */
- (id)ly_retainAssociatedObject:(id)obj forKey:(const char *)key; {
    const char * propName = key;
    id oldValue = objc_getAssociatedObject( self, propName );
    objc_setAssociatedObject( self, propName, obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
    return oldValue;
}

/**
 *  以Assign方式 将对象obj存在路径key上，并返回key之前对应的值
 *
 *  @param obj 要保存的对象
 *  @param key 保存的路径
 *
 *  @return key之前对应的值
 */
- (id)ly_assignAssociatedObject:(id)obj forKey:(const char *)key {
    const char * propName = key;
    id oldValue = objc_getAssociatedObject( self, propName );
    objc_setAssociatedObject( self, propName, obj, OBJC_ASSOCIATION_ASSIGN );
    return oldValue;
}

/**
 *  删除本对象在路径key中存储的值
 *
 *  @param key 对应路径
 */
- (void)ly_removeAssociatedObjectForKey:(const char *)key {
    const char * propName = key;
    objc_setAssociatedObject( self, propName, nil, OBJC_ASSOCIATION_ASSIGN );
}

/**
 *  删除本对象在路径key中存储的值
 */
- (void)ly_removeAllAssociatedObjects {
    objc_removeAssociatedObjects(self);
}


@end
