//
//  NSData+LYAssets.m
//  LYToolAssetsLocal
//
//  Created by ylei on 16/8/24.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import "NSData+LYAssets.h"

#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonDigest.h>
#import <zlib.h>
#import "GTMBase64.h"

NSString * const GZipErrorDomain = @"org.skyfox.Gzip";

@implementation NSData (LYAssets)
#pragma mark - 加密
/**
 *  MD5加密
 *
 *  @return 加密后的字符串
 */
- (NSString *)ly_MD5 {
    const char *str = [self bytes];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)self.length, result);
    
    NSMutableString *hash = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH *2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02X", result[i]];
    }
    
    return [hash lowercaseString];
}

/**
 *  SHA1加密
 *
 *  @return 加密后的字符串
 */
- (NSString *)ly_SHA1 {
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(self.bytes, (CC_LONG)self.length, digest);
    NSMutableString* result = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH *2];
    for(int i =0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    return result;
}

/**
 *  SHA256加密
 *
 *  @return 加密后的字符串
 */
- (NSString *)ly_SHA256 {
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    CC_SHA1(self.bytes, (CC_LONG)self.length, digest);
    NSMutableString* result = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH *2];
    for(int i =0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    return result;
}

/**
 *  SHA384加密
 *
 *  @return 加密后的字符串
 */
- (NSString *)ly_SHA384 {
    uint8_t digest[CC_SHA384_DIGEST_LENGTH];
    CC_SHA1(self.bytes, (CC_LONG)self.length, digest);
    NSMutableString* result = [NSMutableString stringWithCapacity:CC_SHA384_DIGEST_LENGTH *2];
    for(int i =0; i < CC_SHA384_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    return result;
}

/**
 *  SHA512加密
 *
 *  @return 加密后的字符串
 */
- (NSString *)ly_SHA512 {
    uint8_t digest[CC_SHA512_DIGEST_LENGTH];
    CC_SHA1(self.bytes, (CC_LONG)self.length, digest);
    NSMutableString* result = [NSMutableString stringWithCapacity:CC_SHA512_DIGEST_LENGTH *2];
    for(int i =0; i < CC_SHA512_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    return result;
}

/**
 *  Base64加密
 *
 *  @return 加密后的字符串
 */
- (NSString *)ly_Base64Encode {
    NSString *base64String = [GTMBase64 encodeBase64Data:self];
    return base64String;
}

/**
 *  Base64解密
 *
 *  @return 解密后的字符串
 */
- (NSString *)ly_Base64Decode {
    NSString *base64String = [GTMBase64 decodeBase64Data:self];
    return base64String;
}

/**
 *  DES加密
 *
 *  @param key 加密需要的key
 *
 *  @return 得到加密后的字符串
 */
- (NSString *)ly_EncryptWithKey:(NSString *)key {
    return [self ly_encrypt:self encryptOrDecrypt:kCCEncrypt key:key];
}

/**
 *  DES解密
 *
 *  @param key 解密需要的key
 *
 *  @return 得到解密后的字符串
 */
- (NSString *)ly_DecryptWithKey:(NSString *)key {
    return [self ly_encrypt:self encryptOrDecrypt:kCCDecrypt key:key];
}

/**
 *  加密或解密
 *
 *  @param aData            需要加密或解密的字符串
 *  @param encryptOperation kCCDecrypt 解密 kCCEncrypt 加密
 *  @param aKey             加密解密需要的key
 *
 *  @return 返回加密或解密之后得到的字符串
 */
- (NSString *)ly_encrypt:(NSData *)aData encryptOrDecrypt:(CCOperation)encryptOperation key:(NSString *)aKey {
    const void *vplainText;
    size_t plainTextBufferSize;
    
    if (encryptOperation == kCCDecrypt) {
        plainTextBufferSize = [aData length];
        vplainText = [aData bytes];
    }
    else {
        plainTextBufferSize = [aData length];
        vplainText = (const void *)[aData bytes];
    }
    
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    NSString *initVec = @"LeiYang";
    const void *vkey = (const void *) [aKey UTF8String];
    const void *vinitVec = (const void *) [initVec UTF8String];
    
    ccStatus = CCCrypt(encryptOperation,
                       kCCAlgorithm3DES,
                       kCCOptionPKCS7Padding,
                       vkey,
                       kCCKeySize3DES,
                       vinitVec,
                       vplainText,
                       plainTextBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &movedBytes);
    
    NSString *result = nil;
    
    if (encryptOperation == kCCDecrypt) {
        result = [[NSString alloc] initWithData:[NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes] encoding:NSUTF8StringEncoding] ;
    }
    else {
        NSData *data = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes];
        result = [GTMBase64 stringByEncodingData:data];
    }
    
    return result;
}

/**
 *  压缩NSData数据流
 *
 *  @param error 返回错误值
 *
 *  @return 压缩后的NSData数据流
 */
- (NSData *)ly_GZip:(NSError *__autoreleasing *)error {
    /* stream setup */
    z_stream stream;
    memset(&stream, 0, sizeof(stream));
    /* 31 below means generate gzip (16) with a window size of 15 (16 + 15) */
    int iResult = deflateInit2(&stream, Z_DEFAULT_COMPRESSION, Z_DEFLATED, 31, 8, Z_DEFAULT_STRATEGY);
    if(iResult != Z_OK) {
        if(error)
            *error = [NSError errorWithDomain:GZipErrorDomain code:iResult userInfo:nil];
        return nil;
    }
    /* input buffer setup */
    stream.next_in = (Bytef*)self.bytes;
    stream.avail_in = (uInt)self.length;
    
    /* output buffer setup */
    uLong nMaxOutputBytes = deflateBound(&stream, stream.avail_in);
    NSMutableData* zipOutput = [NSMutableData dataWithLength:nMaxOutputBytes];
    stream.next_out = (Bytef*)zipOutput.bytes;
    stream.avail_out = (uInt)zipOutput.length;
    
    /* compress */
    iResult = deflate(&stream, Z_FINISH);
    if(iResult != Z_STREAM_END) {
        if(error)
            *error = [NSError errorWithDomain:GZipErrorDomain code:iResult userInfo:nil];
        zipOutput = nil;
    }
    zipOutput.length = zipOutput.length - stream.avail_out;
    deflateEnd(&stream);
    return zipOutput;
}

@end
