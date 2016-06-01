//
//  BaiduTableViewController.h
//  Search
//
//  Created by  plusub on 15-4-2.
//  Copyright (c) 2015年 plusub. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^StartSearch)(void);

@interface BaiduTableViewController : UITableViewController
@property (strong, nonatomic) SearchModel *searchmodel;
@property (strong, nonatomic) NSMutableArray *dataArray;

@property (strong, nonatomic) NSString *searchstr;

@property (strong, nonatomic) NSString *nextUrl;

@property (strong, nonatomic) StartSearch search;

- (void)StartSearch;

@end
