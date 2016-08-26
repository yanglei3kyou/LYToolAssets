//
//  NSString+LYAssets.m
//  LYToolAssetsLocal
//
//  Created by ylei on 16/6/12.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import "NSString+LYAssets.h"
#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonDigest.h>
#import "GTMBase64.h"

@implementation NSString (LYAssets)
#pragma mark - 判断特殊字符
/**
 *  字符串合法性(存在且长度非空且不为NSNull)
 *
 *  @return 合法结果
 */
- (BOOL)ly_isValid {
    if (self && ![self isKindOfClass:[NSNull class]]&& self.length != 0 && ![self isEqualToString:@"<null>"]) {
        return YES;
    }
    return NO;
}

/**
 *  判断字符串是否为空
 *
 *  @return YES 为空 NO 不为空
 */
- (BOOL)ly_isEmpty {
    if ([self ly_isValid]) {
        return [self length] > 0 ? NO : YES;
    }
    else {
        return YES;
    }
}

/**
 *  判断是否为整形
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isInteger {
    if ([self ly_isValid]) {
        NSScanner *scan = [NSScanner scannerWithString:self];
        NSInteger val;
        return [scan scanInteger:&val] && [scan isAtEnd];
    }
    else {
        return NO;
    }
}

/**
 *  判断是否为浮点形
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isFloat {
    if ([self ly_isValid]) {
        NSScanner* scan = [NSScanner scannerWithString:self];
        float val;
        return[scan scanFloat:&val] && [scan isAtEnd];
    }
    else {
        return NO;
    }
}

/**
 *  判断是否有特殊字符
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isHasSpecialCharacters {
    if ([self ly_isValid]) {
        NSString *englishNameRule = @"^[(A-Za-z0-9)*(\u4e00-\u9fa5)*(,|\\.|，|。|\\:|;|：|；|!|！|\\*|\\×|\\(|\\)|\\（|\\）|#|#|\\$|&#|\\$|&|\\^|@|&#|\\$|&|\\^|@|＠|＆|\\￥|\\……)*]+$";
        
        NSPredicate *englishpredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", englishNameRule];
        
        if ([englishpredicate evaluateWithObject:self] == YES) {
            return YES;
        }
        else {
            return NO;
        }
    }
    else {
        return NO;
    }
}

/**
 *  判断是否含有数字
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isHasNumder {
    if ([self ly_isValid]) {
        NSString *englishNameRule = @"[A-Za-z]{2,}|[\u4e00-\u9fa5]{1,}[A-Za-z]+$";
        NSString *chineseNameRule = @"^[\u4e00-\u9fa5]{2,}$";
        
        NSPredicate *englishpredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", englishNameRule];
        NSPredicate *chinesepredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", chineseNameRule];
        
        if ([englishpredicate evaluateWithObject:self] == YES||[chinesepredicate evaluateWithObject:self] == YES) {
            return YES;
        }
        else {
            return NO;
        }
    }
    else {
        return NO;
    }
}

#pragma mark - 时间戳转换
/**
 *  毫秒级时间戳转日期
 *
 *  @return 日期
 */
- (NSDate *)ly_dateValueWithMilliSecondsSince1970 {
    NSDate *aDate = [NSDate dateWithTimeIntervalSince1970:[self doubleValue] / 1000];
    NSTimeZone *nowTimeZone = [NSTimeZone localTimeZone];
    NSInteger timeOffset = [nowTimeZone secondsFromGMTForDate:aDate];
    NSDate *newDate = [aDate dateByAddingTimeInterval:timeOffset];
    return newDate;
}

/**
 *  秒级时间戳转日期
 *
 *  @return 日期
 */
- (NSDate *)ly_dateValueWithTimeIntervalSince1970 {
    NSDate *aDate = [NSDate dateWithTimeIntervalSince1970:[self doubleValue]];
    NSTimeZone *nowTimeZone = [NSTimeZone localTimeZone];
    NSInteger timeOffset = [nowTimeZone secondsFromGMTForDate:aDate];
    NSDate *newDate = [aDate dateByAddingTimeInterval:timeOffset];
    return newDate;
}

