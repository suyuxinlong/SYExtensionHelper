//
//  UIAlertController+SYExtension.h
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (SYExtension)

/// 弹窗提示
/// @param title 标题
/// @param message 信息
/// @param cancelButtonTitle 取消按钮
/// @param otherButtonTitles 其他按钮
/// @param block 点击执行的 block，0 代表取消，1 代表其他按钮中第一个
+ (UIAlertController *)showAlertWithTitle:(NSString *)title
                                  message:(NSString *)message
                        cancelButtonTitle:(NSString *)cancelButtonTitle
                        otherButtonTitles:(NSArray *)otherButtonTitles
                                  handler:(void (^)(NSInteger buttonIndex))block;


/// sheet 提示
/// @param title 标题
/// @param buttonTitles 其他按钮
/// @param destructiveTitle 毁灭按钮
/// @param cancelButtonTitle 取消按钮
/// @param block 点击执行的 block，0 代表取消，-1 代表毁灭，1 代表其他按钮中第一个
+ (UIAlertController *)showActionSheetWithTitle:(NSString * _Nullable)title
                                   buttonTitles:(NSArray *)buttonTitles
                               destructiveTitle:(NSString * _Nullable)destructiveTitle
                              cancelButtonTitle:(NSString *)cancelButtonTitle
                                        handler:(void (^)(NSInteger buttonIndex))block;

/// alert 输入框
/// @param placeholdStr 占位符，根据数组创建输入框
/// @param title 标题
/// @param message 信息
/// @param cancelButtonTitle 取消按钮
/// @param otherButtonTitles 其他按钮
/// @param block 点击执行的 block，0 代表取消，1 代表其他按钮中第一个
+ (UIAlertController *)showTextFeildWithPlaceholder:(NSString *)placeholdStr
                                           andTitle:(NSString *)title
                                            message:(NSString *)message
                                  cancelButtonTitle:(NSString *)cancelButtonTitle
                                  otherButtonTitles:(NSArray *)otherButtonTitles
                                            handler:(void (^)(NSInteger buttonIndex, NSString *text))block;
/// alert 输入框
/// @param placeholdStr 占位符，根据数组创建输入框
/// @param title 标题
/// @param text textfeild上的内容
/// @param cancelButtonTitle 取消按钮
/// @param otherButtonTitles 其他按钮
/// @param block 点击执行的 block，0 代表取消，1 代表其他按钮中第一个
+ (UIAlertController *)showTextFeildWithPlaceholder:(NSString *)placeholdStr
                                           andTitle:(NSString *)title
                                               text:(NSString *)text
                                  cancelButtonTitle:(NSString *)cancelButtonTitle
                                  otherButtonTitles:(NSArray *)otherButtonTitles
                                            handler:(void (^)(NSInteger buttonIndex, NSString *text))block;

@end

NS_ASSUME_NONNULL_END
