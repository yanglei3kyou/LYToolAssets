//
//  NSFileManager+LYAssets.h
//  LYToolAssetsLocal
//
//  Created by ylei on 16/8/25.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (LYAssets)

#pragma mark - 各种路径及对应URL

/**
 *  获取Documents目录URL
 *
 *  @return Documents目录URL
 */
+ (NSURL *)ly_documentsURL;

/**
 *  获取Documents目录路径
 *
 *  @return Documents目录路径
 */
+ (NSString *)ly_documentsPath;

/**
 *  获取Library目录URL
 *
 *  @return Library目录URL
 */
+ (NSURL *)ly_libraryURL;

/**
 *  获取Library目录路径
 *
 *  @return Library目录路径
 */
+ (NSString *)ly_libraryPath;

/**
 *  获取Cache目录URL
 *
 *  @return Cache目录URL
 */
+ (NSURL *)ly_cachesURL;

/**
 *  获取Cache目录路径
 *
 *  @return Cache目录路径
 */
+ (NSString *)ly_cachesPath;

/**
 *  获取应用沙盒根路径
 *
 *  @return 应用沙盒根路径
 */
+ (NSString *)ly_homePath;

/**
 *  获取Tmp目录路径
 *
 *  @return Tmp目录路径
 */
+ (NSString *)ly_tmpPath;


#pragma mark - 附加方法

/**
 *  判断文件是否存在于指定路径
 *
 *  @param path 文件路径
 *
 *  @return YES存在 NO不存在
 */
+ (BOOL)ly_fileExistsAtPath:(NSString *)path;

/**
 *  判断文件是否存在于指定路径
 *
 *  @param path        文件路径
 *  @param isDirectory 是否是文件夹(对外指针)
 *
 *  @return YES存在 NO不存在
 */
+ (BOOL)ly_fileExistsAtPath:(NSString *)path isDirectory:(BOOL *)isDirectory;

/**
 *  判断文件是否超时
 *
 *  @param path    文件路径名
 *  @param timeout 限制的超时时间，单位为秒
 *
 *  @return 返回YES表示超时，返回NO表示未超时
 */
+ (BOOL)ly_isFile:(NSString *)path timeout:(NSTimeInterval)timeout;



@end
