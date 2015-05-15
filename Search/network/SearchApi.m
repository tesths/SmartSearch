//
//  SearchApi.m
//  Search
//
//  Created by  plusub on 4/7/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import "SearchApi.h"
#import "SearchModel.h"

@implementation SearchApi
+ (instancetype)sharedManager {
    static SearchApi *manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        ;
    });
    return manager;
}


- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript" , @"text/plain" ,@"text/html" , nil];
    self.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    [self.networkReachabilityStatusSignal subscribeNext:^(NSNumber *status) {
        AFNetworkReachabilityStatus networkStatus = [status intValue];
        switch (networkStatus) {
            case AFNetworkReachabilityStatusUnknown:
            case AFNetworkReachabilityStatusNotReachable:
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                break;
        }
        
    }];
    
    
    return self;
}

- (RACSignal *)errorDo:(NSError *)error
{
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请检查网络是否可用" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//    [alert show];
    return [RACSignal error:error];
}
@end

@implementation SearchApi (SearchBase)
+ (RACSignal *)searchnexturl:(NSString *)nextstr andParsename:(NSString *)parsename
{
    SearchApi *manager = [self sharedManager];
    if (![nextstr isEqualToString:@""]) {
        NSDictionary *para = @{@"url":nextstr, @"parser_name":parsename};
        return [manager fetchNextWithPara:para];
    } else {
        return nil;
    }
}

- (RACSignal *)fetchNextWithPara:(NSDictionary *)para
{
    return [[[[[self rac_GET:S_CUSTOM parameters:para]
               map:^id(NSDictionary *response) {
                   NSLog(@"%@", response);
                   NSError *error = nil;
                   NSInteger statusNum = [[response objectForKey:@"status"] integerValue];
                   if (statusNum == 200) {
                       SearchModel *service = [MTLJSONAdapter modelOfClass:SearchModel.class fromJSONDictionary:response error:&error];
                       NSLog(@"\n\n%@", service.ResultData);
                       return service;
                   } else if (statusNum == 500){
                       //                       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请检查网络是否可用" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                       //                       [alert show];
                       return nil;
                   } else {
                       return nil;
                   }
                   
               }]
              catch:^RACSignal *(NSError *error) {
                  return [self errorDo:error];
              }]
             doNext:^(id x) {
                 
             }] replayLazily];
}


+ (RACSignal *)searchbaidu:(NSString *)baidustr
{
    SearchApi *manager = [self sharedManager];
    NSDictionary *para = @{@"keyword":baidustr};
    return [manager fetchBaiduWithPara:para];
}

- (RACSignal *)fetchBaiduWithPara:(NSDictionary *)para
{
    return [[[[[self rac_GET:S_BAIDU parameters:para]
               map:^id(NSDictionary *response) {
                   NSLog(@"%@", response);
                   NSError *error = nil;
                   NSInteger statusNum = [[response objectForKey:@"status"] integerValue];
                   if (statusNum == 200) {
                    SearchModel *service = [MTLJSONAdapter modelOfClass:SearchModel.class fromJSONDictionary:response error:&error];
                    return service;
                   } else if (statusNum == 500){
//                       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请检查网络是否可用" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//                       [alert show];
                       return nil;
                   } else {
                       return nil;
                   }
                   
               }]
              catch:^RACSignal *(NSError *error) {
                  return [self errorDo:error];
              }]
             doNext:^(id x) {
                 
             }] replayLazily];
}

+ (RACSignal *)searchzhihu:(NSString *)zhihustr
{
    SearchApi *manager = [self sharedManager];
    NSDictionary *para = @{@"keyword":zhihustr};
    return [manager fetchZhihuWithPara:para];
}

- (RACSignal *)fetchZhihuWithPara:(NSDictionary *)para
{
    return [[[[[self rac_GET:S_ZHIHU parameters:para]
               map:^id(NSDictionary *response) {
                   NSLog(@"%@", response);

                   NSError *error = nil;
                   NSInteger statusNum = [[response objectForKey:@"status"] integerValue];
                   if (statusNum == 200) {
                       SearchModel *service = [MTLJSONAdapter modelOfClass:SearchModel.class fromJSONDictionary:response error:&error];
                       return service;
                   } else if (statusNum == 500){
//                       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请检查网络是否可用" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//                       [alert show];
                       return nil;
                   } else {
                       return nil;
                   }
                   
               }]
              catch:^RACSignal *(NSError *error) {
                  return [self errorDo:error];
              }]
             doNext:^(id x) {
                 
             }] replayLazily];
}

+ (RACSignal *)searchhaosou:(NSString *)haosoustr
{
    SearchApi *manager = [self sharedManager];
    NSDictionary *para = @{@"keyword":haosoustr};
    return [manager fetchHaosouWithPara:para];
}

- (RACSignal *)fetchHaosouWithPara:(NSDictionary *)para
{
    return [[[[[self rac_GET:S_HAOSOU parameters:para]
               map:^id(NSDictionary *response) {
                   NSLog(@"%@", response);

                   NSError *error = nil;
                   NSInteger statusNum = [[response objectForKey:@"status"] integerValue];
                   if (statusNum == 200) {
                       SearchModel *service = [MTLJSONAdapter modelOfClass:SearchModel.class fromJSONDictionary:response error:&error];
                       return service;
                   } else if (statusNum == 500){
//                       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请检查网络是否可用" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//                       [alert show];
                       return nil;
                   } else {
                       return nil;
                   }
                   
               }]
              catch:^RACSignal *(NSError *error) {
                  return [self errorDo:error];
              }]
             doNext:^(id x) {
                 
             }] replayLazily];
}

+ (RACSignal *)searchwiki:(NSString *)wikistr
{
    SearchApi *manager = [self sharedManager];
    NSDictionary *para = @{@"keyword":wikistr};
    return [manager fetchWikiWithPara:para];
}

- (RACSignal *)fetchWikiWithPara:(NSDictionary *)para
{
    return [[[[[self rac_GET:S_WIKI parameters:para]
               map:^id(NSDictionary *response) {
                   NSLog(@"%@", response);

                   NSError *error = nil;
                   NSInteger statusNum = [[response objectForKey:@"status"] integerValue];
                   if (statusNum == 200) {
                       SearchModel *service = [MTLJSONAdapter modelOfClass:SearchModel.class fromJSONDictionary:response error:&error];
                       return service;
                   } else if (statusNum == 500){
//                       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请检查网络是否可用" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//                       [alert show];
                       return nil;
                   } else {
                       return nil;
                   }
                   
               }]
              catch:^RACSignal *(NSError *error) {
                  return [self errorDo:error];
              }]
             doNext:^(id x) {
                 
             }] replayLazily];
}
@end
