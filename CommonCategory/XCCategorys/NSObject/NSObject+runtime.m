//
//  NSObject+runtime.m
//  blm_CRM
//
//  Created by blm on 2018/8/7.
//  Copyright © 2018年 播了么. All rights reserved.
//

#import "NSObject+runtime.h"
#import <objc/runtime.h>

@implementation NSObject (exchangeMethod)
+ (void)exchangeInstanceMethod:(NSArray <NSString *>*)methodNames prefix:(NSString *)prefix
{
    prefix = [self prefixCheck:prefix];
    [methodNames enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Method oldMethod = class_getInstanceMethod([self class], NSSelectorFromString(obj));
        Method newMethod = class_getInstanceMethod([self class], NSSelectorFromString([prefix stringByAppendingString:obj]));
        
        if (oldMethod && newMethod) {
            BOOL isAddMethod = class_addMethod([self class],NSSelectorFromString(obj),
                                               method_getImplementation(newMethod),
                                               method_getTypeEncoding(newMethod));
            
            if (isAddMethod) {
                class_replaceMethod([self class],NSSelectorFromString([prefix stringByAppendingString:obj]),
                                    method_getImplementation(oldMethod),
                                    method_getTypeEncoding(oldMethod));
            } else {
                method_exchangeImplementations(oldMethod, newMethod);
            }
        }
    }];
}
+ (void)exchangeClassMethod:(NSArray<NSString *> *)methodNames prefix:(NSString *)prefix
{
    prefix = [self prefixCheck:prefix];
    [methodNames enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Method oldMethod = class_getClassMethod(self, NSSelectorFromString(obj));
        Method newMethod = class_getClassMethod(self, NSSelectorFromString([prefix stringByAppendingString:obj]));
        
        method_exchangeImplementations(oldMethod, newMethod);
    }];
}

+ (NSString *)prefixCheck:(NSString *)prefix {
    
    prefix = [prefix stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (prefix == nil || prefix.length == 0) {
        prefix = @"new_";
    }
    return prefix;
}
+ (NSMutableArray *)getProperties {
    
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList(self, &count);
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        
        objc_property_t property = properties[i];
        const char *cName = property_getName(property);
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        [mArray addObject:name];
        
    }
    free(properties);
    
    return mArray.copy;
}
//+ (void)load
//{
//    [self exchangeInstanceMethod:@[NSStringFromSelector(@selector(setValuesForKeysWithDictionary:))] prefix:nil];
//}
//
//- (void)new_setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues
//{
//    if ([keyedValues isKindOfClass:[NSDictionary class]]) {
//        [self new_setValuesForKeysWithDictionary:keyedValues];
//    }
//}
@end
