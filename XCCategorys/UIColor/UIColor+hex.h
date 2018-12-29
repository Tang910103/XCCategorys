//
//  UIColor+hex.h
//  CommonCategory
//
//  Created by Tang杰 on 2018/11/5.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kColor_RGBA(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define kColor_RGB(R, G, B) kColor_RGBA(R, G, B, 1.0)

#define kColorHex_RGBA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#define kColorHex_RGB(rgbValue) kColorHex_RGBA(rgbValue,1.0)


NS_ASSUME_NONNULL_BEGIN

@interface UIColor (hex)
/** 随机颜色 */
+ (UIColor *)randomColor;

+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
