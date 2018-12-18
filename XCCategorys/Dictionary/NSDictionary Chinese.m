//
//  NSDictionary+Chinese.m
//  ObjCDemo
//
//  Created by Dragon Sun on 15/12/11.
//  Copyright © 2015年 Dragon Sun. All rights reserved.
//

#import "NSDictionary Chinese.h"

//static int logLeve = 0;

//@implementation NSDictionary (Chinese)
//
////打印到控制台时会调用该方法
//- (NSString *)descriptionWithLocale:(id)locale{
//    return self.debugDescription;
//}
////有些时候不走上面的方法，而是走这个方法
//- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level{
//    return self.debugDescription;
//}
////用po打印调试信息时会调用该方法
//- (NSString *)debugDescription{
//    
//    @try {
//        NSError *error = nil;
//        //字典转成json
//        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted  error:&error];
//        //如果报错了就按原先的格式输出
//        if (error) {
//            return [super debugDescription];
//        }
//        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//        return jsonString;
//    } @catch (NSException *exception) {
//        NSMutableString *s = [NSMutableString string];
//        [s appendString:@"{"];
//        // 遍历生成键值对字符串描述
//        [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
//            [s appendString:@"\n"];
//            for (int i = 0; i <= logLeve; i++) {
//                [s appendString:@"\t"];
//            }
//            if ([obj isKindOfClass:NSArray.class] || [obj isKindOfClass:NSSet.class] || [obj isKindOfClass:NSDictionary.class]) {
//                logLeve++;
//            }
//            [s appendFormat:@"\"%@\" : %@%@%@;", key,[obj isKindOfClass:NSString.class] ? @"\"" : @"", obj, [obj isKindOfClass:NSString.class] ? @"\"" : @""];
//        }];
//        // 去掉最后一个逗号
//        if ([s hasSuffix:@","]) {
//            [s deleteCharactersInRange:NSMakeRange(s.length - 1, 1)];
//        }
//        [s appendString:@"\n"];
//        if (logLeve > 0) {
//            logLeve--;
//        }
//        for (int i = 0; i <= logLeve; i++) {
//            [s appendString:@"\t"];
//        }
//        [s appendString:@"}"];
//        return s;
//    }}
//
//@end
