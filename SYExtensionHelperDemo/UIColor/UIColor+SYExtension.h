//
//  UIColor+SYExtension.h
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define kColor(wColor, bColor) [UIColor setColorWithWhite:wColor black:bColor];

@interface UIColor (SYExtension)

/// 自定义设置颜色，暗黑模式自动适配
/// - Parameters:
///   - wColor: 正常模式颜色
///   - bColor: 暗黑模式颜色，nil的时候，默认为正常模式颜色
+ (UIColor *)setColorWithWhite:(NSString *)wColor black:(NSString * _Nullable)bColor;

/// 十六进制字符串 ----> UIColor 对象
/// - Parameter hexString: 十六进制字符串, 有无#都可以
+ (UIColor *)colorWithHex:(NSString *)hex;

@end

NS_ASSUME_NONNULL_END
