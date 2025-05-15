//
//  NSArray+SYExtension.h
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (SYExtension)

/// 是否为空
@property (nonatomic, assign, readonly) BOOL isEmpty;

/// 数组转json
@property (nonatomic, copy, readonly) NSString *json;

@end

NS_ASSUME_NONNULL_END
