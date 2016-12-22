//
//  NSDate+LYAssets.m
//  LYToolAssetsLocal
//
//  Created by ylei on 16/8/24.
//  Copyright © 2016年 Lei Yang. All rights reserved.
//

#import "NSDate+LYAssets.h"
#define D_MINUTE      60
#define D_HOUR        3600
#define D_DAY         86400
#define D_WEEK        604800
#define D_YEAR        31556926

static const unsigned componentFlags = (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal);


@implementation NSDate (LYAssets)
/**
 *  获获取当前客户端的逻辑日历
 *
 *  @return 当前客户端的逻辑日历
 */
+ (NSCalendar *)ly_currentCalendar {
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar) {
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    }
    return sharedCalendar;
}

/**
 *  获获取当前客户端的逻辑日历
 *
 *  @return 当前客户端的逻辑日历
 */
+ (NSCalendar *)ly_currentUTCCalendar {
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar) {
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
        sharedCalendar.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    }
    return sharedCalendar;
}

/**
 *  将日期转换为当前时区的日期
 *
 *  @param aDate 要转换的日期
 *
 *  @return 转换过的日期
 */
+ (NSDate *)ly_convertDateToLocalTime:(NSDate *)aDate {
    NSTimeZone *nowTimeZone = [NSTimeZone localTimeZone];
    NSInteger timeOffset = [nowTimeZone secondsFromGMTForDate:aDate];
    NSDate *newDate = [aDate dateByAddingTimeInterval:timeOffset];
    return newDate;
}

#pragma mark - 相对日期
/**
 *  现在的日期
 *
 *  @return 现在的日期
 */
+ (NSDate *)ly_dateNow {
    return [self ly_convertDateToLocalTime:[NSDate date]];
}

/**
 *  明天的日期
 *
 *  @return 明天的日期
 */
+ (NSDate *)ly_dateTomorrow {
    return [self ly_convertDateToLocalTime:[[NSDate date] ly_dateByAddingDays:1]];
}

/**
 *  昨天的日期
 *
 *  @return 昨天日期
 */
+ (NSDate *)ly_dateYesterday {
    return [self ly_convertDateToLocalTime:[[NSDate date] ly_dateBySubtractingDays:1]];
}

/**
 *  从现在起向后推几天的日期
 *
 *  @param days 向后推的天数
 *
 *  @return 后推得到的日期
 */
+ (NSDate *)ly_dateWithDaysFromNow:(NSInteger)days {
    return [self ly_convertDateToLocalTime:[[NSDate date] ly_dateByAddingDays:days]];
}

/**
 *  从现在起向前推几天的日期
 *
 *  @param days 向前推的天数
 *
 *  @return 前推得到的日期
 */
+ (NSDate *)ly_dateWithDaysBeforeNow:(NSInteger)days {
    return [self ly_convertDateToLocalTime:[[NSDate date] ly_dateBySubtractingDays:days]];
}

/**
 *  从现在起向后推几小时的日期
 *
 *  @param dHours 向后推的小时数
 *
 *  @return 后推得到的日期
 */
+ (NSDate *)ly_dateWithHoursFromNow:(NSInteger)dHours {
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self ly_convertDateToLocalTime:newDate];
}

/**
 *  从现在起向前推几小时的日期
 *
 *  @param dHours 向前推的小时数
 *
 *  @return 前推得到的日期
 */
+ (NSDate *)ly_dateWithHoursBeforeNow:(NSInteger)dHours {
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self ly_convertDateToLocalTime:newDate];
}

/**
 *  从现在起向后推几分钟的日期
 *
 *  @param dMinutes 向后推的分钟数
 *
 *  @return 后推得到的日期
 */
+ (NSDate *)ly_dateWithMinutesFromNow:(NSInteger)dMinutes {
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self ly_convertDateToLocalTime:newDate];
}

/**
 *  从现在起向前推几分钟的日期
 *
 *  @param dMinutes 向前推的分钟数
 *
 *  @return 前推得到的日期
 */
+ (NSDate *)ly_dateWithMinutesBeforeNow:(NSInteger)dMinutes {
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self ly_convertDateToLocalTime:newDate];
}



#pragma mark - 日期转换为String
// 使用NSDateFormatter转换时间字符串时，默认的时区是系统时区，如我们使用一般都是北京时间(＋8)

/**
 *  通过format格式将当前日期转换为String格式
 *
 *  @param format 格式样式
 *
 *  @return 转换后得到的String
 */
