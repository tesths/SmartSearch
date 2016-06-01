//
//  LeftViewController.h
//  Search
//
//  Created by  plusub on 15-4-2.
//  Copyright (c) 2015年 plusub. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "CollectionViewController.h"
#import "SettingViewController.h"
#import "HelpViewController.h"

@interface LeftViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *lefttable;
@end