#pragma mark - 检测是否含有某个字符
/**
 *  检测是否含有某个字符
 *
 *  @param str 检测是否含有的字符
 *
 *  @return YES 含有 NO 不含有
 */
- (BOOL)ly_containsString:(NSString *)str {
    if ([self ly_isValid] && [str ly_isValid]) {
        return ([self rangeOfString:str].location == NSNotFound) ? NO : YES;
    }
    else {
        return NO;
    }
}

/**
 *  检测是否含有汉字字符
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_containsChineseCharacter {
    if ([self ly_isValid]) {
        for (int i = 0; i < self.length; i++) {
            unichar c = [self characterAtIndex:i];
            if (c >=0x4E00 && c <=0x9FFF) {
                return YES;
            }
        }
    }
    
    return NO;
}

#pragma mark - 计算字符串尺寸
/**
 *  计算字符串高度 （多行）
 *
 *  @param width 字符串的宽度
 *  @param font  字体大小
 *
 *  @return 字符串的尺寸
 */
- (CGSize)ly_heightWithWidth:(CGFloat)width andFont:(CGFloat)font {
    if (![self ly_isValid]) {
        return CGSizeZero;
    }
    
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};
    CGSize size = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine attributes:attribute context:nil].size;
    return size;
}

/**
 *  计算字符串宽度
 *
 *  @param height 字符串的高度
 *  @param font  字体大小
 *
 *  @return 字符串的尺寸
 */
- (CGSize)ly_widthWithHeight:(CGFloat)height andFont:(CGFloat)font {
    if (![self ly_isValid]) {
        return CGSizeZero;
    }
    
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};
    CGSize size = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine attributes:attribute context:nil].size;
    return size;
}


#pragma mark - 正则匹配
/**
 *  匹配Email
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isEmail {
    if (![self ly_isValid]) {
        return NO;
    }
    
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}

/**
 *  匹配URL
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isURL {
    if (![self ly_isValid]) {
        return NO;
    }
    
    NSString *regex = @"http(s)?:\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}

/**
 *  匹配电话号码+手机号码
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isTelephone {
    if (![self ly_isValid]) {
        return NO;
    }
    
    NSString * MOBILE = @"^1(3[0-9]|47|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";;
    NSString * CU = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
    NSString * CT = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    return  [regextestmobile evaluateWithObject:self]   ||
    [regextestphs evaluateWithObject:self]      ||
    [regextestct evaluateWithObject:self]       ||
    [regextestcu evaluateWithObject:self]       ||
    [regextestcm evaluateWithObject:self];
}

/**
 *  匹配邮编
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isValidZipCode {
    if (![self ly_isValid]) {
        return NO;
    }
    
    const char *cvalue = [self UTF8String];
    
    long len = strlen(cvalue);
    if (len != 6) {
        return NO;
    }
    
    for (int i = 0; i < len; i++) {
        if (!(cvalue[i] >= '0' && cvalue[i] <= '9')) {
            return NO;
        }
    }
    
    return YES;
}

/**
 *  验证是否由字母或数字组成 minLength-maxLength位 密码
 *
 *  @param minLength 密码最短长度
 *  @param maxLength 密码最长长度
 *
 *  @return YES 验证成功 NO 验证失败
 */
- (BOOL)ly_isPasswordWithMinLength:(NSUInteger)minLength maxLength:(NSUInteger)maxLength {
    if (![self ly_isValid]) {
        return NO;
    }
    
    NSString *regex =  [NSString stringWithFormat:@"^[A-Za-z0-9_]{%lu,%lu}$",(unsigned long)minLength,(unsigned long)maxLength];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
    
}

