//
//  NSDate+Calendar.m
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/9.
//

#import "NSDate+Calendar.h"

@implementation NSDate (Calendar)

- (NSString *)year {
    return [self dateWithFormat:@"yyyy"];
}

- (NSString *)month {
    return [self dateWithFormat:@"MM"];
}

- (NSString *)day {
    return [self dateWithFormat:@"dd"];
}

- (NSString *)hour24 {
    return [self dateWithFormat:@"HH"];
}

- (NSString *)hour12 {
    return [self dateWithFormat:@"hh"];
}

- (NSString *)minutes {
    return [self dateWithFormat:@"mm"];
}

- (NSString *)seconds {
    return [self dateWithFormat:@"ss"];
}

- (NSInteger)weekday {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.locale = [NSLocale currentLocale];
    return [calendar component:NSCalendarUnitWeekday fromDate:self];
}

- (NSString *)weekdayName {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [NSLocale currentLocale];
    [formatter setDateFormat:@"EEEE"];
    NSString *weekdayName = [formatter stringFromDate:self];
    return weekdayName;
}

- (NSInteger)dayNumWithMonth {
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSRange daysRange = [gregorianCalendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];
    return daysRange.length;
}
- (BOOL)isAM {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [NSLocale currentLocale];
    [formatter setDateFormat:@"a"];
    NSString *ampm = [formatter stringFromDate:self];
    return [ampm isEqual:@"AM"];
}

/// date ---> 自定义格式时间
- (NSString *)dateWithFormat:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale currentLocale];
    [dateFormatter setDateFormat:format];
    NSString *dateStr = [dateFormatter stringFromDate:self];
    return dateStr;
}

@end
