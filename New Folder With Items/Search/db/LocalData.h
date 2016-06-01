//
//  LocalData.h
//  Search
//
//  Created by  plusub on 4/12/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import <Foundation/Foundation.h>
#define LOADTYPE @"isFirst"//1 应用内加载 2 浏览器加载

@interface LocalData : NSObject
+ (NSUserDefaults *)customDefault;
+ (void)setDefaultValue:(id)item withKey:(NSString *)key;
+ (void)removeDefaultWithKey:(NSString *)key;
@end
