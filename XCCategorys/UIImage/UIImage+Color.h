//
//  UIImage+Color.h
//  blm_CRM
//
//  Created by blm on 2017/12/21.
//  Copyright © 2017年 播了么. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ColorImage)
+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)scaleToSize:(UIImage *)image size:(CGSize)size;

@end
