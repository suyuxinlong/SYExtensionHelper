//
//  UIViewController+SYExtension.h
//
//  Created by 苏余昕龙 on 2025/5/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define kCurrentVC [UIViewController currentVC]

@interface UIViewController (SYExtension)

/// 返回当前控制器
+ (UIViewController *)currentVC;

/// 返回最顶部控制器
+ (UIViewController *)topVC;

@end

NS_ASSUME_NONNULL_END
