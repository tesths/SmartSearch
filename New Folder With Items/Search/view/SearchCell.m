//
//  SearchCell.m
//  Search
//
//  Created by  plusub on 4/8/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import "SearchCell.h"
#import "SearchDB.h"

@implementation SearchCell

- (void)awakeFromNib {
    // Initialization code    
    self.titlelb = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, SCREENWIDTH - 45, 20)];
    self.titlelb.font = [UIFont systemFontOfSize:17];
    self.titlelb.numberOfLines = 0;
    
    [self addSubview:self.titlelb];
    
    self.contentlb = [[UILabel alloc] initWithFrame:CGRectMake(5, 42, SCREENWIDTH - 10, 80)];
    self.contentlb.textColor = [UIColor lightGrayColor];
    self.contentlb.font = [UIFont systemFontOfSize:14];
    self.contentlb.numberOfLines = 0;
    self.contentlb.lineBreakMode = NSLineBreakByTruncatingTail;
    [self addSubview:self.contentlb];
    
    self.collectbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.collectbtn.frame = CGRectMake(SCREENWIDTH - 55, 0, 55, 38);
    [self.collectbtn setImage:[UIImage imageNamed:@"feed_button_like"] forState:UIControlStateNormal];
    [self.collectbtn setImage:[UIImage imageNamed:@"feed_button_like_active"] forState:UIControlStateSelected];

    
    [self.collectbtn addTarget:self action:@selector(collectSearch) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.collectbtn];
    
    [self.titlelb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7);
        make.left.mas_equalTo(5);
        make.right.mas_equalTo(-45);
//        make.bottom.equalTo(self.contentlb.mas_top).with.offset(5);
    }];
    [self.contentlb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titlelb.mas_top).with.offset(self.titlelb.frame.size.height + 9);
        make.left.mas_equalTo(5);
        make.right.mas_equalTo(-5);
        make.bottom.mas_equalTo(-5);
    }];
}

-(void)setDetdata:(SearchDetModel *)detdata
{
    _detdata = detdata;
    self.titlelb.text = self.detdata.Title;
    self.contentlb.text = self.detdata.Abstract;
    
    if ([SearchDB selectChoose:self.detdata.Title]) {
        self.collectbtn.selected = 1;
    } else {
        self.collectbtn.selected = 0;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)collectSearch
{
    NSLog(@"%@", self.detdata.Title);
    if (self.collectbtn.selected) {
        self.collectbtn.selected = 0;
        [SearchDB deleteData:self.detdata.Title];
    } else {
        [SearchDB insertData:self.detdata];
        self.collectbtn.selected = 1;
    }
}


@end
