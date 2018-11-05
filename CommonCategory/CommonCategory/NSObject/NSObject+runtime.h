//
//  NSObject+runtime.h
//  blm_CRM
//
//  Created by blm on 2018/8/7.
//  Copyright © 2018年 播了么. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (runtime)
+ (void)exchangeInstanceMethod:(NSArray <NSString *>*)methodNames prefix:(NSString *)prefix;

+ (void)exchangeClassMethod:(NSArray<NSString *> *)methodNames prefix:(NSString *)prefix;

+ (NSMutableArray *)getProperties;
@end
