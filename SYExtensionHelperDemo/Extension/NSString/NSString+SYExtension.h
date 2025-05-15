//
//  NSString+SYExtension.h
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SYExtension)

/// 判断字符串是否为空
@property (nonatomic, assign) BOOL isEmpty;
/// 是否是json字符串
@property (nonatomic, assign, readonly) BOOL isJson;

#pragma mark - 正则表达式
/// 正则表达式【密码】密码长度8-16位，数字、字母、字符至少包含两种
/// - Parameter password: 密码
+ (BOOL)checkWithPassword:(NSString *)password;
/// 正则表达式【国内手机号】
/// - Parameter phone: 国内手机号
+ (BOOL)checkWithPhone:(NSString *)phone;
/// 正则表达式【邮箱】
/// - Parameter phone: 邮箱
+ (BOOL)checkWithEmail:(NSString *)email;
/// 正则表达式【大写字母】
/// - Parameter ABC: 字符串
+ (BOOL)checkWithABC:(NSString *)ABC;
/// 正则表达式【小写字母】
/// - Parameter abc: 字符串
+ (BOOL)checkWithabc:(NSString *)abc;
/// 正则表达式【数字】
/// - Parameter number: 字符串
+ (BOOL)checkWithNumber:(NSString *)number;

@end

NS_ASSUME_NONNULL_END
