//
//  NSDate+category.m
//  CommonCategory
//
//  Created by Tang杰 on 2018/12/28.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import "NSDate+category.h"

@implementation NSDate (category)

+ (NSString *)timeStringWithDate:(NSDate *)date
{
    NSTimeInterval interval = -[date timeIntervalSinceDate:[NSDate date]];
    interval = interval < 1 ? 1 : interval;
    if (interval < 60) {
        return [NSString stringWithFormat:@"%.f秒前",interval];
    }
    else if (interval / 60 < 60)
    {
        return [NSString stringWithFormat:@"%.f分钟前",interval / 60];
    }
    else if (interval / 3600 < 24)
    {
        return [NSString stringWithFormat:@"%.f小时前",interval / 3600];
    }
    else
    {
        return [NSString stringWithFormat:@"%.f天前",interval / 3600 / 24];
    }
}

//日期格式转字符串
+ (NSString *)dateToString:(NSDate *)date withDateFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

//字符串转日期格式
+ (NSDate *)stringToDate:(NSString *)dateString withDateFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    
    NSDate *date = [dateFormatter dateFromString:dateString];
    return date;
}

//将世界时间转化为中国区时间
+ (NSDate *)worldTimeToChinaTime:(NSDate *)date
{
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    NSInteger interval = [timeZone secondsFromGMTForDate:date];
    NSDate *localeDate = [date  dateByAddingTimeInterval:interval];
    return localeDate;
}

//获取指定时间周、月、年第一天和最后一天日期
+ (NSDictionary *)getFirstDayAndLastDayByUnit:(NSCalendarUnit)unit Formatter:(NSString *)formatter Date:(NSDate *)date{
    
    double interval = 0;
    NSDate *beginDate = nil;
    NSDate *endDate = nil;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setFirstWeekday:2];//设定周一为周首日
    BOOL ok = [calendar rangeOfUnit:unit startDate:&beginDate interval:&interval forDate:date];
    //分别修改为 NSCalendarUnitWeekOfMonth NSCalendarUnitMonth NSCalendarUnitYear
    if (ok) {
        endDate = [beginDate dateByAddingTimeInterval:interval-1];
    }else {
        return @{@"beginDate":@"",@"endDate":@""};
    }
    NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];
    [myDateFormatter setDateFormat:formatter];
    NSString *beginString = [myDateFormatter stringFromDate:beginDate];
    NSString *endString = [myDateFormatter stringFromDate:endDate];
    
    return @{@"beginDate":beginString,@"endDate":endString};
}

+ (NSString *)whatDayWithNumber:(NSInteger)number
{
    switch (number) {
        case 0:
            return @"星期日";
            break;
        case 1:
            return @"星期一";
            break;
        case 2:
            return @"星期二";
            break;
        case 3:
            return @"星期三";
            break;
        case 4:
            return @"星期四";
            break;
        case 5:
            return @"星期五";
            break;
        default:
            return @"星期六";
            break;
    }
}

+ (NSString *)weekStringWithDate:(NSDate *)date
{
    NSInteger week = [NSDate getweekDayWithDate:date];
    switch (week) {
        case 0:
            return @"周日";
            break;
        case 1:
            return @"周一";
            break;
        case 2:
            return @"周二";
            break;
        case 3:
            return @"周三";
            break;
        case 4:
            return @"周四";
            break;
        case 5:
            return @"周五";
            break;
        default:
            return @"周六";
            break;
    }
}

+ (NSInteger) getweekDayWithDate:(NSDate *) date
{
    NSDateComponents *comps = [NSDate dateComponentByDate:date];
    
    return [comps weekday]-1;
}

+ (NSDateComponents *)dateComponentByDate:(NSDate *)date
{
    NSCalendar *calendar = [NSDate currentCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekdayOrdinal;
    
    comps = [calendar components:unitFlags fromDate:date];
    
    return comps;
}

- (int) year {
    return [[NSDate dateComponentByDate:self] year];
}


- (int) month {
    return [[NSDate dateComponentByDate:self] month];
}

- (int) day {
    return [[NSDate dateComponentByDate:self] day];
}

- (int) whatDay
{
    return [[NSDate dateComponentByDate:self] weekday]-1;
}

- (int) hour
{
    return [[NSDate dateComponentByDate:self] hour];
}
//向前或向后几年、几月、几天
+ (NSDate *)dateForwardOrBackYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day Date:(NSDate *)date
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *comps = nil;
    
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitMonth fromDate:date];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setYear:year];
    
    [adcomps setMonth:month];
    
    [adcomps setDay:day];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:date options:0];
    
    return newdate;
}
/**
 *  是否为同一天
 */
+ (BOOL)isSameDay:(NSDate*)date1 date2:(NSDate*)date2
{
    NSDateComponents* comp1 = [NSDate dateComponentByDate:date1];
    NSDateComponents* comp2 = [NSDate dateComponentByDate:date2];
    
    return [comp1 day]   == [comp2 day] &&
    [comp1 month] == [comp2 month] &&
    [comp1 year]  == [comp2 year];
}

/**
 *  是否为同一年
 */
+ (BOOL)isSameYear:(NSDate*)date1 date2:(NSDate*)date2
{
    NSDateComponents* comp1 = [NSDate dateComponentByDate:date1];
    NSDateComponents* comp2 = [NSDate dateComponentByDate:date2];
    
    return [comp1 year]  == [comp2 year];
}

/**
 *  是否为同一月
 */
+ (BOOL)isSameMonth:(NSDate*)date1 date2:(NSDate*)date2
{
    NSDateComponents* comp1 = [NSDate dateComponentByDate:date1];
    NSDateComponents* comp2 = [NSDate dateComponentByDate:date2];
    
    return [comp1 month] == [comp2 month] && [comp1 year]  == [comp2 year];
}

+ (BOOL)isSameWeek:(NSDate*)date1 date2:(NSDate*)date2
{
    BOOL isSameMonth = [NSDate isSameMonth:date1 date2:date2];
    [NSDate weekdayOrdinalByDate:date1];
    [NSDate weekdayOrdinalByDate:date1];
    
    return [NSDate weekdayOrdinalByDate:date1] == [NSDate weekdayOrdinalByDate:date2] && isSameMonth;
}

// 当前时间对应的月份中有几天
+ (NSInteger)howManyDaysByMonthDate:(NSDate *)date
{
    return [[NSDate currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
}

// 当前时间对应的月份中有几周（firstWeekday会影响到这个结果）
+ (NSInteger)howManyWeeksByMonthDate:(NSDate *)date
{
    return  [[NSDate currentCalendar] rangeOfUnit:NSCalendarUnitWeekOfMonth inUnit:NSCalendarUnitMonth forDate:date].length;
}

//获取指定日期为所在月的第几周
+ (NSInteger)weekdayOrdinalByDate:(NSDate *)date
{
    return [[NSDate currentCalendar] ordinalityOfUnit:NSCalendarUnitWeekOfMonth inUnit:NSCalendarUnitMonth forDate:date];
}

// 当前时间对应的周是当前年中的第几周
+ (NSInteger)howManyWeeksOfYearByDate:(NSDate *)date
{
    return [[NSDate currentCalendar] ordinalityOfUnit:NSCalendarUnitWeekOfYear inUnit:NSCalendarUnitYear forDate:date];
}
+ (NSCalendar *)currentCalendar
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    currentCalendar.firstWeekday = 2;
    
    return currentCalendar;
}
@end