- (NSString *)ly_stringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

/**
 *  通过系统自带的时间风格 来得到字符串
 *
 *  @param dateStyle 日期格式 年月日
 *  @param timeStyle 时间格式 时分秒
 *
 *  @return 得到最终的字符串
 */
- (NSString *)ly_stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    formatter.dateStyle = dateStyle;
    formatter.timeStyle = timeStyle;
    return [formatter stringFromDate:self];
}

/**
 *  5/5/15, 10:48 AM
 *
 *  @return 相应格式的日期+时间
 */
- (NSString *)ly_shortString {
    return [self ly_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
}

/**
 *  10:48 AM
 *
 *  @return 相应格式的时间
 */
- (NSString *)ly_shortTimeString {
    return [self ly_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
}

/**
 *  5/5/15
 *
 *  @return 响应格式的日期
 */
- (NSString *)ly_shortDateString {
    return [self ly_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
}

/**
 *  May 5, 2015, 10:35:23 AM
 *
 *  @return 相应格式的日期+时间
 */
- (NSString *)ly_mediumString {
    return [self ly_stringWithDateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle ];
}

/**
 *  10:35:23 AM
 *
 *  @return 相应格式的时间
 */
- (NSString *)ly_mediumTimeString {
    return [self ly_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle ];
}

/**
 *  May 5, 2015
 *
 *  @return 相应格式的日期
 */
- (NSString *)ly_mediumDateString {
    return [self ly_stringWithDateStyle:NSDateFormatterMediumStyle  timeStyle:NSDateFormatterNoStyle];
}

/**
 *  May 5, 2015 at 10:35:23 AM GMT+8
 *
 *  @return 相应格式的日期+时间
 */
- (NSString *)ly_longString {
    return [self ly_stringWithDateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterLongStyle ];
}

/**
 *  May 5, 2015
 *
 *  @return 相应格式的时间
 */
- (NSString *)ly_longTimeString {
    return [self ly_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterLongStyle ];
}

/**
 *  10:35:23 AM GMT+8
 *
 *  @return 相应格式的日期
 */
- (NSString *)ly_longDateString {
    return [self ly_stringWithDateStyle:NSDateFormatterLongStyle  timeStyle:NSDateFormatterNoStyle];
}

#pragma mark - 日期比较
/**
 *  抛弃时间外 日期是否相等 精确到天的范围内
 *
 *  @param aDate 比较的date
 *
 *  @return YES 相等 NO 不相等
 */
- (BOOL)ly_isEqualToDateIgnoringTime:(NSDate *)aDate {
    NSDateComponents *components1 = [[NSDate ly_currentUTCCalendar] components:componentFlags fromDate:self];
    NSDateComponents *components2 = [[NSDate ly_currentUTCCalendar] components:componentFlags fromDate:aDate];
    return ((components1.year == components2.year) &&
            (components1.month == components2.month) &&
            (components1.day == components2.day));
}

/**
 *  日期是不是今天
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isToday {
    return [self ly_isEqualToDateIgnoringTime:[NSDate ly_dateNow]];
}

/**
 *  日期是不是明天
 *
 *  @return YES  是 NO 不是
 */
- (BOOL)ly_isTomorrow {
    return [self ly_isEqualToDateIgnoringTime:[NSDate ly_dateTomorrow]];
}

/**
 *  是不是昨天
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isYesterday {
    return [self ly_isEqualToDateIgnoringTime:[NSDate ly_dateYesterday]];
}

/**
 *  判断和指定日期是否是同一个星期内的
 *
 *  @param aDate 相比较的日期
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isSameWeekAsDate:(NSDate *)aDate {
    NSDateComponents *components1 = [[NSDate ly_currentUTCCalendar] components:componentFlags fromDate:self];
    NSDateComponents *components2 = [[NSDate ly_currentUTCCalendar] components:componentFlags fromDate:aDate];
    // Must be same week. 12/31 and 1/1 will both be week "1" if they are in the same week
    if (components1.weekOfYear != components2.weekOfYear)return NO;
    // Must have a time interval under 1 week. Thanks @aclark
    return (abs((int)[self timeIntervalSinceDate:aDate])< D_WEEK);
}

/**
 *  判断是不是本周
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isThisWeek {
    return [self ly_isSameWeekAsDate:[NSDate ly_dateNow]];
}

/**
 *  判断是不是下周
 *
 *  @return YES 是 NO  不是
 */
- (BOOL)ly_isNextWeek {
    NSTimeInterval aTimeInterval = [[NSDate ly_dateNow] timeIntervalSinceReferenceDate] + D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self ly_isSameWeekAsDate:newDate];
}

/**
 *  判断是不是上周
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isLastWeek {
    NSTimeInterval aTimeInterval = [[NSDate ly_dateNow] timeIntervalSinceReferenceDate] - D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self ly_isSameWeekAsDate:newDate];
}

/**
 *  判断是不是同一个月
 *
 *  @param aDate 比较的日期
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isSameMonthAsDate:(NSDate *)aDate {
    NSDateComponents *components1 = [[NSDate ly_currentUTCCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
    NSDateComponents *components2 = [[NSDate ly_currentUTCCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:aDate];
    return ((components1.month == components2.month)&&
            (components1.year == components2.year));
}

/**
 *  判断是不是本月
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isThisMonth {
    return [self ly_isSameMonthAsDate:[NSDate ly_dateNow]];
}

/**
 *  判断是不是上个月
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isLastMonth {
    return [self ly_isSameMonthAsDate:[[NSDate ly_dateNow] ly_dateBySubtractingMonths:1]];
}

/**
 *  判断是不是下个月
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isNextMonth {
    return [self ly_isSameMonthAsDate:[[NSDate ly_dateNow] ly_dateByAddingMonths:1]];
}

/**
 *  判断是不是同一年
 *
 *  @param aDate 比较的日期
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isSameYearAsDate:(NSDate *)aDate {
    NSDateComponents *components1 = [[NSDate ly_currentUTCCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate ly_currentUTCCalendar] components:NSCalendarUnitYear fromDate:aDate];
    return (components1.year == components2.year);
}

/**
 *  判断是不是本年
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isThisYear {
    return [self ly_isSameYearAsDate:[NSDate ly_dateNow]];
}

/**
 *  判断是不是下一年
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isNextYear {
    NSDateComponents *components1 = [[NSDate ly_currentUTCCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate ly_currentUTCCalendar] components:NSCalendarUnitYear fromDate:[NSDate ly_dateNow]];
    
    return (components1.year == (components2.year + 1));
}

/**
 *  判断是不是上一年
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isLastYear {
    NSDateComponents *components1 = [[NSDate ly_currentUTCCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate ly_currentUTCCalendar] components:NSCalendarUnitYear fromDate:[NSDate ly_dateNow]];
    
    return (components1.year == (components2.year - 1));
}

/**
 *  判断是不是比指定日期早
 *
 *  @param aDate 指定的日期
 *
 *  @return YES 早 NO 不早
 */
- (BOOL)ly_isEarlierThanDate:(NSDate *)aDate {
    return ([self compare:aDate] == NSOrderedAscending);
}

/**
 *  判断是不是比指定日期晚
 *
 *  @param aDate 指定的日期
 *
 *  @return YES 晚 NO 不晚
 */
- (BOOL)ly_isLaterThanDate:(NSDate *)aDate {
    return ([self compare:aDate] == NSOrderedDescending);
}

/**
 *  判断一个日期是不是在将来
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isInFuture {
    return ([self ly_isLaterThanDate:[NSDate ly_dateNow]]);
}

/**
 *  判断一个日期是不是在过去
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isInPast {
    return ([self ly_isEarlierThanDate:[NSDate ly_dateNow]]);
}


#pragma mark - 星期内工作日
/**
 *  是不是周六日
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isTypicallyWeekend {
    NSDateComponents *components = [[NSDate ly_currentUTCCalendar] components:NSCalendarUnitWeekday fromDate:self];
    if ((components.weekday == 1)||
        (components.weekday == 7))
        return YES;
    return NO;
}

/**
 *  是不是工作日
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)ly_isTypicallyWorkday {
    return ![self ly_isTypicallyWeekend];
}

#pragma mark - 调整日期
/**
 *  指定日期后推几年得到的日期
 *
 *  @param dYears 后推的年数
 *
 *  @return 后推后得到的日期
 */
- (NSDate *)ly_dateByAddingYears:(NSInteger)dYears {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:dYears];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

/**
 *  指定日期前推几年得到的日期
 *
 *  @param dYears 前推的年数
 *
 *  @return 前推得到的日期
 */
- (NSDate *)ly_dateBySubtractingYears:(NSInteger)dYears {
    return [self ly_dateByAddingYears:-dYears];
}

/**
 *  指定日期后推几个月得到的日期
 *
 *  @param dMonths 后推的月数
 *
 *  @return 后推后得到的日期
 */
- (NSDate *)ly_dateByAddingMonths:(NSInteger)dMonths {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth:dMonths];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

/**
 *  指定日期前推几个月得到的日期
 *
 *  @param dMonths 前推的月数
 *
 *  @return 前推后得到的日期
 */
- (NSDate *)ly_dateBySubtractingMonths:(NSInteger)dMonths {
    return [self ly_dateByAddingMonths:-dMonths];
}

/**
 *  指定日期后推几天得到的日期
 *
 *  @param dDays 后推的天数
 *
 *  @return 后推得到的日期
 */
- (NSDate *)ly_dateByAddingDays:(NSInteger)dDays {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:dDays];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

/**
 *  指定日期前推几天的到的日期
 *
 *  @param dDays 前推的天数
 *
 *  @return 前推得到的日期
 */
- (NSDate *)ly_dateBySubtractingDays:(NSInteger)dDays {
    return [self ly_dateByAddingDays:-dDays];
}

/**
 *  指定日期后推几小时得到的日期
 *
 *  @param dHours 后推的几个小时
 *
 *  @return 后推后的日期
 */
- (NSDate *)ly_dateByAddingHours:(NSInteger)dHours {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

/**
 *  指定日期前推几小时得到的日期
 *
 *  @param dHours 前推的小时数
 *
 *  @return 前推后得到的日期
 */
- (NSDate *)ly_dateBySubtractingHours:(NSInteger)dHours {
    return [self ly_dateByAddingHours:-dHours];
}

/**
 *  指定日期后推几分钟得到的日期
 *
 *  @param dMinutes 后推的分钟数
 *
 *  @return 后推得到的日期
 */
- (NSDate *)ly_dateByAddingMinutes:(NSInteger)dMinutes {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

/**
 *  指定日期前推几分钟得到的日期
 *
 *  @param dMinutes 前推的分钟数
 *
 *  @return 前推得到的日期
 */
- (NSDate *)ly_dateBySubtractingMinutes:(NSInteger)dMinutes {
    return [self ly_dateByAddingMinutes:-dMinutes];
}


#pragma mark - 极端日期
/**
 *  得到指定日期这一天的开始日期
 *
 *  @return 得到的日期
 */
- (NSDate *)ly_dateAtStartOfDay {
    NSDateComponents *components = [[NSDate ly_currentUTCCalendar] components:componentFlags fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [[NSDate ly_currentUTCCalendar] dateFromComponents:components];
}

/**
 *  得到指定日期这一天的结束日期
 *
 *  @return 得到的日期
 */
- (NSDate *)ly_dateAtEndOfDay {
    NSDateComponents *components = [[NSDate ly_currentUTCCalendar] components:componentFlags fromDate:self];
    components.hour = 23; // Thanks Aleksey Kononov
    components.minute = 59;
    components.second = 59;
    return [[NSDate ly_currentUTCCalendar] dateFromComponents:components];
}

#pragma mark - 日期间隔
/**
 *  指定日期和给的日期之间相差的时间
 *
 *  @param aDate 比较的日期
 *
 *  @return 相差的时间
 */
- (NSDateComponents *)ly_componentsWithOffsetFromDate:(NSDate *)aDate {
    NSDateComponents *dTime = [[NSDate ly_currentUTCCalendar] components:componentFlags fromDate:aDate toDate:self options:0];
    return dTime;
}

/**
 *  得到当前日期在给定日期之后的分钟数
 *
 *  @param aDate 给定的日期
 *
 *  @return 得到的分钟数
 */
- (NSInteger)ly_minutesAfterDate:(NSDate *)aDate {
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger)(ti / D_MINUTE);
}

/**
 *  得到当前日期在给定日期之前的分钟数
 *
 *  @param aDate 给定的日期
 *
 *  @return 得到的分钟数
 */
- (NSInteger)ly_minutesBeforeDate:(NSDate *)aDate {
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger)(ti / D_MINUTE);
}

/**
 *  得到当前日期在给定日期之后的小时数
 *
 *  @param aDate 给定的日期
 *
 *  @return 得到的小时数
 */
- (NSInteger)ly_hoursAfterDate:(NSDate *)aDate {
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger)(ti / D_HOUR);
}

/**
 *  得到当前日期在给定日期之后的小时数
 *
 *  @param aDate 给定的日期
 *
 *  @return 得到的小时数
 */
- (NSInteger)ly_hoursBeforeDate:(NSDate *)aDate {
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger)(ti / D_HOUR);
}

/**
 *  得到当前日期在给定日期之后的天数
 *
 *  @param aDate 给定的日期
 *
 *  @return 得到的天数
 */
- (NSInteger)ly_daysAfterDate:(NSDate *)aDate {
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger)(ti / D_DAY);
}

