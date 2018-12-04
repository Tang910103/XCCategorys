//
//  UIView+gesture.m
//  CommonCategory
//
//  Created by Tang杰 on 2018/11/2.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import "UIView+gesture.h"

@implementation UIView (gesture)
+ (UILongPressGestureRecognizer *)addLongPressGestureRecognizerForView:(UIView *)aView target:(id)target action:(SEL)action
{
    UILongPressGestureRecognizer *longP = nil;
    
    if (aView) {
        longP = [[UILongPressGestureRecognizer alloc] initWithTarget:target action:action];
        [aView setUserInteractionEnabled:YES];
        [aView addGestureRecognizer:longP];
    }
    return longP;
}

+ (UISwipeGestureRecognizer *)addSwipeRightGestureForView:(UIView *)aView target:(id)target action:(SEL)action
{
    UISwipeGestureRecognizer *swipeR = nil;
    if (aView) {
        swipeR = [[UISwipeGestureRecognizer alloc] initWithTarget:target action:action];
        [swipeR setDirection:UISwipeGestureRecognizerDirectionRight];
        [aView addGestureRecognizer:swipeR];
    }
    return swipeR;
}

+ (UISwipeGestureRecognizer *)addSwipeLeftGestureForView:(UIView *)aView target:(id)target action:(SEL)action
{
    UISwipeGestureRecognizer *swipeL = nil;
    if (aView) {
        swipeL = [[UISwipeGestureRecognizer alloc] initWithTarget:target action:action];
        [swipeL setDirection:UISwipeGestureRecognizerDirectionLeft];
        [aView addGestureRecognizer:swipeL];
    }
    return swipeL;
}

+ (UITapGestureRecognizer *)addSingleTapGestureForView:(UIView *)aView target:(id)target action:(SEL)action
{
    UITapGestureRecognizer *tap = nil;
    if (aView) {
        tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
        [aView addGestureRecognizer:tap];
        [aView setUserInteractionEnabled:YES];
    }
    return tap;
}

+ (UITapGestureRecognizer *)addDoubleTapGestureForView:(UIView *)aView target:(id)target action:(SEL)action
{
    UITapGestureRecognizer *tap = [self addSingleTapGestureForView:aView target:target action:action];
    tap.numberOfTapsRequired = 2;
    return tap;
}
@end
