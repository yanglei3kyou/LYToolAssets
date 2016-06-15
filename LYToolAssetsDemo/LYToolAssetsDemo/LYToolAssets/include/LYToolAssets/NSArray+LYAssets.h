//
//  NSArray+LYAssets.h
//  LYToolAssetsLocal
//
//  Created by ylei on 16/6/12.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (LYAssets)
/**
 *  数组合法性(存在且非空)
 *
 *  @return 合法结果
 */
- (BOOL)ly_isValid;

@end
