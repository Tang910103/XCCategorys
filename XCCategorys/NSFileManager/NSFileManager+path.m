//
//  NSFileManager+path.m
//  CommonCategory
//
//  Created by Tang杰 on 2018/11/6.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import "NSFileManager+path.h"

@implementation NSFileManager (path)

+ (NSString *)getLibraryPath
{
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)getTmpPath
{
    return NSTemporaryDirectory();
}

+ (NSString *)getPreferencesPath
{
    return [NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)getDocumentsPath
{
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
}

+ (NSString *)getCachesPath
{
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    
    return cachesPath;
}

//计算单个文件大小返回值是M
+ (double)getFileSizeAtPath:(NSString *)path
{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:path]){
        unsigned long long size = [fileManager attributesOfItemAtPath:path error:nil].fileSize;
        // 返回值是字节 B K M
        
        return size/1024.0/1024.0;
    }
    
    return 0;
}

//计算目录大小
+ (double)getFolderSizeAtPath:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    double folderSize = 0.0;
    
    if ([fileManager fileExistsAtPath:path]) {
        
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        
        for (NSString *fileName in childerFiles) {
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
            BOOL isDirectory = NO;
            [fileManager fileExistsAtPath:absolutePath isDirectory:&isDirectory];
            if (isDirectory) {
                folderSize += [self getFolderSizeAtPath:absolutePath];
            } else {
                // 计算单个文件大小
                folderSize += [self getFileSizeAtPath:absolutePath];
            }
        }
        return folderSize;
    }
    return 0;
}

//清理缓存文件
+ (BOOL)clearCache:(NSString *)path
{
    NSError *error;
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        [fileManager removeItemAtPath:path error:&error];
        if (error) {
            NSLog(@"删除文件发生错误：%@",error);
            return NO;
        }
    }
    return YES;
}

@end
