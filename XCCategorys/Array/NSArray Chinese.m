//
//  NSArray+Chinese.m
//  ObjCDemo
//
//  Created by Dragon Sun on 15/12/11.
//  Copyright © 2015年 Dragon Sun. All rights reserved.
//

#import "NSArray Chinese.h"


//@implementation NSArray (Chinese)
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
//        // 遍历生成元素字符串描述
//        for (id obj in self) {
//            [s appendFormat:@"\n\t%@%@%@,",[obj isKindOfClass:NSString.class] ? @"\"" : @"", obj, [obj isKindOfClass:NSString.class] ? @"\"" : @""];
//        }
//        // 去掉最后一个逗号
//        if ([s hasSuffix:@","]) {
//            [s deleteCharactersInRange:NSMakeRange(s.length - 1, 1)];
//        }
//        return [NSString stringWithFormat:@"[%@\n]", s];
//    }
//}
//
//@end
