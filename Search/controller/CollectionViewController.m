//
//  CollectionViewController.m
//  Search
//
//  Created by  plusub on 4/11/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import "CollectionViewController.h"
#import "SearchDB.h"
#import "CollectionCell.h"
#import "SearchWeb.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"个人收藏";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangeButton:) name:@"changebtn" object:nil];
    
    UIBarButtonItem *leftbtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_menu_black"] style:UIBarButtonItemStylePlain target:self action:@selector(gotoLeftView)];
    [self.navigationItem setLeftBarButtonItem:leftbtn];
    
    self.collectionTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    self.collectionTableView.delegate = self;
    self.collectionTableView.dataSource = self;
    self.collectionTableView.tableFooterView = [[UIView alloc] init];
    
    self.collectionTableView.estimatedRowHeight = 35;
    self.collectionTableView.rowHeight = UITableViewAutomaticDimension;
    
    self.dataarray = [[NSMutableArray alloc] init];
    self.dataarray = [SearchDB searchCollectionTable];
    
    NSLog(@"~~~~~~~~~\n%@", self.dataarray);
    
    UILongPressGestureRecognizer *longpress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    longpress.minimumPressDuration = 1;
    longpress.delegate = self;
    [self.collectionTableView addGestureRecognizer:longpress];
    
    [self.view addSubview:self.collectionTableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataarray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchDetModel *detmodel = [self.dataarray objectAtIndex:indexPath.row];
    CollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CollectionCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CollectionCell" owner:self options:nil]lastObject];
        cell.titleLb.text = detmodel.Title;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SearchDetModel *detmodel = [self.dataarray objectAtIndex:indexPath.row];
    if ([[[LocalData customDefault] objectForKey:LOADTYPE] integerValue] == 0) {
        SearchWeb *webview = [SearchWeb webVCWithUrlStr:detmodel.Link];
        webview.webmodel = detmodel;
        [self.navigationController pushViewController:webview animated:YES];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:detmodel.Link]];
    }
}

- (void)gotoLeftView
{
    [self.revealController showViewController:self.revealController.leftViewController];
}

-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    CGPoint p = [gestureRecognizer locationInView:self.collectionTableView];
    
    NSIndexPath *indexPath = [self.collectionTableView indexPathForRowAtPoint:p];
    if (indexPath == nil) {
        NSLog(@"long press on table view but not on a row");
    } else if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"确认删除该收藏记录" message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        [alert bk_addButtonWithTitle:@"确定" handler:^{
            SearchDetModel *detmodel = [self.dataarray objectAtIndex:indexPath.row];
            [SearchDB deleteData:detmodel.Title];
            [self.dataarray removeObjectAtIndex:indexPath.row];
            [self.collectionTableView reloadData];

            [[UIView appearance] setTintColor:nil];
        }];
        [alert bk_setCancelBlock:^{
            [[UIView appearance] setTintColor:nil];
        }];
        [[UIView appearance] setTintColor:DEEPBLUE];
        [alert show];
    } else {

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)ChangeButton:(NSNotification *)noti
{
    self.dataarray = [SearchDB searchCollectionTable];
    [self.collectionTableView reloadData];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
