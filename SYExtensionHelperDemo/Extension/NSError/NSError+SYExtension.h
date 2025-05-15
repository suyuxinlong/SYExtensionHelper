//
//  NSError+SYExtension.h
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSError (SYExtension)

/// 错误内容
@property (nonatomic, copy) NSString *message;

/// 初始化生成一个Error数据
/// - Parameters:
///   - code: 错误code
///   - errMsg: 错误内容
+ (NSError *)errorWithCode:(NSInteger)code errorMessage:(NSString *)errMsg;

@end

NS_ASSUME_NONNULL_END
