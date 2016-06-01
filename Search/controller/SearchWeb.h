//
//  SearchWeb.h
//  Search
//
//  Created by  plusub on 4/11/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import "SVWebViewController.h"
#import "SearchDetModel.h"

@interface SearchWeb : SVWebViewController<UIWebViewDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) SearchDetModel *webmodel;

+ (instancetype)webVCWithUrlStr:(NSString *)curUrlStr;

@end
