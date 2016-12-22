//
//  UIImage+LYAssets.m
//  CAXA-KanTu
//
//  Created by ylei on 2016/12/22.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import "UIImage+LYAssets.h"

@implementation UIImage (LYAssets)
+ (UIImage *)ly_imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1.0, 1.0);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
