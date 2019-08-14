//
//  UIApplication+Category.m
//  TJKit
//
//  Created by 唐杰 on 17/3/2.
//  Copyright © 2017年 Tang杰. All rights reserved.
//

#import "UIApplication+Category.h"
#import <CoreLocation/CoreLocation.h>

#define TJ_InfoDictionary [[NSBundle mainBundle] infoDictionary]

@implementation UIApplication (Category)
- (NSString *)appName
{
    return [TJ_InfoDictionary objectForKey:@"CFBundleDisplayName"];
}
- (NSString *)appVersion
{
    return [TJ_InfoDictionary objectForKey:@"CFBundleShortVersionString"];
}
- (NSString *)appBuildVersion
{
    return [TJ_InfoDictionary objectForKey:@"CFBundleVersion"];
}
- (NSString *)appBundleID
{
    return [TJ_InfoDictionary objectForKey:@"CFBundleIdentifier"];
}
- (BOOL)statusBarIsWhite
{
    return TJ_Application.statusBarStyle == UIStatusBarStyleLightContent;
}
- (void)setStatusBarIsWhite:(BOOL)statusBarIsWhite
{
    dispatch_async(dispatch_get_main_queue(), ^{
        TJ_Application.statusBarStyle = statusBarIsWhite ? UIStatusBarStyleLightContent : UIStatusBarStyleDefault;
    });
}
@end
