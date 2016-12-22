//
//  NSDate+LYAssets.h
//  LYToolAssetsLocal
//
//  Created by ylei on 16/8/24.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LYAssets)

/**
 *  获获取当前客户端的逻辑日历(本地时区)
 *
 *  @return 当前客户端的逻辑日历
 */
+ (NSCalendar *)ly_currentCalendar;

/**
 *  获获取当前客户端的逻辑日历(世界标准时区)
 *
 *  @return 当前客户端的逻辑日历
 */
+ (NSCalendar *)ly_currentUTCCalendar;

/**
 *  将日期转换为当前时区的日期
 *
 *  @param aDate 要转换的日期
 *
 *  @return 转换过的日期
 */
+ (NSDate *)ly_convertDateToLocalTime:(NSDate *)aDate;


#pragma mark - 相对日期

/**
 *  现在的日期
 *
 *  @return 现在的日期
 */
+ (NSDate *)ly_dateNow;

/**
 *  明天的日期
 *
 *  @return 明天的日期
 */
+ (NSDate *)ly_dateTomorrow;

/**
 *  昨天的日期
 *
 *  @return 昨天日期
 */
+ (NSDate *)ly_dateYesterday;

/**
 *  从现在起向后推几天的日期
 *
 *  @param days 向后推的天数
 *
 *  @return 后推得到的日期
 */
+ (NSDate *)ly_dateWithDaysFromNow:(NSInteger)days;

/**
 *  从现在起向前推几天的日期
 *
 *  @param days 向前推的天数
 *
 *  @return 前推得到的日期
 */
+ (NSDate *)ly_dateWithDaysBeforeNow:(NSInteger)days;

/**
 *  从现在起向后推几小时的日期
 *
 *  @param dHours 向后推的小时数
 *
 *  @return 后推得到的日期
 */
+ (NSDate *)ly_dateWithHoursFromNow:(NSInteger)dHours;

/**
 *  从现在起向前推几小时的日期
 *
 *  @param dHours 向前推的小时数
 *
 *  @return 前推得到的日期
 */
+ (NSDate *)ly_dateWithHoursBeforeNow:(NSInteger)dHours;

/**
 *  从现在起向后推几分钟的日期
 *
 *  @param dMinutes 向后推的分钟数
 *
 *  @return 后推得到的日期
 */
+ (NSDate *)ly_dateWithMinutesFromNow:(NSInteger)dMinutes;

/**
 *  从现在起向前推几分钟的日期
 *
 *  @param dMinutes 向前推的分钟数
 *
 *  @return 前推得到的日期
 */
+ (NSDate *)ly_dateWithMinutesBeforeNow:(NSInteger)dMinutes;


#pragma mark - 日期转字符串
/**
 *  通过format格式将当前日期转换为String格式
 *
 *  @param format 格式样式
 *
 *  @return 转换后得到的String
 */
- (NSString *)ly_stringWithFormat:(NSString *)format;

/**
 *  通过系统自带的时间风格 来得到字符串
 *
 *  @param dateStyle 日期格式 年月日
 *  @param timeStyle 时间格式 时分秒
 *
 *  @return 得到最终的字符串
 */
- (NSString *)ly_stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;

/**
 *  5/5/15, 10:48 AM 形式String
 */
@property (nonatomic, readonly) NSString *ly_shortString;

/**
 *  10:48 AM 形式String
 */
@property (nonatomic, readonly) NSString *ly_shortDateString;

/**
 *  5/5/15 形式String
 */
@property (nonatomic, readonly) NSString *ly_shortTimeString;

/**
 *  May 5, 2015, 10:35:23 AM 形式String
 */
@property (nonatomic, readonly) NSString *ly_mediumString;

/**
 *  10:35:23 AM 形式String
 */
@property (nonatomic, readonly) NSString *ly_mediumDateString;

/**
 *  May 5, 2015 形式String
 */
@property (nonatomic, readonly) NSString *ly_mediumTimeString;

/**
 *  May 5, 2015 at 10:35:23 AM GMT+8 形式String
 */
@property (nonatomic, readonly) NSString *ly_longString;

/**
 *  May 5, 2015 形式String
 */
@property (nonatomic, readonly) NSString *ly_longDateString;

