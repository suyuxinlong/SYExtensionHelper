//
//  NSDate+Chinese.h
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/9.
/**
 GMT 格林威治标准时间
 UTC 协调世界时
 
 日期格式 例如：yyyy-MM-dd HH:mm:ss
 yyyy 年
 MM   月
 dd   日
 HH   小时（24小时制）
 hh   小时（12小时制）
 mm   分钟
 ss   秒
 
 NSDate时间不是当地时间，是格林威治标准时间，也是伦敦时间，转换为时间格式的时候，才会根据时区显示不同的时间
 时间戳都是格林威治标准时间戳，是1970年1月1号0点0分0秒开始计算
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 中国农历相关
@interface NSDate (Chinese)

/// 是否是闰年
@property (nonatomic, assign, readonly) BOOL isLunarYear;
/// 农历年
@property (nonatomic, copy, readonly) NSString *chineseYear;
/// 农历月
@property (nonatomic, copy, readonly) NSString *chineseMonth;
/// 农历天
@property (nonatomic, copy, readonly) NSString *chineseDay;
/// 农历年月日信息
@property (nonatomic, copy, readonly) NSString *chineseLunar;
/// 生肖
@property (nonatomic, copy, readonly) NSString *chineseZodiacs;

@end

NS_ASSUME_NONNULL_END
