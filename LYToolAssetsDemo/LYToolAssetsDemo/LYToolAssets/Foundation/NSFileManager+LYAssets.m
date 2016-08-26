//
//  NSFileManager+LYAssets.m
//  LYToolAssetsLocal
//
//  Created by ylei on 16/8/25.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import "NSFileManager+LYAssets.h"

@implementation NSFileManager (LYAssets)
/**
 *  获取URL
 *
 *  @param directory 指定的directory
 *
 *  @return 得到的URL
 */
+ (NSURL *)ly_URLForDirectory:(NSSearchPathDirectory)directory {
    return [self.defaultManager URLsForDirectory:directory inDomains:NSUserDomainMask].lastObject;
}

/**
 *  获取指定directory的路径
 *
 *  @param directory 指定的directory
 *
 *  @return 得到的路径
 */
+ (NSString *)ly_pathForDirectory:(NSSearchPathDirectory)directory {
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES)[0];
}

/**
 *  获取Documents目录URL
 *
 *  @return Documents目录URL
 */
+ (NSURL *)ly_documentsURL {
    return [self ly_URLForDirectory:NSDocumentDirectory];
}

/**
 *  获取Documents目录路径
 *
 *  @return Documents目录路径
 */
+ (NSString *)ly_documentsPath {
    return [self ly_pathForDirectory:NSDocumentDirectory];
}

/**
 *  获取Library目录URL
 *
 *  @return Library目录URL
 */
+ (NSURL *)ly_libraryURL {
    return [self ly_URLForDirectory:NSLibraryDirectory];
}

/**
 *  获取Library目录路径
 *
 *  @return Library目录路径
 */
+ (NSString *)ly_libraryPath {
    return [self ly_pathForDirectory:NSLibraryDirectory];
}

/**
 *  获取Cache目录URL
 *
 *  @return Cache目录URL
 */
+ (NSURL *)ly_cachesURL {
    return [self ly_URLForDirectory:NSCachesDirectory];
}

/**
 *  获取Cache目录路径
 *
 *  @return Cache目录路径
 */
+ (NSString *)ly_cachesPath {
    return [self ly_pathForDirectory:NSCachesDirectory];
}

/**
 *  获取应用沙盒根路径
 *
 *  @return 应用沙盒根路径
 */
+ (NSString *)ly_homePath {
    return NSHomeDirectory();
}

/**
 *  获取Tmp目录路径
 *
 *  @return Tmp目录路径
 */
+ (NSString *)ly_tmpPath {
    return NSTemporaryDirectory();
}


#pragma mark - 附加方法

/**
 *  判断文件是否存在于指定路径
 *
 *  @param path 文件路径
 *
 *  @return YES存在 NO不存在
 */
+ (BOOL)ly_fileExistsAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

/**
 *  判断文件是否存在于指定路径
 *
 *  @param path        文件路径
 *  @param isDirectory 是否是文件夹(对外指针)
 *
 *  @return YES存在 NO不存在
 */
+ (BOOL)ly_fileExistsAtPath:(NSString *)path isDirectory:(BOOL *)isDirectory {
    return [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:isDirectory];
}

/**
 *  判断文件是否超时
 *
 *  @param path    文件路径名
 *  @param timeout 限制的超时时间，单位为秒
 *
 *  @return 返回YES表示超时，返回NO表示未超时
 */
+ (BOOL)ly_isFile:(NSString *)path timeout:(NSTimeInterval)timeout {
    if ([NSFileManager ly_fileExistsAtPath:path]) {
        NSError *error = nil;
        NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:&error];
        if (error) {
            return YES;
        }
        
        if ([attributes isKindOfClass:[NSDictionary class]] && attributes) {
            //  NSLog(@"%@", attributes);
            NSString *createDate = [attributes objectForKey:@"NSFileModificationDate"];
            createDate = [NSString stringWithFormat:@"%@", createDate];
            if (createDate.length >= 19) {
                createDate = [createDate substringToIndex:19];
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
                
                NSDate *sinceDate = [formatter dateFromString:createDate];
                NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:sinceDate];
                return interval <= 0;
            }
        }
    }
    return YES;
}


@end
