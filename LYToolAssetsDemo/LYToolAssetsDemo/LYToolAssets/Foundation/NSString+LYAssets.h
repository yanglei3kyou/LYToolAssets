//
//  NSString+LYAssets.h
//  LYToolAssetsLocal
//
//  Created by ylei on 16/6/12.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface NSString (LYAssets)

#pragma mark - 判断特殊字符
/**
 *  字符串合法性(存在且长度非空且不为NSNull)
 *
 *  @return 合法结果
 */
- (BOOL)ly_isValid;

/**
 *  判断字符串是否为空
 *
 *  @return YES 为空 NO 不为空
 */
- (BOOL)ly_isEmpty;

/**
 *  判断是否为整形
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isInteger;

/**
 *  判断是否为浮点形
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isFloat;

/**
 *  判断是否有特殊字符
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isHasSpecialCharacters;

/**
 *  判断是否含有数字
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isHasNumder;


#pragma mark - 时间戳转换
/**
 *  毫秒级时间戳转日期
 *
 *  @return 日期
 */
- (NSDate *)ly_dateValueWithMilliSecondsSince1970;

/**
 *  秒级时间戳转日期
 *
 *  @return 日期
 */
- (NSDate *)ly_dateValueWithTimeIntervalSince1970;


#pragma mark - 包含操作
/**
 *  检测是否含有某个字符
 *
 *  @param str 检测是否含有的字符
 *
 *  @return YES 含有 NO 不含有
 */
- (BOOL)ly_containsString:(NSString *)str;

/**
 *  检测是否含有汉字字符
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_containsChineseCharacter;


#pragma mark - 计算字符串尺寸
/**
 *  计算字符串高度 （多行）
 *
 *  @param width 字符串的宽度
 *  @param font  字体大小
 *
 *  @return 字符串的尺寸
 */
- (CGSize)ly_heightWithWidth:(CGFloat)width andFont:(CGFloat)font;

/**
 *  计算字符串宽度
 *
 *  @param height 字符串的高度
 *  @param font  字体大小
 *
 *  @return 字符串的尺寸
 */
- (CGSize)ly_widthWithHeight:(CGFloat)height andFont:(CGFloat)font;


#pragma mark - 正则匹配
/**
 *  匹配Email
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isEmail;

/**
 *  匹配URL
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isURL;

/**
 *  匹配电话号码+手机号码
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isTelephone;

/**
 *  匹配邮编
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isValidZipCode;

/**
 *  验证是否由字母或数字组成 minLength-maxLength位 密码
 *
 *  @param minLength 密码最短长度
 *  @param maxLength 密码最长长度
 *
 *  @return YES 验证成功 NO 验证失败
 */
- (BOOL)ly_isPasswordWithMinLength:(NSUInteger)minLength maxLength:(NSUInteger)maxLength;

/**
 *  匹配数字
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isNumbers;

/**
 *  匹配英文字母
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isLetter;

/**
 *  匹配大写英文字母
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isCapitalLetter;

/**
 *  匹配小写英文字母
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isSmallLetter;

/**
 *  匹配小写英文字母
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isLetterAndNumbers;

/**
 *  匹配中文，英文字母和数字及_
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isChineseAndLetterAndNumberAndBelowLine;

/**
 *  匹配中文，英文字母和数字及_ 并限制字数4-10位
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isChineseAndLetterAndNumberAndBelowLine4to10;

/**
 *  匹配含有汉字、数字、字母、下划线不能以下划线开头和结尾
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isChineseAndLetterAndNumberAndBelowLineNotFirstOrLast;

/**
 *  最长不得超过7个汉字，或14个字节(数字，字母和下划线)正则表达式
 *
 *  @return YES 成功 NO 失败
 */
- (BOOL)ly_isBelow7ChineseOrBlow14LetterAndNumberAndBelowLine;


#pragma mark - 加密
/**
 *  MD5加密(32位 常规)
 *
 *  @return 加密后的字符串
 */
- (NSString *)ly_MD5;

/**
 *  MD5加密(16位)
 *
 *  @return 加密后的字符串
 */
- (NSString *)ly_MD5_16;

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


#pragma mark - 获得特殊字符串

/**
 *  日期+随机数的字符串（比如为文件命名）
 *
 *  @return 得到的字符串
 */
+ (NSString *)ly_getTimeAndRandomString;


#pragma mark - Json转义

/**
 *  将得到的json的回车替换转义字符
 *
 *  @return 得到替换后的字符串
 */
- (NSString *)ly_changeJsonEnter;


#pragma mark - Email 转换

/**
 *  将邮箱地址部分信息进行隐藏 转换为 312******@qq.com 形式
 *
 *  @return 隐藏后的邮箱地址
 */
- (NSString *)ly_emailChangeToPrivacy;


#pragma mark - Emoji

/**
 *  判断字符串时候含有Emoji
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isIncludingEmoji;

/**
 *  移除掉字符串中得Emoji
 *
 *  @return 得到移除后的Emoji
 */
- (instancetype)ly_removedEmojiString;


@end
