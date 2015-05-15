//
//  SearchCell.h
//  Search
//
//  Created by  plusub on 4/8/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchDetModel.h"

@interface SearchCell : UITableViewCell
@property (strong, nonatomic) UILabel *titlelb;
@property (strong, nonatomic) UILabel *contentlb;
@property (strong, nonatomic) UIButton *collectbtn;

@property (strong, nonatomic) SearchDetModel *detdata;
@end
