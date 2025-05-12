//
//  NSDate+Chinese.m
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/9.
//

#import "NSDate+Chinese.h"

@implementation NSDate (Chinese)

- (BOOL)isLunarYear {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *febComponents = [[NSDateComponents alloc] init];
    [febComponents setYear:[self dateWithFormat:@"yyyy"].integerValue];
    [febComponents setMonth:[self dateWithFormat:@"MM"].integerValue];
    [febComponents setDay:[self dateWithFormat:@"dd"].integerValue];
    NSDate *febDate = [calendar dateFromComponents:febComponents];
    NSRange febRange = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:febDate];
    return (febRange.length == 29);
}

- (NSString *)chineseYear {
    NSCalendar *chineseCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [chineseCalendar setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    NSDateComponents *components = [chineseCalendar components:NSCalendarUnitYear fromDate:self];
    return [[self class] chineseEraYearForYear:components.year];
}

- (NSString *)chineseMonth {
    NSCalendar *chineseCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    [chineseCalendar setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    NSDateComponents *components = [chineseCalendar components:NSCalendarUnitMonth fromDate:self];
    NSString *monthName = [[self class] chineseMonths][components.month - 1];
    if (components.leapMonth) {
        monthName = [NSString stringWithFormat:@"闰%@", monthName];
    }
    return monthName;
}

- (NSString *)chineseDay {
    NSCalendar *chineseCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    [chineseCalendar setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    NSDateComponents *components = [chineseCalendar components:NSCalendarUnitDay fromDate:self];
    NSString *dayName = [[self class] chineseDays][components.day - 1];
    return dayName;
}

- (NSString *)chineseLunar {
    return [NSString stringWithFormat:@"%@年%@%@ %@", self.chineseYear, self.chineseMonth, self.chineseDay, self.chineseZodiacs];
}

- (NSString *)chineseZodiacs {
    NSCalendar *chineseCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [chineseCalendar setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    NSDateComponents *components = [chineseCalendar components:NSCalendarUnitYear fromDate:self];
    NSInteger branchIndex = (components.year - 4) % 12;
    branchIndex = branchIndex < 0 ? branchIndex + 12 : branchIndex;
    return [[self class] zodiacs][branchIndex];
}
// 将数字年份转换为天干地支（如 2023 → 癸卯）
+ (NSString *)chineseEraYearForYear:(NSInteger)year {
    NSInteger stemIndex   = (year - 4) % 10;
    NSInteger branchIndex = (year - 4) % 12;
    stemIndex   = stemIndex   < 0 ? stemIndex + 10   : stemIndex;
    branchIndex = branchIndex < 0 ? branchIndex + 12 : branchIndex;
    return [NSString stringWithFormat:@"%@%@", [self heavenlyStems][stemIndex], [self earthlyBranches][branchIndex]];
}
// 天干数组
+ (NSArray *)heavenlyStems {
    return @[@"甲", @"乙", @"丙", @"丁", @"戊", @"己", @"庚", @"辛", @"壬", @"癸"];
}
// 地支数组
+ (NSArray *)earthlyBranches {
    return @[@"子", @"丑", @"寅", @"卯", @"辰", @"巳", @"午", @"未", @"申", @"酉", @"戌", @"亥"];
}
// 农历月份数组
+ (NSArray *)chineseMonths {
    return @[@"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"冬月", @"腊月"];
}
// 农历天数组
+ (NSArray *)chineseDays {
    return @[@"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十", @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十", @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十"];
}
+ (NSArray *)zodiacs {
    return @[@"鼠", @"牛", @"虎", @"兔", @"龙", @"蛇", @"马", @"羊", @"猴", @"鸡", @"狗", @"猪"];
}

- (NSString *)dateWithFormat:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale currentLocale];
    [dateFormatter setDateFormat:format];
    NSString *dateStr = [dateFormatter stringFromDate:self];
    return dateStr;
}

@end
