//
//  UIDevice+device.m
//  CommonCategory
//
//  Created by Tang杰 on 2018/12/27.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import "UIDevice+device.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

#import <SystemConfiguration/CaptiveNetwork.h>

#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>

#include <arpa/inet.h>
#include <ifaddrs.h>


@implementation UIDevice (device)

+ (NSString *)deviceName
{
    return [self currentDevice].name;
}

+ (NSString *)deviceUUID
{
    return [self currentDevice].identifierForVendor.UUIDString;
}

+ (NSString *)deviceModel
{
    return [self currentDevice].model;
}

+ (NSString *)systemName
{
    return [self currentDevice].systemName;
}

+ (NSString *)systemVersion
{
    return [self currentDevice].systemVersion;
}

+ (NSString *)deviceResolution
{
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat width = rect.size.width * scale;
    CGFloat height = rect.size.height * scale;
    
    return [NSString stringWithFormat:@"%.f * %.f",width,height];
}
+ (NSString *)carrierName
{
    CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [telephonyInfo subscriberCellularProvider];
    NSString *carrierName = [carrier carrierName];
    [UIScreen mainScreen];
    return carrierName ? : @"";
}
+ (CGFloat)batteryLevel
{
    return [self currentDevice].batteryLevel;
}
+ (BOOL) isWiFiEnabled {
    
    NSCountedSet * cset = [NSCountedSet new];
    
    struct ifaddrs *interfaces;
    
    if( ! getifaddrs(&interfaces) ) {
        for( struct ifaddrs *interface = interfaces; interface; interface = interface->ifa_next) {
            if ( (interface->ifa_flags & IFF_UP) == IFF_UP ) {
                [cset addObject:[NSString stringWithUTF8String:interface->ifa_name]];
            }
        }
    }
    
    return [cset countForObject:@"awdl0"] > 1 ? YES : NO;
}
+ (NSString*)currentWifiName
{
    NSArray* ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    
    id info = nil;
    
    for (NSString* ifnam in ifs)
        
    {
        
        info = (__bridge id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        
        if (info && [info count])
            break;
    }
    return info[@"SSID"];
}
+ (NSString*)currentWifiMac
{
    NSString *ssid = @"Not Found";
    CFArrayRef myArray = CNCopySupportedInterfaces();
    if (myArray != nil) {
        CFDictionaryRef myDict = CNCopyCurrentNetworkInfo(CFArrayGetValueAtIndex(myArray, 0));
        if (myDict != nil) {
            NSDictionary *dict = (NSDictionary*)CFBridgingRelease(myDict);
            ssid = [dict valueForKey:@"SSID"];
        }
    }
    
    
    NSArray* ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    
    id info = nil;
    
    for (NSString* ifnam in ifs)
        
    {
        
        info = (__bridge id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        
        if (info && [info count])
            break;
    }
    return info[@"BSSID"];
}

+ (NSString *)deviceMacAdd {
    int mib[6];
    size_t len;
    char *buf;
    unsigned char *ptr;
    struct if_msghdr *ifm;
    struct sockaddr_dl *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1/n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        free(buf);
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    
    // MAC地址带冒号
    NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    
    // MAC地址不带冒号
    //    NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr + 1), *(ptr + 2), *(ptr + 3), *(ptr + 4), *(ptr + 5)];
    
    free(buf);
    
    return [outstring uppercaseString];
}

+ (NSString *)deviceIP
{
    NSString *localIP = nil;
    struct ifaddrs *addrs;
    if (getifaddrs(&addrs)==0) {
        const struct ifaddrs *cursor = addrs;
        while (cursor != NULL) {
            if (cursor->ifa_addr->sa_family == AF_INET && (cursor->ifa_flags & IFF_LOOPBACK) == 0)
            {
                NSString *name = [NSString stringWithUTF8String:cursor->ifa_name];
                if ([name isEqualToString:@"en0"]) // Wi-Fi adapter
                {
                    localIP = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)cursor->ifa_addr)->sin_addr)];
                    break;
                }
            }
            cursor = cursor->ifa_next;
        }
        freeifaddrs(addrs);
    }
    return localIP;
}


@end
