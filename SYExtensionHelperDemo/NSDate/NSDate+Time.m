//
//  NSDate+Time.m
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/9.
//

#import "NSDate+Time.h"

/// 标准化时间显示格式
#define kStandardTime24 @"yyyy-MM-dd HH:mm:ss"
#define kStandardTime12 @"yyyy-MM-dd a hh:mm:ss"

@implementation NSDate (Time)

+ (NSString *)currentTimestamp {
    return [self date].timestamp;
}

+ (NSString *)zeroTimestamp {
    return [self timestampWithUTC:[[self dateWithTimestamp:[self currentTimestamp].longLongValue] dateWithFormat:@"yyyy-MM-dd 00:00:00"]];
}

- (BOOL)is24Hour {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateStyle:NSDateFormatterNoStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    NSString *dateString = [formatter stringFromDate:[NSDate date]];
    NSRange amRange = [dateString rangeOfString:[formatter AMSymbol]];
    NSRange pmRange = [dateString rangeOfString:[formatter PMSymbol]];
    return (amRange.location == NSNotFound && pmRange.location == NSNotFound);
}

- (NSString *)timestamp {
    NSTimeInterval time = [self timeIntervalSince1970] * 1000;
    return [NSString stringWithFormat:@"%.0f", time];
}

- (NSString *)STD {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale currentLocale];
    [dateFormatter setDateFormat:self.is24Hour?kStandardTime24:kStandardTime12];
    NSString *dateStr = [dateFormatter stringFromDate:self];
    return dateStr;
}

- (NSString *)zeroYesterday {
    NSString *time = [self dateWithFormat:@"yyyy-MM-dd 00:00:00"];
    return [NSString stringWithFormat:@"%lld", [[self class] timestampWithUTC:time].longLongValue - 24 * 60 * 60 * 1000];
}

- (NSString *)zeroToday {
    NSString *time = [self dateWithFormat:@"yyyy-MM-dd 00:00:00"];
    return [[self class] timestampWithUTC:time];
}

- (NSString *)zeroTomorrow {
    NSString *time = [self dateWithFormat:@"yyyy-MM-dd 00:00:00"];
    return [NSString stringWithFormat:@"%lld", [[self class] timestampWithUTC:time].longLongValue + 24 * 60 * 60 * 1000];
}

- (NSString *)dateWithFormat:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale currentLocale];
    [dateFormatter setDateFormat:format];
    NSString *dateStr = [dateFormatter stringFromDate:self];
    return dateStr;
}

+ (NSDate *)dateWithTimestamp:(long long)timestamp {
    return [NSDate dateWithTimeIntervalSince1970:timestamp/1000];
}

+ (NSString *)UTCWithTimestamp:(long long)timestamp {
    return [self UTCWithTimestamp:timestamp format:kStandardTime24];
}

+ (NSString *)UTCWithTimestamp:(long long)timestamp format:(NSString *)format {
    return [[NSDate dateWithTimeIntervalSince1970:timestamp/1000] dateWithFormat:format];
}

+ (NSString *)timestampWithUTC:(NSString *)UTCStr {
    return [self timestampWithUTC:UTCStr format:kStandardTime24];
}

+ (NSString *)timestampWithUTC:(NSString *)UTCStr format:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale currentLocale];
    [dateFormatter setDateFormat:format];
    NSDate *tempDate = [dateFormatter dateFromString:UTCStr];
    NSString *time = [NSString stringWithFormat:@"%ld", (long)[tempDate timeIntervalSince1970] * 1000];
    return time;
}

+ (NSDate *)dateWithTime:(NSString *)std {
    return [self dateWithTime:std format:kStandardTime24];
}

+ (NSDate *)dateWithTime:(NSString *)time format:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [NSLocale currentLocale];
    [formatter setDateFormat:format];
    return [formatter dateFromString:time];
}

+ (NSString *)getTimeGapWithA:(long long)aTime b:(long long)bTime format:(NSString *)format {
    long long ab = llabs(aTime - bTime);
    return [self UTCWithTimestamp:ab format:format];
}

@end
