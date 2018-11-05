//
//  UIApplication+Category.h
//  TJKit
//
//  Created by 唐杰 on 17/3/2.
//  Copyright © 2017年 Tang杰. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TJ_Application [UIApplication sharedApplication]

@interface UIApplication (Category)
/*! app名称*/
@property (nonatomic, copy, readonly) NSString *appName;
/*! APP版本*/
@property (nonatomic, copy, readonly) NSString *appVersion;
/*! APP构建版本*/
@property (nonatomic, copy, readonly) NSString *appBuildVersion;
/*! APP bundle ID （唯一标识符）*/
@property (nonatomic, copy, readonly) NSString *appBundleID;
/** 状态栏是否为白色*/
@property (nonatomic, assign) BOOL statusBarIsWhite;
@end