/**
 *  10:35:23 AM GMT+8 形式String
 */
@property (nonatomic, readonly) NSString *ly_longTimeString;

#pragma mark - 日期比较
/**
 *  抛弃时间外 日期是否相等 精确到天的范围内
 *
 *  @param aDate 比较的date
 *
 *  @return YES 相等 NO 不相等
 */
- (BOOL)ly_isEqualToDateIgnoringTime:(NSDate *)aDate;

/**
 *  日期是不是今天
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isToday;

/**
 *  日期是不是明天
 *
 *  @return YES  是 NO 不是
 */
- (BOOL)ly_isTomorrow;

/**
 *  是不是昨天
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isYesterday;

/**
 *  判断和指定日期是否是同一个星期内的
 *
 *  @param aDate 相比较的日期
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isSameWeekAsDate:(NSDate *)aDate;

/**
 *  判断是不是本周
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isThisWeek;

/**
 *  判断是不是下周
 *
 *  @return YES 是 NO  不是
 */
- (BOOL)ly_isNextWeek;

/**
 *  判断是不是上周
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isLastWeek;

/**
 *  判断是不是同一个月
 *
 *  @param aDate 比较的日期
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isSameMonthAsDate:(NSDate *)aDate;

/**
 *  判断是不是本月
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isThisMonth;

/**
 *  判断是不是上个月
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isLastMonth;

/**
 *  判断是不是下个月
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isNextMonth;

/**
 *  判断是不是同一年
 *
 *  @param aDate 比较的日期
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isSameYearAsDate:(NSDate *)aDate;

/**
 *  判断是不是本年
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isThisYear;

/**
 *  判断是不是下一年
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isNextYear;

/**
 *  判断是不是上一年
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isLastYear;

/**
 *  判断是不是比指定日期早
 *
 *  @param aDate 指定的日期
 *
 *  @return YES 早 NO 不早
 */
- (BOOL)ly_isEarlierThanDate:(NSDate *)aDate;

/**
 *  判断是不是比指定日期晚
 *
 *  @param aDate 指定的日期
 *
 *  @return YES 晚 NO 不晚
 */
- (BOOL)ly_isLaterThanDate:(NSDate *)aDate;

/**
 *  判断一个日期是不是在将来
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isInFuture;

/**
 *  判断一个日期是不是在过去
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isInPast;

#pragma mark - 日期规则

/**
 *  是不是周六日
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isTypicallyWorkday;

/**
 *  是不是工作日
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isTypicallyWeekend;


#pragma mark - 调整日期
/**
 *  指定日期后推几年得到的日期
 *
 *  @param dYears 后推的年数
 *
 *  @return 后推后得到的日期
 */
- (NSDate *)ly_dateByAddingYears:(NSInteger)dYears;

/**
 *  指定日期前推几年得到的日期
 *
 *  @param dYears 前推的年数
 *
 *  @return 前推得到的日期
 */
- (NSDate *)ly_dateBySubtractingYears:(NSInteger)dYears;

/**
 *  指定日期后推几个月得到的日期
 *
 *  @param dMonths 后推的月数
 *
 *  @return 后推后得到的日期
 */
- (NSDate *)ly_dateByAddingMonths:(NSInteger)dMonths;

/**
 *  指定日期前推几个月得到的日期
 *
 *  @param dMonths 前推的月数
 *
 *  @return 前推后得到的日期
 */
- (NSDate *)ly_dateBySubtractingMonths:(NSInteger)dMonths;

/**
 *  指定日期后推几天得到的日期
 *
 *  @param dDays 后推的天数
 *
 *  @return 后推得到的日期
 */
- (NSDate *)ly_dateByAddingDays:(NSInteger)dDays;

/**
 *  指定日期前推几天的到的日期
 *
 *  @param dDays 前推的天数
 *
 *  @return 前推得到的日期
 */
- (NSDate *)ly_dateBySubtractingDays:(NSInteger)dDays;

/**
 *  指定日期后推几小时得到的日期
 *
 *  @param dHours 后推的几个小时
 *
 *  @return 后推后的日期
 */
- (NSDate *)ly_dateByAddingHours:(NSInteger)dHours;

