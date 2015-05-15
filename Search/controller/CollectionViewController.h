//
//  CollectionViewController.h
//  Search
//
//  Created by  plusub on 4/11/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>
@property (nonatomic, strong) UITableView *collectionTableView;
@property (nonatomic, strong) NSMutableArray *dataarray;
@end
