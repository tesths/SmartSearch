//
//  FileUn.m
//  Search
//
//  Created by  plusub on 4/6/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import "FileUn.h"

@implementation FileUn
/*创建指定名字的文件夹*/
+ (BOOL)createDirectoryAtPath:(NSString *)fileName{
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [[array objectAtIndex:0] stringByAppendingPathComponent:fileName];
    NSLog(@"-----%@:", path);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:path]){
        NSError *error = nil;
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        return YES;
    }
    
    return NO;
}

/*得到文件路径*/
+ (NSString *)getFilePath:(NSString *)fileName{
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [[array objectAtIndex:0] stringByAppendingPathComponent:fileName];
    
    return path;
}

/*删除文件*/
+ (BOOL)deleteFileAtPath:(NSString *)fileName{
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [[array objectAtIndex:0] stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if(![fileManager fileExistsAtPath:path]){
        return NO;
    }
    
    [fileManager removeItemAtPath:path error:nil];
    return YES;
}
@end