/**
 *  得到当前日期在给定日期之后的天数
 *
 *  @param aDate 给定的日期
 *
 *  @return 得到的天数
 */
- (NSInteger)ly_daysBeforeDate:(NSDate *)aDate {
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger)(ti / D_DAY);
}

/**
 *  当前的日期和给定的日期之间相差的天数
 *
 *  @param anotherDate 给定的日期
 *
 *  @return 相差的天数
 */
- (NSInteger)ly_distanceInDaysToDate:(NSDate *)anotherDate {
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay fromDate:self toDate:anotherDate options:0];
    return components.day;
}

#pragma mark - 日期分解
/**
 *  距离当前时间最近的小时 比如9：55 就是10：00 9：25就是9：00
 *
 *  @return 最近的小时
 */
- (NSInteger)ly_nearestHour {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_MINUTE * 30;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    NSDateComponents *components = [[NSDate ly_currentUTCCalendar] components:NSCalendarUnitHour fromDate:newDate];
    return components.hour;
}

/**
 *  当前日期的小时
 *
 *  @return 当前日期的小时
 */
- (NSInteger)ly_hour {
    NSDateComponents *components = [[NSDate ly_currentUTCCalendar] components:componentFlags fromDate:self];
    return components.hour;
}

/**
 *  当前日期的分钟
 *
 *  @return 当前日期的分钟
 */
