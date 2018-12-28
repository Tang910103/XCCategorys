//
//  UIDevice+device.h
//  CommonCategory
//
//  Created by Tang杰 on 2018/12/27.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (device)
/*! 设备名称*/
+ (NSString *)deviceName;
/*! 设备uuid*/
+ (NSString *)deviceUUID;
/*! 系统名称 */
+ (NSString *)systemName;
/*! 系统版本*/
+ (NSString *)systemVersion;
/*! 设备模式 */
+ (NSString *)deviceModel;
/*! 设备分辨率  */
+ (NSString *)deviceResolution;
/*! 网络运营商名字*/
+ (NSString *)carrierName;
/** 设备电量 0 .. 1.0. -1.0 if UIDeviceBatteryStateUnknown */
+ (CGFloat)batteryLevel;
#warning  wifi信息获取需要在xCode中Capabilities中，激活Access WiFi Infomation项
/** 是否打开WiFi */
+ (BOOL) isWiFiEnabled;
/*! 当前链接的wifi 名称 */
+ (NSString *)currentWifiName;
/*! 当前链接的wifi mac*/
+ (NSString *)currentWifiMac;
/*! 设备mac地址*/
+ (NSString *)deviceMacAdd;
/*! 设备IP*/
+ (NSString *)deviceIP;

@end

NS_ASSUME_NONNULL_END
