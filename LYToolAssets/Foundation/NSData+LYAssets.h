//
//  NSData+LYAssets.h
//  LYToolAssetsLocal
//
//  Created by ylei on 16/8/24.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (LYAssets)

#pragma mark - 加密
/**
 *  MD5加密
 *
 *  @return 加密后的字符串
 */
- (NSString *)ly_MD5;

/**
 *  SHA1加密
 *
 *  @return 加密后的字符串
 */
- (NSString *)ly_SHA1;

/**
 *  SHA256加密
 *
 *  @return 加密后的字符串
 */
- (NSString *)ly_SHA256;

/**
 *  SHA384加密
 *
 *  @return 加密后的字符串
 */
- (NSString *)ly_SHA384;

/**
 *  SHA512加密
 *
 *  @return 加密后的字符串
 */
- (NSString *)ly_SHA512;

/**
 *  Base64加密
 *
 *  @return 加密后的字符串
 */
- (NSString *)ly_Base64Encode;

/**
 *  Base64解密
 *
 *  @return 解密后的字符串
 */
- (NSString *)ly_Base64Decode;

/**
 *  DES加密
 *
 *  @param key 加密需要的key
 *
 *  @return 得到加密后的字符串
 */
- (NSString *)ly_EncryptWithKey:(NSString *)key;

/**
 *  DES解密
 *
 *  @param key 解密需要的key
 *
 *  @return 得到解密后的字符串
 */
- (NSString *)ly_DecryptWithKey:(NSString *)key;


#pragma mark - GZip
//
// You need to add framework
// Add libz.dylib to your project.
//
extern NSString * const GZipErrorDomain;

/**
 *  压缩NSData数据流
 *
 *  @param error 返回错误值
 *
 *  @return 压缩后的NSData数据流
 */
- (NSData *)ly_GZip:(NSError **)error;

@end
