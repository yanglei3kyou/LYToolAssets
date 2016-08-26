//
//  LYVisibleView.m
//  LYToolAssetsLocal
//
//  Created by ylei on 16/6/12.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import "LYVisibleView.h"

@implementation LYVisibleView

- (void)setBorderWidth:(CGFloat)borderWidth {
    if (borderWidth < 0) {
        return ;
    }
    self.layer.borderWidth = borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    if (cornerRadius < 0) {
        return ;
    }
    self.layer.cornerRadius = cornerRadius;
}

@end
