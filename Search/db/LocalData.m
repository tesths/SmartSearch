//
//  LocalData.m
//  Search
//
//  Created by  plusub on 4/12/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import "LocalData.h"

@implementation LocalData
+ (NSUserDefaults *)customDefault
{
    return [NSUserDefaults standardUserDefaults];
    
}

+ (void)setDefaultValue:(id)item withKey:(NSString *)key
{
    NSUserDefaults *userDefatluts = [NSUserDefaults standardUserDefaults];
    [userDefatluts setObject:item forKey:key];
    [userDefatluts synchronize];
    
}

+ (void)removeDefaultWithKey:(NSString *)key
{
    NSUserDefaults *userDefatluts = [NSUserDefaults standardUserDefaults];
    [userDefatluts removeObjectForKey:key];
    [userDefatluts synchronize];
    
}
@end
