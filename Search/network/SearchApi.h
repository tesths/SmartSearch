//
//  SearchApi.h
//  Search
//
//  Created by  plusub on 4/7/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

@interface SearchApi : AFHTTPRequestOperationManager
+ (instancetype)sharedManager;
@end
#pragma mark - DHApiManager (Login)
@interface SearchApi (SearchBase)
//search请求
+ (RACSignal *)searchbaidu:(NSString *)baidustr;
+ (RACSignal *)searchzhihu:(NSString *)zhihustr;
+ (RACSignal *)searchhaosou:(NSString *)haosoustr;
+ (RACSignal *)searchwiki:(NSString *)wikistr;

+ (RACSignal *)searchnexturl:(NSString *)nextstr andParsename:(NSString *)parsenamel;
@end
