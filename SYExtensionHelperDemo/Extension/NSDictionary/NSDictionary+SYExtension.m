//
//  NSDictionary+SYExtension.m
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/12.
//

#import "NSDictionary+SYExtension.h"

@implementation NSDictionary (SYExtension)

- (BOOL)isEmpty {
    return (self == nil || self.allKeys.count == 0 || [self isKindOfClass:[NSNull class]] || ![self isKindOfClass:[NSDictionary class]]);
}

- (NSString *)json {
    if (self.isEmpty) return nil;
    if ([NSJSONSerialization isValidJSONObject:self]) { // 可以序列化被转换成json
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
        if (jsonData) {
            NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            return jsonString;
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}

- (BOOL)containsKey:(NSString *)key {
    return [[self allKeys] containsObject:key];
}

@end
