//
//  NSArray+SYExtension.m
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/9.
//

#import "NSArray+SYExtension.h"
#import <objc/runtime.h>

@implementation NSArray (SYExtension)

#pragma mark - 是否为空
- (BOOL)isEmpty {
    return (self == nil || self.count == 0 || [self isKindOfClass:[NSNull class]] || ![self isKindOfClass:[NSArray class]]);
}

#pragma mark - 转json字符串
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

#pragma mark - 数组防止崩溃
//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        // 不可变数组
//        Class clsI = NSClassFromString(@"__NSArrayI");
//        [self swizzleInstanceMethod:clsI
//                        originalSel:@selector(objectAtIndex:)
//                        swizzledSel:@selector(safe_objectAtIndex:)];
//        
//        // 可变数组
//        Class clsM = NSClassFromString(@"__NSArrayM");
//        [self swizzleInstanceMethod:clsM
//                        originalSel:@selector(insertObject:atIndex:)
//                        swizzledSel:@selector(safe_insertObject:atIndex:)];
//        [self swizzleInstanceMethod:clsM
//                        originalSel:@selector(objectAtIndex:)
//                        swizzledSel:@selector(safe_objectAtIndex:)];
//        [self swizzleInstanceMethod:clsM
//                        originalSel:@selector(replaceObjectAtIndex:withObject:)
//                        swizzledSel:@selector(safe_replaceObjectAtIndex:withObject:)];
//    });
//}
//
//+ (void)swizzleInstanceMethod:(Class)class originalSel:(SEL)originalSel swizzledSel:(SEL)swizzledSel {
//    Method originalMethod = class_getInstanceMethod(class, originalSel);
//    Method swizzledMethod = class_getInstanceMethod(class, swizzledSel);
//    
//    BOOL didAddMethod = class_addMethod(class, originalSel, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
//    if (didAddMethod) {
//        class_replaceMethod(class, swizzledSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
//    } else {
//        method_exchangeImplementations(originalMethod, swizzledMethod);
//    }
//}
//
//- (void)safe_objectAtIndex:(NSUInteger)index {
//    if (index >= self.count) {
//        NSLog(@"【⚠️⚠️⚠️⚠️⚠️】 数组越界：index %lu 超出长度 %lu", (unsigned long)index, (unsigned long)self.count);
//        return;
//    }
//    [self safe_objectAtIndex:index];
//}
//
//- (void)safe_insertObject:(id)object atIndex:(NSUInteger)index {
//    if (!object) {
//        NSLog(@"【⚠️⚠️⚠️⚠️⚠️】 插入 nil 对象到可变数组");
//        return;
//    }
//    if (index > self.count) {
//        NSLog(@"【⚠️⚠️⚠️⚠️⚠️】 插入位置越界：index %lu 超出长度 %lu", (unsigned long)index, (unsigned long)self.count);
//        return;
//    }
//    [self safe_insertObject:object atIndex:index];
//}
//
//- (void)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)object {
//    if (index >= self.count) {
//        NSLog(@"【⚠️⚠️⚠️⚠️⚠️】 替换越界：index %lu 超出长度 %lu", (unsigned long)index, (unsigned long)self.count);
//        return;
//    }
//    if (!object) {
//        NSLog(@"【⚠️⚠️⚠️⚠️⚠️】 替换对象为 nil");
//        return;
//    }
//    [self safe_replaceObjectAtIndex:index withObject:object];
//}
@end
