//
//  NSString+LYAssets.h
//  LYToolAssetsLocal
//
//  Created by ylei on 16/6/12.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LYAssets)
/**
 *  字符串合法性(存在且长度非空且不为NSNull)
 *
 *  @return 合法结果
 */
- (BOOL)ly_isValid;

@end