- (NSInteger)ly_minute {
    NSDateComponents *components = [[NSDate ly_currentUTCCalendar] components:componentFlags fromDate:self];
    return components.minute;
}

/**
 *  当前日期的秒
 *
 *  @return 当前日期的秒
 */
- (NSInteger)ly_seconds {
    NSDateComponents *components = [[NSDate ly_currentUTCCalendar] components:componentFlags fromDate:self];
    return components.second;
}

/**
 *  当前日期的几号
 *
 *  @return 当前日期的几号
 */
- (NSInteger)ly_day {
    NSDateComponents *components = [[NSDate ly_currentUTCCalendar] components:componentFlags fromDate:self];
    return components.day;
}

/**
 *  当前日期的几月
 *
 *  @return 当前日期的几月
 */
- (NSInteger)ly_month {
    NSDateComponents *components = [[NSDate ly_currentUTCCalendar] components:componentFlags fromDate:self];
    return components.month;
}

/**
 *  当前月的第几周
 *
 *  @return 当前月的第几周
 */
- (NSInteger)ly_weekOfMonth {
    NSDateComponents *components = [[NSDate ly_currentUTCCalendar] components:componentFlags fromDate:self];
    return components.weekOfMonth;
}

/**
 *  当前年的第几周
 *
 *  @return 当前年的第几周
 */
- (NSInteger)ly_weekOfYear {
    NSDateComponents *components = [[NSDate ly_currentUTCCalendar] components:componentFlags fromDate:self];
    return components.weekOfYear;
}

/**
 *  当前日期所在周的第几天
 *
 *  @return 第几天
 */
- (NSInteger)ly_weekday {
    NSDateComponents *components = [[NSDate ly_currentUTCCalendar] components:componentFlags fromDate:self];
    return components.weekday;
}

/**
 *  当前日期所在星期几(星期一)在本月第几次出现，与 weekOfMonth 当前月的第几周不一样
 *
 *  @return 第几次出现
 */
- (NSInteger)ly_nthWeekday {
    NSDateComponents *components = [[NSDate ly_currentUTCCalendar] components:componentFlags fromDate:self];
    return components.weekdayOrdinal;
}

/**
 *  当前日期的年
 *
 *  @return 当前日期的年
 */
- (NSInteger)ly_year {
    NSDateComponents *components = [[NSDate ly_currentUTCCalendar] components:componentFlags fromDate:self];
    return components.year;
}

@end
