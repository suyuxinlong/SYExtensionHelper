//
//  UIButton+SYExtension.m
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/9.
//

#import "UIButton+SYExtension.h"
#import <objc/runtime.h>

@implementation UIButton (SYExtension)

static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;

- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left {
    objc_setAssociatedObject(self, &topNameKey,    [NSNumber numberWithFloat:top],    OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey,  [NSNumber numberWithFloat:right],  OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey,   [NSNumber numberWithFloat:left],   OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)zzmEnlargedRect {
    NSNumber *topEdge    = objc_getAssociatedObject(self, &topNameKey);
    NSNumber *rightEdge  = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber *bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber *leftEdge   = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge) {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue, self.bounds.origin.y - topEdge.floatValue, self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue, self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    } else {
        return self.bounds;
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect rect = [self zzmEnlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}

- (void)verticalImageAndTitleWithSpace:(CGFloat)spacing {
    CGSize imageSize = self.imageView.image.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
    
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
}

- (void)horizontalImageAndTitleWithSpace:(CGFloat)spacing {
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, - spacing / 2, 0 , spacing / 2);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing / 2, 0, -spacing / 2);
}

- (void)layoutButtonWithImageStyle:(KButtonLayoutImageStyle)style imageTitleToSpace:(CGFloat)space {
    CGFloat imageWidth  = self.currentImage.size.width;
    CGFloat imageHeight = self.currentImage.size.height;
    CGFloat titleWidth  = self.titleLabel.intrinsicContentSize.width;
    CGFloat titleHeight = self.titleLabel.intrinsicContentSize.height;
    
    if (titleWidth == 0) {
        CGSize titleSize = [self.titleLabel.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 44) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil].size;
        titleWidth = self.titleLabel.frame.size.width;
    }

    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets titleEdgeInsets = UIEdgeInsetsZero;

    switch (style) {
        case kButtonLayoutImageStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, titleHeight + space/2, -titleWidth);
            titleEdgeInsets = UIEdgeInsetsMake(imageHeight + space/2, -imageWidth, 0, 0);
        }
            break;
        case kButtonLayoutImageStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, space / 2);
            titleEdgeInsets = UIEdgeInsetsMake(0, space / 2, 0, 0);
        }
            break;
        case kButtonLayoutImageStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(titleHeight + space / 2, 0, 0, -titleWidth);
            titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, imageHeight + space / 2, 0);
        }
            break;
        case kButtonLayoutImageStyleRight:
        {
            CGFloat p = space/2.0;
            imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth + p, 0, -titleWidth - p);
            titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth - p, 0, imageWidth + p);
        }
            break;
    }
    self.imageEdgeInsets = imageEdgeInsets;
    self.titleEdgeInsets = titleEdgeInsets;
    
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
}

@end
