//
//  NSDictionary+SYExtension.h
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (SYExtension)

/// 是否为空
@property (nonatomic, assign, readonly) BOOL isEmpty;

/// 数组转json
@property (nonatomic, copy, readonly) NSString *json;


/// 字典是否包含关键词
/// - Parameter key: 关键词
- (BOOL)containsKey:(NSString *)key;



@end

NS_ASSUME_NONNULL_END
