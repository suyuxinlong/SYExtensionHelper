//
//  UIView+SYExtension.m
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/9.
//

#import "UIView+SYExtension.h"

@implementation UIView (SYExtension)

- (void)setRoundedWithCorner:(UIRectCorner)corners radii:(CGFloat)radii {
    [self setRoundedWithCorner:corners radii:radii rect:self.bounds];
}

- (void)setRoundedWithCorner:(UIRectCorner)corners radii:(CGFloat)radii rect:(CGRect)rect {
    if (rect.size.width == 0 || rect.size.height == 0) return;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:CGSizeMake(radii,radii)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = rect;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