/**
 *  指定日期前推几小时得到的日期
 *
 *  @param dHours 前推的小时数
 *
 *  @return 前推后得到的日期
 */
- (NSDate *)ly_dateBySubtractingHours:(NSInteger)dHours;

/**
 *  指定日期后推几分钟得到的日期
 *
 *  @param dMinutes 后推的分钟数
 *
 *  @return 后推得到的日期
 */
- (NSDate *)ly_dateByAddingMinutes:(NSInteger)dMinutes;

/**
 *  指定日期前推几分钟得到的日期
 *
 *  @param dMinutes 前推的分钟数
 *
 *  @return 前推得到的日期
 */
- (NSDate *)ly_dateBySubtractingMinutes:(NSInteger)dMinutes;


#pragma mark - 极端日期

/**
 *  得到指定日期这一天的开始日期
 *
 *  @return 得到的日期
 */
- (NSDate *)ly_dateAtStartOfDay;

/**
 *  得到指定日期这一天的结束日期
 *
 *  @return 得到的日期
 */
- (NSDate *)ly_dateAtEndOfDay;


#pragma mark - 日期间隔

/**
 *  指定日期和给的日期之间相差的时间
 *
 *  @param aDate 比较的日期
 *
 *  @return 相差的时间
 */
- (NSDateComponents *)ly_componentsWithOffsetFromDate:(NSDate *)aDate;

/**
 *  得到当前日期在给定日期之后的分钟数
 *
 *  @param aDate 给定的日期
 *
 *  @return 得到的分钟数
 */
- (NSInteger)ly_minutesAfterDate:(NSDate *)aDate;

/**
 *  得到当前日期在给定日期之前的分钟数
 *
 *  @param aDate 给定的日期
 *
 *  @return 得到的分钟数
 */
- (NSInteger)ly_minutesBeforeDate:(NSDate *)aDate;

/**
 *  得到当前日期在给定日期之后的小时数
 *
 *  @param aDate 给定的日期
 *
 *  @return 得到的小时数
 */
- (NSInteger)ly_hoursAfterDate:(NSDate *)aDate;

/**
 *  得到当前日期在给定日期之后的小时数
 *
 *  @param aDate 给定的日期
 *
 *  @return 得到的小时数
 */
- (NSInteger)ly_hoursBeforeDate:(NSDate *)aDate;

/**
 *  得到当前日期在给定日期之后的天数
 *
 *  @param aDate 给定的日期
 *
 *  @return 得到的天数
 */
- (NSInteger)ly_daysAfterDate:(NSDate *)aDate;

/**
 *  得到当前日期在给定日期之后的天数
 *
 *  @param aDate 给定的日期
 *
 *  @return 得到的天数
 */
- (NSInteger)ly_daysBeforeDate:(NSDate *)aDate;

/**
 *  当前的日期和给定的日期之间相差的天数
 *
 *  @param anotherDate 给定的日期
 *
 *  @return 相差的天数
 */
- (NSInteger)ly_distanceInDaysToDate:(NSDate *)anotherDate;

#pragma mark - 分解日期

/**
 *  距离当前时间最近的小时 比如9：55 就是10：00 9：25就是9：00
 */
@property (readonly) NSInteger ly_nearestHour;

/**
 *  当前日期的小时
 */
@property (readonly) NSInteger ly_hour;

/**
 *  当前日期的分钟
 */
@property (readonly) NSInteger ly_minute;

/**
 *  当前日期的秒
 */
@property (readonly) NSInteger ly_seconds;

/**
 *  当前日期的几号
 */
@property (readonly) NSInteger ly_day;

/**
 *  当前日期的几月
 */
@property (readonly) NSInteger ly_month;

/**
 *  当前月的第几周
 */
@property (readonly) NSInteger ly_weekOfMonth;

/**
 *  当前年的第几周
 */
@property (readonly) NSInteger ly_weekOfYear;

/**
 *  当前日期所在周的第几天
 */
@property (readonly) NSInteger ly_weekday;

/**
 *  当前日期所在星期几(星期一)在本月第几次出现，与 weekOfMonth 当前月的第几周不一样
 */
@property (readonly) NSInteger ly_nthWeekday;

/**
 *  当前日期的年
 */
@property (readonly) NSInteger ly_year;

@end
