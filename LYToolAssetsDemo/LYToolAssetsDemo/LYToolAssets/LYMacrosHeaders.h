//
//  LYMacrosHeaders.h
//  LYToolAssetsLocal
//
//  Created by ylei on 16/6/12.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#ifndef LYMacrosHeaders_h
#define LYMacrosHeaders_h

#pragma mark - Block 对象修改
#define LYWeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;
#define LYStrongObj(o) autoreleasepool{} __strong typeof(o) o = o##Weak;

#pragma mark - AppDelegate 别称
#define SharedApp ((AppDelegate*)[[UIApplication sharedApplication] delegate])

#define ImageCreateWithName(a) [UIImage imageNamed:a]

#endif /* LYMacrosHeaders_h */
