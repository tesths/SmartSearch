//
//  LeftViewController.m
//  Search
//
//  Created by  plusub on 15-4-2.
//  Copyright (c) 2015年 plusub. All rights reserved.
//

#import "LeftViewController.h"
#import "LeftCell.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.    
    self.lefttable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    self.lefttable.delegate = self;
    self.lefttable.dataSource = self;
    
    UIView *headerview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 20)];
    headerview.backgroundColor = DEEPBLUE;
    self.lefttable.tableHeaderView = headerview;
    self.lefttable.tableFooterView = [[UIView alloc] init];
    
    self.lefttable.scrollEnabled = NO;
    self.lefttable.bounces = NO;
    
    [self.view addSubview:self.lefttable];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return SCREENHEIGHT - 44 * 4 - 20;
    } else {
        return 0;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeftCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LeftCell" owner:self options:nil]lastObject];
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                cell.leftimage.image = [UIImage imageNamed:@"ic_record"];
                cell.leftLb.text = @"个人收藏";
            } else {
                cell.leftimage.image = [UIImage imageNamed:@"ic_search"];
                cell.leftLb.text = @"多列分栏搜索";
            }
        } else {
            if (indexPath.row == 0) {
                cell.leftimage.image = [UIImage imageNamed:@"ic_settings"];
                cell.leftLb.text = @"设置";
            } else {
                cell.leftimage.image = [UIImage imageNamed:@"ic_help"];
                cell.leftLb.text = @"帮助";
            }
        }
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MainViewController *main = [[MainViewController alloc] init];
    CollectionViewController *collection = [[CollectionViewController alloc] init];
    SettingViewController *setting = [[SettingViewController alloc] init];
    HelpViewController *help = [[HelpViewController alloc] init];
    SearchNaviController *navi;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            navi = [[SearchNaviController alloc] initWithRootViewController:collection];
        } else {
            navi = [[SearchNaviController alloc] initWithRootViewController:main];
        }
    } else {
        if (indexPath.row == 0) {
            navi = [[SearchNaviController alloc] initWithRootViewController:setting];
        } else {
            navi = [[SearchNaviController alloc] initWithRootViewController:help];
        }
    }
    [self.revealController setFrontViewController:navi];
    [self.revealController showViewController:self.revealController.frontViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
