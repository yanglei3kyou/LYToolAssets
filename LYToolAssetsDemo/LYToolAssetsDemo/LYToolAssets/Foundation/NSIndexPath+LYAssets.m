//
//  NSIndexPath+LYAssets.m
//  LYToolAssetsLocal
//
//  Created by ylei on 16/6/13.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import "NSIndexPath+LYAssets.h"
#import <UIKit/UIKit.h>
@implementation NSIndexPath (LYAssets)
- (BOOL)ly_isSameTo:(NSIndexPath *)indexPath {
    return self && indexPath && (self.row == indexPath.row) && (self.section == indexPath.section);
}

@end
