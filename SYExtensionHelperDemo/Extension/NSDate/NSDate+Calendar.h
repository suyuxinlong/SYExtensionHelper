//
//  NSDate+Calendar.h
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Calendar)

/// 年
@property (nonatomic, copy, readonly) NSString *year;
/// 月
@property (nonatomic, copy, readonly) NSString *month;
/// 日
@property (nonatomic, copy, readonly) NSString *day;
/// 小时 24小时制
@property (nonatomic, copy, readonly) NSString *hour24;
/// 小时 12小时制
@property (nonatomic, copy, readonly) NSString *hour12;
/// 分钟
@property (nonatomic, copy, readonly) NSString *minutes;
/// 秒
@property (nonatomic, copy, readonly) NSString *seconds;
/// 星期下标
@property (nonatomic, assign, readonly) NSInteger weekday;
/// 星期
@property (nonatomic, copy, readonly) NSString *weekdayName;
/// 是否是上午
@property (nonatomic, assign, readonly) BOOL isAM;
/// 获取当月有多少天
@property (nonatomic, assign, readonly) NSInteger dayNumWithMonth;

@end

NS_ASSUME_NONNULL_END