/**
 *  匹配数字
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isNumbers {
    if (![self ly_isValid]) {
        return NO;
    }
    
    NSString *regEx = @"^-?\\d+.?\\d?";
    NSPredicate *pred= [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [pred evaluateWithObject:self];
}

/**
 *  匹配英文字母
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isLetter {
    if (![self ly_isValid]) {
        return NO;
    }
    
    NSString *regEx = @"^[A-Za-z]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [pred evaluateWithObject:self];
}

/**
 *  匹配大写英文字母
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isCapitalLetter {
    if (![self ly_isValid]) {
        return NO;
    }
    
    NSString *regEx = @"^[A-Z]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [pred evaluateWithObject:self];
}

/**
 *  匹配小写英文字母
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isSmallLetter {
    if (![self ly_isValid]) {
        return NO;
    }
    
    NSString *regEx = @"^[a-z]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [pred evaluateWithObject:self];
}

/**
 *  匹配小写英文字母
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isLetterAndNumbers {
    if (![self ly_isValid]) {
        return NO;
    }
    
    NSString *regEx = @"^[A-Za-z0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [pred evaluateWithObject:self];
}

/**
 *  匹配中文，英文字母和数字及_
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isChineseAndLetterAndNumberAndBelowLine {
    if (![self ly_isValid]) {
        return NO;
    }
    
    NSString *regEx = @"^[\u4e00-\u9fa5_a-zA-Z0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [pred evaluateWithObject:self];
}

/**
 *  匹配中文，英文字母和数字及_ 并限制字数4-10位
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isChineseAndLetterAndNumberAndBelowLine4to10 {
    if (![self ly_isValid]) {
        return NO;
    }
    
    NSString *regEx = @"[\u4e00-\u9fa5_a-zA-Z0-9_]{4,10}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [pred evaluateWithObject:self];
}

/**
 *  匹配含有汉字、数字、字母、下划线不能以下划线开头和结尾
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isChineseAndLetterAndNumberAndBelowLineNotFirstOrLast {
    if (![self ly_isValid]) {
        return NO;
    }
    
    NSString *regEx = @"^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [pred evaluateWithObject:self];
}

/**
 *  最长不得超过7个汉字，或14个字节(数字，字母和下划线)正则表达式
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isBelow7ChineseOrBlow14LetterAndNumberAndBelowLine {
    if (![self ly_isValid]) {
        return NO;
    }
    
    NSString *regEx = @"^[\u4e00-\u9fa5]{1,7}$|^[\\dA-Za-z_]{1,14}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [pred evaluateWithObject:self];
}

#pragma mark - 加密
/**
 *  MD5加密(32位 常规)
 *
 *  @return 加密后的字符串
 */
- (NSString *)ly_MD5 {
    
    NSData *resourceData = [self dataUsingEncoding:NSUTF8StringEncoding];
    const char *str = [resourceData bytes];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)self.length, result);
    
    NSMutableString *hash = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH *2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02X", result[i]];
    }
    
    return [hash lowercaseString];
}

/**
 *  MD5加密(16位)
 *
 *  @return 加密后的字符串
 */
- (NSString *)ly_MD5_16 {
    // 提取32位MD5散列的中间16位
    NSString *md5_32=[self ly_MD5];
    // 即9～25位
    NSString *result = [[md5_32 substringToIndex:24] substringFromIndex:8];
    return result;
}

/**
 *  SHA1加密
 *
 *  @return 加密后的字符串
 */
