//
//  UIImageView+SYExtension.h
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (SYExtension)

/// 设置圆角
/// - Parameter corners: 圆角位置
/// - Parameter radii: 设置圆角半径
- (void)setRoundedWithCorner:(UIRectCorner)corners radii:(CGFloat)radii;

/// 设置圆角
/// - Parameters:
///   - corners: 圆角位置
///   - radii: 设置圆角半径
///   - rect: 尺寸
- (void)setRoundedWithCorner:(UIRectCorner)corners radii:(CGFloat)radii rect:(CGRect)rect;

@end

NS_ASSUME_NONNULL_END
