//
//  UIView+gesture.h
//  CommonCategory
//
//  Created by Tang杰 on 2018/11/2.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (gesture)
+ (UITapGestureRecognizer *)addSwipeRightGestureForView:(UIView *)aView target:(id)target action:(SEL)action;
+ (UITapGestureRecognizer *)addSwipeLeftGestureForView:(UIView *)aView target:(id)target action:(SEL)action;
+ (UITapGestureRecognizer *)addSingleTapGestureForView:(UIView *)view target:(id)target action:(SEL)action;
+ (UITapGestureRecognizer *)addDoubleTapGestureForView:(UIView *)aView target:(id)target action:(SEL)action;
+ (UILongPressGestureRecognizer *)addLongPressGestureRecognizerForView:(UIView *)aView target:(id)target action:(SEL)action;
@end

NS_ASSUME_NONNULL_END
