//
//  NSSet+Chinese.m
//  ObjCDemo
//
//  Created by Dragon Sun on 15/12/11.
//  Copyright © 2015年 Dragon Sun. All rights reserved.
//

#import "NSSet Chinese.h"

static int logLeve = 0;

@implementation NSSet (Chinese)

//打印到控制台时会调用该方法
- (NSString *)descriptionWithLocale:(id)locale{
    return self.debugDescription;
}
//有些时候不走上面的方法，而是走这个方法
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level{
    return self.debugDescription;
}
//用po打印调试信息时会调用该方法
- (NSString *)debugDescription{
    NSMutableString *s = [NSMutableString string];
    [s appendString:@"{("];
    // 遍历生成键值对字符串描述
    [self enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        [s appendString:@"\n"];
        for (int i = 0; i <= logLeve; i++) {
            [s appendString:@"\t"];
        }
        if ([obj isKindOfClass:NSArray.class] || [obj isKindOfClass:NSSet.class] || [obj isKindOfClass:NSDictionary.class]) {
            logLeve++;
        }
        [s appendFormat:@"%@%@%@,",[obj isKindOfClass:NSString.class] ? @"\"" : @"", obj, [obj isKindOfClass:NSString.class] ? @"\"" : @""];
    }];
    
    // 去掉最后一个逗号
    if ([s hasSuffix:@","]) {
        [s deleteCharactersInRange:NSMakeRange(s.length - 1, 1)];
    }
    [s appendString:@"\n"];
    
    for (int i = 0; i < logLeve; i++) {
        [s appendString:@"\t"];
    }
    [s appendString:@")}"];
    if (logLeve > 0) {
        logLeve--;
    }
    
    return s;
}
@end
@implementation NSArray (Chinese)

//打印到控制台时会调用该方法
- (NSString *)descriptionWithLocale:(id)locale{
    return self.debugDescription;
}
//有些时候不走上面的方法，而是走这个方法
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level{
    return self.debugDescription;
}
//用po打印调试信息时会调用该方法
- (NSString *)debugDescription
{
    NSMutableString *s = [NSMutableString string];
    [s appendString:@"["];
    // 遍历生成键值对字符串描述
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [s appendString:@"\n"];
        for (int i = 0; i <= logLeve; i++) {
            [s appendString:@"\t"];
        }
        if ([obj isKindOfClass:NSArray.class] || [obj isKindOfClass:NSSet.class] || [obj isKindOfClass:NSDictionary.class]) {
            logLeve++;
        }
        [s appendFormat:@"%@%@%@,",[obj isKindOfClass:NSString.class] ? @"\"" : @"", obj, [obj isKindOfClass:NSString.class] ? @"\"" : @""];
    }];
    // 去掉最后一个逗号
    if ([s hasSuffix:@","]) {
        [s deleteCharactersInRange:NSMakeRange(s.length - 1, 1)];
    }
    [s appendString:@"\n"];
    for (int i = 0; i < logLeve; i++) {
        [s appendString:@"\t"];
    }
    [s appendString:@"]"];
    if (logLeve > 0) {
        logLeve--;
    }
    return s;
}

@end

@implementation NSDictionary (Chinese)

//打印到控制台时会调用该方法
- (NSString *)descriptionWithLocale:(id)locale{
    return self.debugDescription;
}
//有些时候不走上面的方法，而是走这个方法
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level{
    return self.debugDescription;
}
//用po打印调试信息时会调用该方法
- (NSString *)debugDescription
{
    NSMutableString *s = [NSMutableString string];
    [s appendString:@"{"];
    // 遍历生成键值对字符串描述
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [s appendString:@"\n"];
        for (int i = 0; i <= logLeve; i++) {
            [s appendString:@"\t"];
        }
        if ([obj isKindOfClass:NSArray.class] || [obj isKindOfClass:NSSet.class] || [obj isKindOfClass:NSDictionary.class]) {
            logLeve++;
        }
        [s appendFormat:@"\"%@\" : %@%@%@;", key,[obj isKindOfClass:NSString.class] ? @"\"" : @"", obj, [obj isKindOfClass:NSString.class] ? @"\"" : @""];
    }];
    // 去掉最后一个逗号
    if ([s hasSuffix:@","]) {
        [s deleteCharactersInRange:NSMakeRange(s.length - 1, 1)];
    }
    [s appendString:@"\n"];
    
    for (int i = 0; i < logLeve; i++) {
        [s appendString:@"\t"];
    }
    [s appendString:@"}"];
    if (logLeve > 0) {
        logLeve--;
    }
    return s;
}

@end
