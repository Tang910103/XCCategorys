//
//  UIView+layer.m
//  blm_CRM
//
//  Created by Tang杰 on 2018/10/15.
//  Copyright © 2018年 播了么. All rights reserved.
//

#import "UIView+layer.h"
#import <objc/runtime.h>

@implementation UIView (layer)
- (void)setBorderWidth:(CGFloat)borderWidth
{
    objc_setAssociatedObject(self, @selector(borderWidth), @(borderWidth), OBJC_ASSOCIATION_ASSIGN);
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = borderWidth;
}
- (CGFloat)borderWidth
{
    return [objc_getAssociatedObject(self, @selector(borderWidth)) floatValue];
}
- (void)setBorderColor:(UIColor *)borderColor
{
    objc_setAssociatedObject(self, @selector(borderColor), borderColor, OBJC_ASSOCIATION_ASSIGN);
    self.layer.masksToBounds = YES;
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor
{
    return objc_getAssociatedObject(self, @selector(borderColor));
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    objc_setAssociatedObject(self, @selector(cornerRadius), @(cornerRadius), OBJC_ASSOCIATION_ASSIGN);
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
}

- (CGFloat)cornerRadius
{
    return [objc_getAssociatedObject(self, @selector(cornerRadius)) floatValue];
}

- (void)removeAllSubviews
{
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}
@end
