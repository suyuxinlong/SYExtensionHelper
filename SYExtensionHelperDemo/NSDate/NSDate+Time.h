//
//  NSDate+Time.h
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Time)

/// 当时时间戳
+ (NSString *)currentTimestamp;

/// 是否是24小时制
@property (nonatomic, assign, readonly) BOOL is24Hour;

/// 时间戳 单位毫秒
@property (nonatomic, copy, readonly) NSString *timestamp;

/// 标准格式时间
@property (nonatomic, copy, readonly) NSString *STD;

/// 昨天0点时间戳 单位毫秒
@property (nonatomic, copy, readonly) NSString *zeroYesterday;

/// 今天0点时间戳 单位毫秒
@property (nonatomic, copy, readonly) NSString *zeroToday;

/// 明天0点时间戳 单位毫秒
@property (nonatomic, copy, readonly) NSString *zeroTomorrow;

/// date ---> 自定义格式时间
/// - Parameter format: 指定的日期格式 例如：yyyy-MM-dd HH:mm:ss | yyyy年MM月dd日 HH:mm
- (NSString *)dateWithFormat:(NSString *)format;


/// 时间戳 ---> date
/// - Parameter timestamp: 时间戳 单位毫秒
+ (NSDate *)dateWithTimestamp:(long long)timestamp;

/// 时间戳 ---> 标准格式时间
/// - Parameter timestamp: 时间戳 单位毫秒
+ (NSString *)UTCWithTimestamp:(long long)timestamp;

/// 时间戳 ---> 自定义格式时间
/// - Parameters:
///   - timestamp: 时间戳 单位毫秒
///   - format: 指定的日期格式 例如：yyyy-MM-dd HH:mm:ss | yyyy年MM月dd日 HH:mm
+ (NSString *)UTCWithTimestamp:(long long)timestamp format:(NSString *)format;

/// 标准格式时间 ---> 时间戳 单位毫秒
/// - Parameter UTCStr: 标准格式时间
+ (NSString *)timestampWithUTC:(NSString *)UTCStr;

/// 自定义格式时间 ---> 时间戳 单位毫秒
/// - Parameters:
///   - UTCStr: 自定义格式时间
///   - format: 指定的日期格式 例如：yyyy-MM-dd HH:mm:ss | yyyy年MM月dd日 HH:mm
+ (NSString *)timestampWithUTC:(NSString *)UTCStr format:(NSString *)format;

/// 标准格式时间 ---> date
/// - Parameter std: 标准格式时间 24小时制：‘yyyy-MM-dd HH:mm:ss’ 12小时制：‘yyyy-MM-dd a hh:mm:ss’
+ (NSDate *)dateWithTime:(NSString *)std;

/// 自定义格式的时间 ---> date
/// - Parameters:
///   - time: 自定义格式的时间，需要和format格式一致
///   - format: 指定的日期格式 例如：yyyy-MM-dd HH:mm:ss | yyyy年MM月dd日 HH:mm
+ (NSDate *)dateWithTime:(NSString *)time format:(NSString *)format;

/// 获取两个时间戳差值 返回一个自定义格式时间
/// - Parameters:
///   - aTime: 时间戳 单位毫秒
///   - bTime: 时间戳 单位毫秒
///   - format: 日期格式 例如：yyyy-MM-dd HH:mm:ss | yyyy年MM月dd日 HH:mm
+ (NSString *)getTimeGapWithA:(long long)aTime b:(long long)bTime format:(NSString *)format;

@end

NS_ASSUME_NONNULL_END