- (NSString *)ly_SHA1 {
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
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
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
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
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    uint8_t digest[CC_SHA384_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
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
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    uint8_t digest[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(data.bytes, (CC_LONG)data.length, digest);
    NSMutableString* result = [NSMutableString stringWithCapacity:CC_SHA512_DIGEST_LENGTH *2];
    for(int i =0; i < CC_SHA512_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    return result;
}

/**
 *  Base64加密
 *
 *  @return 加密后的字符串
 */
- (NSString *)ly_Base64Encode {
    NSString *base64String = [GTMBase64 encodeBase64String:self];
    return base64String;
}

/**
 *  Base64解密
 *
 *  @return 解密后的字符串
 */
- (NSString *)ly_Base64Decode {
    NSString *base64String = [GTMBase64 decodeBase64String:self];
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
 *  @param sText            需要加密或解密的字符串
 *  @param encryptOperation kCCDecrypt 解密 kCCEncrypt 加密
 *  @param key              加密解密需要的key
 *
 *  @return 返回加密或解密之后得到的字符串
 */
- (NSString *)ly_encrypt:(NSString *)sText encryptOrDecrypt:(CCOperation)encryptOperation key:(NSString *)key {
    const void *vplainText;
    size_t plainTextBufferSize;
    
    if (encryptOperation == kCCDecrypt) {
        NSData *decryptData = [GTMBase64 decodeData:[sText dataUsingEncoding:NSUTF8StringEncoding]];
        plainTextBufferSize = [decryptData length];
        vplainText = [decryptData bytes];
    }
    else {
        NSData* encryptData = [sText dataUsingEncoding:NSUTF8StringEncoding];
        plainTextBufferSize = [encryptData length];
        vplainText = (const void *)[encryptData bytes];
    }
    
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    NSString *initVec = @"LeiYang";
    const void *vkey = (const void *) [key UTF8String];
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

#pragma mark - 获得特殊字符串

/**
 *  日期+随机数的字符串（比如为文件命名）
 *
 *  @return 得到的字符串
 */
+ (NSString *)ly_getTimeAndRandomString {
    
    int iRandom = arc4random();
    if (iRandom < 0) {
        iRandom = -iRandom;
    }
    
    NSTimeZone *nowTimeZone = [NSTimeZone localTimeZone];
    NSInteger timeOffset = [nowTimeZone secondsFromGMTForDate:[NSDate date]];
    NSDate *currentDate = [[NSDate date] dateByAddingTimeInterval:timeOffset];
    
    
    NSDateFormatter *tFormat = [[NSDateFormatter alloc] init];
    tFormat.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    [tFormat setDateFormat:@"yyyyMMddHHmmss"];

    NSString *tResult = [NSString stringWithFormat:@"%@%d",[tFormat stringFromDate:currentDate],iRandom];
    return tResult;
}

#pragma mark - Json转义
/**
 *  将得到的json的回车替换转义字符
 *
 *  @return 得到替换后的字符串
 */
- (NSString *)ly_changeJsonEnter {
    return [self stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
}


#pragma mark - Email 转换
/**
 *  将邮箱地址部分信息进行隐藏
 *
 *  @return 隐藏后的邮箱地址
 */
- (NSString *)ly_emailChangeToPrivacy {
    
    if (!([self ly_isValid] && [self ly_isEmail])) {
        return @"";
    }
    
    NSRange range = [self rangeOfString:@"@"];
    
    NSMutableString *changeStr = [NSMutableString stringWithString:self];
    if (range.location > 2) {
        NSRange changeRange;
        changeRange.location = 3;
        changeRange.length = range.location - 3;
        
        NSMutableString *needChanegeToStr = [NSMutableString string];
        for (int i = 0; i < changeRange.length ; i ++) {
            
            [needChanegeToStr appendString:@"*"];
        }
        
        [changeStr replaceCharactersInRange:changeRange withString:needChanegeToStr];
    }
    
    return changeStr;
}

#pragma mark - Emoji相关
/**
 *  判断是否是Emoji
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isEmoji {
    const unichar high = [self characterAtIndex: 0];
    
    // Surrogate pair (U+1D000-1F77F)
    if (0xd800 <= high && high <= 0xdbff) {
        const unichar low = [self characterAtIndex: 1];
        const int codepoint = ((high - 0xd800) * 0x400) + (low - 0xdc00) + 0x10000;
        
        return (0x1d000 <= codepoint && codepoint <= 0x1f77f);
        
        // Not surrogate pair (U+2100-27BF)
    } else {
        return (0x2100 <= high && high <= 0x27bf);
    }
}

/**
 *  判断字符串时候含有Emoji
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isIncludingEmoji {
    if (![self ly_isValid]) {
        return NO;
    }
    
    BOOL __block result = NO;
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                              if ([substring ly_isEmoji]) {
                                  *stop = YES;
                                  result = YES;
                              }
                          }];
    
    return result;
}

/**
 *  移除掉字符串中得Emoji
 *
 *  @return 得到移除后的Emoji
 */
- (instancetype)ly_removedEmojiString {
    if (![self ly_isValid]) {
        return @"";
    }
    
    NSMutableString* __block buffer = [NSMutableString stringWithCapacity:[self length]];
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                              [buffer appendString:([substring ly_isEmoji])? @"": substring];
                          }];
    
    return buffer;
}


@end
