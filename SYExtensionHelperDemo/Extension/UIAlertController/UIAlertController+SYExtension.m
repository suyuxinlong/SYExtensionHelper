//
//  UIAlertController+SYExtension.m
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/15.
//

#import "UIAlertController+SYExtension.h"
#import "UIViewController+SYExtension.h"

@implementation UIAlertController (SYExtension)

+ (UIAlertController *)showAlertWithTitle:(NSString *)title
                                  message:(NSString *)message
                        cancelButtonTitle:(NSString *)cancelButtonTitle
                        otherButtonTitles:(NSArray *)otherButtonTitles
                                  handler:(void (^)(NSInteger buttonIndex))block {
    UIAlertController *alert = [self alertWithTitle:title
                                            message:message
                                  cancelButtonTitle:cancelButtonTitle
                                  otherButtonTitles:otherButtonTitles
                                            handler:block];
    
    if (![kCurrentVC isKindOfClass:[UIAlertController class]]) {
        [kCurrentVC presentViewController:alert animated:YES completion:nil];
    }
    
    return alert;
}

+ (UIAlertController *)showActionSheetWithTitle:(NSString *)title
                                   buttonTitles:(NSArray *)buttonTitles
                               destructiveTitle:(NSString *)destructiveTitle
                              cancelButtonTitle:(NSString *)cancelButtonTitle
                                        handler:(void (^)(NSInteger))block {
    UIAlertController *sheet = [self actionSheetWithTitle:title
                                             buttonTitles:buttonTitles
                                         destructiveTitle:destructiveTitle
                                        cancelButtonTitle:cancelButtonTitle
                                                  handler:block];
    
    UIViewController *vc = [self topViewController];
    [vc presentViewController:sheet animated:YES completion:nil];
    
    return sheet;
}

+ (UIAlertController *)showTextFeildWithPlaceholder:(NSString *)placeholdStr
                                           andTitle:(NSString *)title
                                            message:(NSString *)message
                                  cancelButtonTitle:(NSString *)cancelButtonTitle
                                  otherButtonTitles:(NSArray *)otherButtonTitles
                                            handler:(void (^)(NSInteger buttonIndex, NSString *text))block {
    UIAlertController *alert = [[self class] alertControllerWithTitle:title
                                                              message:nil
                                                       preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = message;
        textField.placeholder = placeholdStr;
//        [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UITextFieldTextDidChangeNotification object:textField] subscribeNext:^(NSNotification * _Nullable x) {
//            if (alert) {
//                UITextField *tff = alert.textFields.firstObject;
//                UIAlertAction *okAction = alert.actions.lastObject;
//                if (tff.text.length > 20) {
//                    tff.text = [tff.text substringToIndex:20];
//                }
//                okAction.enabled = tff.text.length > 2;
//            }
//        }];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction *action) {
        UITextField *tf = alert.textFields.firstObject;
        if (block) block(0, tf ? tf.text : @"");
    }];
    [alert addAction:cancelAction];
    
    [otherButtonTitles enumerateObjectsUsingBlock:^(NSString *button, NSUInteger index, BOOL *stop) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:button
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction *action) {
            UITextField *tf = alert.textFields.firstObject;
            if (block) block(index + 1, tf ? tf.text : @"");
        }];
        [alert addAction:action];
        
    }];
    // 注释掉，要不然有两行
    //    if (placeholdStr.length > 0) {
    //        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
    //            textField.placeholder = placeholdStr;
    //        }];
    //    }
    
    if (![kCurrentVC isKindOfClass:[UIAlertController class]]) {
        [kCurrentVC presentViewController:alert animated:YES completion:nil];
    }
    return alert;
}
+ (UIAlertController *)showTextFeildWithPlaceholder:(NSString *)placeholdStr
                                           andTitle:(NSString *)title
                                               text:(NSString *)text
                                  cancelButtonTitle:(NSString *)cancelButtonTitle
                                  otherButtonTitles:(NSArray *)otherButtonTitles
                                            handler:(void (^)(NSInteger, NSString * _Nonnull))block {
    UIAlertController *alert = [[self class] alertControllerWithTitle:title message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    if (placeholdStr.length > 0) {
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = placeholdStr;
            textField.text = text;
//            [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UITextFieldTextDidChangeNotification object:textField] subscribeNext:^(NSNotification * _Nullable x) {
//                if (alert) {
//                    UITextField *tff = alert.textFields.firstObject;
//                    UIAlertAction *okAction = alert.actions.lastObject;
//                    if (tff.text.length > 20) {
//                        tff.text = [tff.text substringToIndex:20];
//                    }
//                    okAction.enabled = tff.text.length > 0;
//                }
//            }];
        }];
    }
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        UITextField *tf = alert.textFields.firstObject;
        if (block) block(0, tf ? tf.text : @"");
    }];
    [alert addAction:cancelAction];
    
    [otherButtonTitles enumerateObjectsUsingBlock:^(NSString *button, NSUInteger index, BOOL *stop) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:button style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            UITextField *tf = alert.textFields.firstObject;
            if (block) block(index + 1, tf ? tf.text : @"");
        }];
        [alert addAction:action];
        
    }];
    
    if (![kCurrentVC isKindOfClass:[UIAlertController class]]) {
        [kCurrentVC presentViewController:alert animated:YES completion:nil];
    }
    
    return alert;
}

+ (UIAlertController *)alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles handler:(void (^)(NSInteger buttonIndex))block {
    
    UIAlertController *alert = [self alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle?:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        if (block) block(0);
    }];
    [alert addAction:cancelAction];
    
    if (otherButtonTitles) {
        [otherButtonTitles enumerateObjectsUsingBlock:^(NSString *button, NSUInteger index, BOOL *stop) {
            UIAlertAction *action = [UIAlertAction actionWithTitle:button style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                if (block) block(index + 1);
            }];
            [alert addAction:action];
        }];
    }
    return alert;
}

+ (UIAlertController *)actionSheetWithTitle:(NSString *)title buttonTitles:(NSArray *)buttonTitles destructiveTitle:(NSString *)destructiveTitle cancelButtonTitle:(NSString *)cancelButtonTitle handler:(void (^)(NSInteger buttonIndex))block {
    UIAlertController *sheet = [self alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:cancelButtonTitle?:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [sheet dismissViewControllerAnimated:YES completion:^{
            if (block) block(0);
        }];
    }];
    [sheet addAction:action1];
    
    if (destructiveTitle) {
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:destructiveTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            [sheet dismissViewControllerAnimated:YES completion:^{
                if (block) block(-1);
            }];
        }];
        [sheet addAction:action2];
    }
    
    [buttonTitles enumerateObjectsUsingBlock:^(NSString *button, NSUInteger index, BOOL *stop) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:button style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [sheet dismissViewControllerAnimated:YES completion:^{
                if (block) block(index + 1);
            }];
        }];
        [sheet addAction:action];
    }];
    return sheet;
}

+ (UIViewController *)topViewController {
    UIViewController *topController = [UIApplication sharedApplication].delegate.window.rootViewController;
    if (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    return topController;
}

@end
