//
//  UIImage+LYAssets.h
//  CAXA-KanTu
//
//  Created by ylei on 2016/12/22.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LYAssets)

/**
 生成该颜色的图片

 @param color 图片颜色
 @return 生成的图片
 */
+ (UIImage *)ly_imageWithColor:(UIColor *)color;

@end
