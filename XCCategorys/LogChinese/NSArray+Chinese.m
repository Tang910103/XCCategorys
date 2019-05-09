//
//  NSArray+Chinese.m
//  CommonCategory
//
//  Created by Tang杰 on 2018/12/18.
//  Copyright © 2018年 Tang杰. All rights reserved.


//处理字典、数组、集合输出中文为Unicode问题

#import "NSArray+Chinese.h"


static int TJLogLeve = 0;

id contentFormatting(NSMutableString *s, id obj){
    [s appendString:@"\n"];
    for (int i = 0; i <= TJLogLeve; i++) {
        [s appendString:@"\t"];
    }
    if ([obj isKindOfClass:NSArray.class] || [obj isKindOfClass:NSSet.class] || [obj isKindOfClass:NSDictionary.class]) {
        TJLogLeve++;
    }
    if ([obj isKindOfClass:NSString.class]) {
        obj = [[@"\"" stringByAppendingString:obj] stringByAppendingString:@"\""];
    }
    if ([obj isKindOfClass:NSNull.class]) {
        obj = @"null";
    }
    return obj;
}

void tailFormatting(NSMutableString *s){
    // 去掉最后一个逗号
    if ([s hasSuffix:@","]) {
        [s deleteCharactersInRange:NSMakeRange(s.length - 1, 1)];
    }
    [s appendString:@"\n"];
    
    for (int i = 0; i < TJLogLeve; i++) {
        [s appendString:@"\t"];
    }
    if (TJLogLeve > 0) {
        TJLogLeve--;
    }
}


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
        obj = contentFormatting(s, obj);
        [s appendFormat:@"%@,", obj];
    }];
    
    tailFormatting(s);
    [s appendString:@")}"];
    
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
        obj = contentFormatting(s, obj);
        [s appendFormat:@"%@,", obj];
    }];
    tailFormatting(s);
    [s appendString:@"]"];
    
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
        obj = contentFormatting(s, obj);
        [s appendFormat:@"\"%@\" : %@,", key, obj];
    }];
    tailFormatting(s);
    [s appendString:@"}"];
    return s;
}

@end
