//
//  UIViewController+SYExtension.m
//
//  Created by 苏余昕龙 on 2025/5/13.
//

#import "UIViewController+SYExtension.h"

@implementation UIViewController (SYExtension)

+ (UIViewController *)currentVC {
    UIViewController *result = nil;
    UIWindow *window = k_KeyWindow();
    
    if (window.subviews.count > 0) {
        UIView *frontView = [window.subviews objectAtIndex:0];
        id nextResponder  = [frontView nextResponder];

        if ([nextResponder isKindOfClass:[UIViewController class]]){
            result = nextResponder;
        } else {
            result = window.rootViewController;
        }
    } else {
        result = window.rootViewController;
    }
    if ([result isKindOfClass:[UITabBarController class]]) {
        result = [((UITabBarController*)result) selectedViewController];
    }
    if ([result isKindOfClass:[UINavigationController class]]) {
        result = [((UINavigationController*)result) visibleViewController];
    }
    return result;
}

+ (UIViewController *)topVC {
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    while(topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    return topController;
}

/// 主 window
static inline UIWindow *k_KeyWindow(void) {
    UIWindow *window = nil;
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes) {
            if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                for (UIWindow *w in windowScene.windows) {
                    if (window.isKeyWindow) {
                        window = w;
                        break;
                    }
                }
            }
        }
    }
    if (!window) {
        window = [UIApplication sharedApplication].windows.firstObject;
        if (!window.isKeyWindow) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
            UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
#pragma clang diagnostic pop
            if (CGRectEqualToRect(keyWindow.bounds, UIScreen.mainScreen.bounds)) {
                window = keyWindow;
            }
        }
    }
    return window;
}

@end
