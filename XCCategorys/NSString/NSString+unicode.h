//
//  NSString+unicode.h
//  CommonCategory
//
//  Created by Tang杰 on 2018/11/6.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (unicode)
/**
 Unicode 转中文字符串
 
 @param unicodeStr  UnicodeString
 @return  中文字符串
 */
+ (NSString *)UnicodeToChinese:(NSString *)unicodeStr;

/**
 中文字符串转 Unicode
 
 @param string 中文字符串
 @return UnicodeString
 */
+ (NSString *)chineseToUnicode:(NSString *)string;

@end


@interface NSString (MD5)
- (NSString *)stringToMD5;
@end
NS_ASSUME_NONNULL_END
