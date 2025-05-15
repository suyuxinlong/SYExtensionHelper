//
//  NSString+SYExtension.m
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/15.
//

#import "NSString+SYExtension.h"

@implementation NSString (SYExtension)

- (BOOL)isEmpty {
    if (![self isKindOfClass:[NSString class]]) {
        return YES;
    }
    if (self == nil || self == NULL || [self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    if ([self isEqualToString:@"<null>"]) {
        return YES;
    }
    if ([self isEqualToString:@"(null)"]) {
        return YES;
    }
    if ([[self lowercaseString] isEqualToString:@"null"]) {
        return YES;
    }
    return NO;
}
- (BOOL)isJson {
    if (self.length < 2) return NO;
    if (!([self hasPrefix:@"{"] || [self hasPrefix:@"["])) return NO;
    return [self characterAtIndex:self.length-1]-[self characterAtIndex:0] == 2;
}

+ (BOOL)checkWithPassword:(NSString *)password {
    if (password.length < 1) return NO;
    if (password.length < 8 || password.length > 16) return NO;
    
    NSMutableArray *yesArray = [[NSMutableArray alloc] init];
    if ([self checkWithabc:password] || [self checkWithABC:password]) {
        [yesArray addObject:@"1"];
    }
    if ([self checkWithNumber:password]) {
        [yesArray addObject:@"1"];
    }
    if (yesArray.count == 0) {
        return NO;
    } else if (yesArray.count == 2) {
        return YES;
    } else {
        NSString *str = password;
        for (int i = 0; i < password.length; i++) {
            NSString *temp = [password substringWithRange:NSMakeRange(i,1)];
            if ([self checkWithabc:temp] || [self checkWithABC:temp] || [self checkWithNumber:temp]) {
                str = [str stringByReplacingOccurrencesOfString:temp withString:@""];
            }
        }
        if (str.length > 0) {
            return YES;
        }
    }
    return NO;
    
}
+ (BOOL)checkWithPhone:(NSString *)phone {
    if (phone.length < 1) return NO;
    
    NSString *phoneRegex = @"^(1[3-9])\\d{9}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:phone];
}
+ (BOOL)checkWithEmail:(NSString *)email {
    if (email.length < 1) return NO;
    
    NSString * emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate * emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
+ (BOOL)checkWithABC:(NSString *)ABC {
    if (ABC.length < 1) return NO;
    
    NSString *pattern = @"[A-Z]"; // 正则表达式模式
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error]; // 创建NSRegularExpression对象
    NSArray<NSTextCheckingResult *> *matches = [regex matchesInString:ABC options:0 range:NSMakeRange(0, ABC.length)]; // 进行匹配
    if (matches.count > 0) {
        NSLog(@"字符串中包含大写字母");
        return YES;
    }
    NSLog(@"字符串中不包含大写字母");
    return NO;
}
+ (BOOL)checkWithabc:(NSString *)abc {
    if (abc.length < 1) return NO;
    
    NSString *pattern = @"[a-z]"; // 正则表达式模式
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error]; // 创建NSRegularExpression对象
    NSArray<NSTextCheckingResult *> *matches = [regex matchesInString:abc options:0 range:NSMakeRange(0, abc.length)]; // 进行匹配
    if (matches.count > 0) {
        NSLog(@"字符串中包含小写字母");
        return YES;
    }
    NSLog(@"字符串中不包含小写字母");
    return NO;
}
+ (BOOL)checkWithNumber:(NSString *)number {
    if (number.length < 1) return NO;
    
    NSString *pattern = @"[0-9]"; // 正则表达式模式
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error]; // 创建NSRegularExpression对象
    NSArray<NSTextCheckingResult *> *matches = [regex matchesInString:number options:0 range:NSMakeRange(0, number.length)]; // 进行匹配
    if (matches.count > 0) {
        NSLog(@"字符串中包含大写字母");
        return YES;
    }
    NSLog(@"字符串中不包含大写字母");
    return NO;
}

@end
