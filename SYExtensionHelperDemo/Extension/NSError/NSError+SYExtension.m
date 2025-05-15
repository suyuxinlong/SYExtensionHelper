//
//  NSError+SYExtension.m
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/15.
//

#import "NSError+SYExtension.h"

@implementation NSError (SYExtension)

- (NSString *)message {
    NSString *errMsg = self.userInfo[NSLocalizedDescriptionKey];
    if (!errMsg) {
        errMsg = self.userInfo[@"NSLocalizedFailureReason"];
    }
    return errMsg;
}
- (void)setMessage:(NSString *)message {
    self.message = message;
}
+ (NSError *)errorWithCode:(NSInteger)code errorMessage:(NSString *)errMsg {
    NSError *error = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:code userInfo:@{NSLocalizedDescriptionKey:errMsg}];
    return error;
}

@end
