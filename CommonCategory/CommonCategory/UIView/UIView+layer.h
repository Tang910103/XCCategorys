//
//  UIView+layer.h
//  blm_CRM
//
//  Created by Tang杰 on 2018/10/15.
//  Copyright © 2018年 播了么. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (layer)
/*! 设置边框宽*/
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
/*! 设置边框颜色*/
@property (nonatomic, assign) IBInspectable UIColor *borderColor;
/*! 设置圆角度*/
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

- (void)removeAllSubviews;
@end

NS_ASSUME_NONNULL_END
