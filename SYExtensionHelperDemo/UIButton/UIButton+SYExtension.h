//
//  UIButton+SYExtension.h
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef  NS_ENUM (NSInteger, KButtonLayoutImageStyle){
    kButtonLayoutImageStyleTop = 0,   //图片在上，文字在下
    kButtonLayoutImageStyleLeft,      //图片在左，文字在右
    kButtonLayoutImageStyleBottom,    //图片在下，文字在上
    kButtonLayoutImageStyleRight,     //图片在右，文字在左
};

@interface UIButton (SYExtension)

// 扩大 Button 的点击范围
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;

/// 设置按钮图文上下排列
/// @param spacing 间距
- (void)verticalImageAndTitleWithSpace:(CGFloat)spacing;

/// 设置按钮图文水平排列
/// @param spacing 间距
- (void)horizontalImageAndTitleWithSpace:(CGFloat)spacing;

/// 处理 BUTTON 图片和文字排版样式
/// @param style 版本样式枚举值
/// @param space 图片和标题的间距
- (void)layoutButtonWithImageStyle:(KButtonLayoutImageStyle)style imageTitleToSpace:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END
