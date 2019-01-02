//
//  NSDate+category.h
//  CommonCategory
//
//  Created by Tang杰 on 2018/12/28.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import <Foundation/Foundation.h>


#define yyyy @"yyyy"
#define yyyy_MM @"yyyy-MM"
#define dd @"dd"
#define yyyy_MM_dd_HH_mm @"yyyy-MM-dd HH:mm"
#define yyyy_MM_dd_HH_mm_ss @"yyyy-MM-dd HH:mm:ss"
#define yyyy_MM_dd_HH_mm_ss_zzz @"yyyy-MM-dd HH:mm:ss zzz"
#define y_M_d_H_m_s @"yyyy年MM月dd日 HH时mm分ss秒"
#define yyyy_MM_dd @"yyyy-MM-dd"  //1999-01-01日
#define yyyy_M_d_point @"yyyy.M.d" //1999.1.1
#define MM_dd @"MM月dd日" //@"12月23日"
#define MM_dd_point @"MM.dd"  //  01.01
#define M_d_point @"M.d"  //1.1

@interface NSDate (category)

- (NSInteger) year;

- (NSInteger) month;

- (NSInteger) day;

- (NSInteger) weekday;

- (NSInteger) hour;

- (NSInteger) minute;

- (NSInteger) second;

//将世界时间转化为系统时区区时间
+ (NSDate *)worldTimeToSystemTime:(NSDate *)date;

//日期格式转字符串
+ (NSString *)dateToString:(NSDate *)date withDateFormat:(NSString *)format;

//字符串转日期格式
+ (NSDate *)stringToDate:(NSString *)dateString withDateFormat:(NSString *)format;

//获取指定时间周、月、年第一天和最后一天日期
//return @{@"beginDate":NSString,@"endDate":NSString};
+ (NSDictionary *)getFirstDayAndLastDayByUnit:(NSCalendarUnit)unit Formatter:(NSString *)formatter Date:(NSDate *)date;

//获取指定日期为周几， 1、2、3、。。。0
+ (NSInteger)getweekDayWithDate:(NSDate *)date;

//获取指定日期为周几 return 周一，二、、、日
+ (NSString *)weekStringWithDate:(NSDate *)date;

//根据1、2、3。。。0返回星期一。。。星期日
+ (NSString *)whatDayWithNumber:(NSInteger)number;

//向前或向后几年、几月、几天
+ (NSDate *)dateForwardOrBackYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day Date:(NSDate *)date;

// *  是否为同一天
+ (BOOL)isSameDay:(NSDate*)date1 date2:(NSDate*)date2;
/**
 *  是否为同一周
 */
+ (BOOL)isSameWeek:(NSDate*)date1 date2:(NSDate*)date2;
/**
 *  是否为同一月
 */
+ (BOOL)isSameMonth:(NSDate*)date1 date2:(NSDate*)date2;
/**
 *  是否为同一年
 */
+ (BOOL)isSameYear:(NSDate*)date1 date2:(NSDate*)date2;
// 当前时间对应的月份中有几天
+ (NSInteger)howManyDaysByMonthDate:(NSDate *)date;

// 当前时间对应的月份中有几周（firstWeekday会影响到这个结果）
+ (NSInteger)howManyWeeksByMonthDate:(NSDate *)date;

// 当前时间对应的周是当前年中的第几周
+ (NSInteger)howManyWeeksOfYearByDate:(NSDate *)date;

//获取指定日期为所在月的第几周
+ (NSInteger)weekdayOrdinalByDate:(NSDate *)date;

@end
