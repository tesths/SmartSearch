//
//  FileUn.h
//  Search
//
//  Created by  plusub on 4/6/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileUn : NSObject
+ (BOOL)createDirectoryAtPath:(NSString *)fileName;
+ (NSString *)getFilePath:(NSString *)fileName;
+ (BOOL)deleteFileAtPath:(NSString *)fileName;
@end
