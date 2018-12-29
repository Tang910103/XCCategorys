//
//  UIDeviceViewController.m
//  CommonCategory
//
//  Created by Tang杰 on 2018/12/28.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import "UIDeviceViewController.h"
#import "UIDevice+device.h"

@interface UIDeviceViewController ()

@end

@implementation UIDeviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    [self appendInfo:@"设备名称" text:UIDevice.deviceName];
    [self appendInfo:@"设备uuid" text:UIDevice.deviceUUID];
    [self appendInfo:@"系统版本" text:UIDevice.systemVersion];
    [self appendInfo:@"设备模式" text:UIDevice.deviceModel];
    [self appendInfo:@"设备分辨率" text:UIDevice.deviceResolution];
    [self appendInfo:@"网络运营商名字" text:UIDevice.carrierName];
    [self appendInfo:@"当前链接的wifi 名称" text:UIDevice.currentWifiName];
    [self appendInfo:@"当前链接的wifi mac" text:UIDevice.currentWifiMac];
    [self appendInfo:@"设备mac地址" text:UIDevice.deviceMacAdd];
    [self appendInfo:@"设备IP" text:UIDevice.deviceIP];
}
- (void)appendInfo:(NSString *)label text:(NSString *)text {
    NSAttributedString *s = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@：%@\n",label , text]];
    [self.textView.textStorage appendAttributedString:s];
}



@end
