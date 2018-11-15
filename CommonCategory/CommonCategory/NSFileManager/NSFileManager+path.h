//
//  NSFileManager+path.h
//  CommonCategory
//
//  Created by Tang杰 on 2018/11/6.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (path)

//获取Library路径
+ (NSString *)getLibraryPath;
//获取缓存路径
+ (NSString *)getCachesPath;
//获取下载路径
+ (NSString *)getDocumentsPath;
//获取preferences路径
+ (NSString *)getPreferencesPath;
//获取临时文件路径
+ (NSString *)getTmpPath;

// 计算单个文件大小
+ (double)getFileSizeAtPath:(NSString*)path;
// 计算目录大小
+ (double)getFolderSizeAtPath:(NSString*)path;
// 清除文件
+ (BOOL)clearCache:(NSString *)path;
@end

NS_ASSUME_NONNULL_END
