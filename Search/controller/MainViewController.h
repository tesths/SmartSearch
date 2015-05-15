//
//  MainViewController.h
//  Search
//
//  Created by  plusub on 15-4-2.
//  Copyright (c) 2015年 plusub. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QCSlideSwitchView.h"
#import "BaiduTableViewController.h"
#import "ZhihuTableViewController.h"
#import "HaosouTableViewController.h"
#import "WikiTableViewController.h"

#import "SearchTextField.h"

@interface MainViewController : UIViewController<UITextFieldDelegate, QCSlideSwitchViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) SearchTextField *searchTF;

@property (nonatomic, strong) QCSlideSwitchView *slidetab;

@property (nonatomic, strong) BaiduTableViewController *baiduview;
@property (nonatomic, strong) ZhihuTableViewController *zhihuview;
@property (nonatomic, strong) HaosouTableViewController *haosouview;
@property (nonatomic, strong) WikiTableViewController *wikiview;
@end
