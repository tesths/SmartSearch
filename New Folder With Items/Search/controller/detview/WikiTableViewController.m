//
//  WikiTableViewController.m
//  Search
//
//  Created by  plusub on 15-4-2.
//  Copyright (c) 2015年 plusub. All rights reserved.
//

#import "WikiTableViewController.h"

@interface WikiTableViewController ()

@end

@implementation WikiTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangeButton:) name:@"changebtn" object:nil];
    
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.tableView.tableFooterView = [[UIView alloc] init];

    [self.tableView addFooterWithTarget:self action:@selector(loadWiki)];
    
    self.dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    self.searchmodel = [[SearchModel alloc] init];
}

- (void)StartSearch
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];

    [[SearchApi searchwiki:self.searchstr] subscribeNext:^(id value) {
        NSString *className = [NSString stringWithUTF8String:object_getClassName(value)];
        if ([className isEqualToString:@"RACDynamicSignal"]) {
            [value subscribeNext:^(id x) {
                self.searchmodel = x;
            }];
            return;
        }
        self.searchmodel = value;
    } completed:^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        self.dataArray = self.searchmodel.ResultData;
        [self.tableView reloadData];
    }];
}

- (void)loadWiki
{
    if (self.searchmodel.NextPage == nil) {
        [self.tableView footerEndRefreshing];
        return;
    }
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [[SearchApi searchnexturl:self.searchmodel.NextPage andParsename:@"WikipediaData"] subscribeNext:^(id value) {
        NSString *className = [NSString stringWithUTF8String:object_getClassName(value)];
        if ([className isEqualToString:@"RACDynamicSignal"]) {
            [value subscribeNext:^(id x) {
                self.searchmodel = x;
            }];
            return;
        }
        self.searchmodel = value;
    } completed:^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        for (NSDictionary *item in self.searchmodel.ResultData) {
            [self.dataArray addObject:item];
        }
        [self.tableView footerEndRefreshing];
        
        [self.tableView reloadData];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SearchCell" owner:self options:nil]lastObject];
    }
    cell.detdata = self.dataArray[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SearchDetModel *detmodel = [self.dataArray objectAtIndex:indexPath.row];
    NSNotification *pushview = [NSNotification notificationWithName:@"pushview" object:detmodel];
    [[NSNotificationCenter defaultCenter] postNotification:pushview];
}

- (void)ChangeButton:(NSNotification *)noti
{
    [self.tableView reloadData];
}
@end
