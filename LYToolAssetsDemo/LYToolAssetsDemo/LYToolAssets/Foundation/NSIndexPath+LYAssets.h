//
//  NSIndexPath+LYAssets.h
//  LYToolAssetsLocal
//
//  Created by ylei on 16/6/13.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSIndexPath (LYAssets)
/**
 *  判断两indexPath是否相等
 *
 *  @param indexPath 待比较indexPath
 *
 *  @return 比较结果
 */
- (BOOL)ly_isSameTo:(NSIndexPath *)indexPath;

@end
