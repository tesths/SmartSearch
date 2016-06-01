//
//  MainViewController.m
//  Search
//
//  Created by  plusub on 15-4-2.
//  Copyright (c) 2015年 plusub. All rights reserved.
//

#import "MainViewController.h"
#import "LeftViewController.h"

#import "SearchWeb.h"
#import "SearchDetModel.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *leftbtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_menu_black"] style:UIBarButtonItemStylePlain target:self action:@selector(gotoLeftView)];
    [self.navigationItem setLeftBarButtonItem:leftbtn];
    UIBarButtonItem *rightbtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_search_black"] style:UIBarButtonItemStylePlain target:self action:@selector(startSearch)];
    [self.navigationItem setRightBarButtonItem:rightbtn];
    
    self.searchTF = [[SearchTextField alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH - 60, 30) andPlaceText:@"请输入关键字"];
    self.searchTF.tintColor = DEEPBLUE;
    self.searchTF.delegate = self;
    self.navigationItem.titleView = self.searchTF;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GotoWeb:) name:@"pushview" object:nil];

    self.slidetab = [[QCSlideSwitchView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT - 65)];
    self.slidetab.slideSwitchViewDelegate = self;
    
    self.slidetab.tabItemNormalColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1];
    self.slidetab.tabItemSelectedColor = DEEPBLUE;
    self.slidetab.shadowImage = [[UIImage imageNamed:@"ic_slide"] stretchableImageWithLeftCapWidth:59.0f topCapHeight:0.0f];
    self.slidetab.topScrollView.backgroundColor = [UIColor whiteColor];
    
    
    self.baiduview = [[BaiduTableViewController alloc] init];
    self.baiduview.title = @"百度";
    
    self.zhihuview = [[ZhihuTableViewController alloc] init];
    self.zhihuview.title = @"知乎";

    self.haosouview = [[HaosouTableViewController alloc] init];
    self.haosouview.title = @"好搜";
    
    self.wikiview = [[WikiTableViewController alloc] init];
    self.wikiview.title = @"维基百科";

    [self.slidetab buildUI];
    
    [self.view addSubview:self.slidetab];
    
    [self.revealController setRecognizesPanningOnFrontView:YES];

#warning testload
//    [self.baiduview StartSearch];
}

- (void)gotoLeftView
{
    [self.searchTF resignFirstResponder];
    [self.revealController showViewController:self.revealController.leftViewController];
}

- (void)startSearch
{
    [self.searchTF resignFirstResponder];
    self.baiduview.searchstr = self.searchTF.text;
    self.zhihuview.searchstr = self.searchTF.text;
    self.haosouview.searchstr = self.searchTF.text;
    self.wikiview.searchstr = self.searchTF.text;

    [self.baiduview StartSearch];
    [self.zhihuview StartSearch];
    [self.haosouview StartSearch];
    [self.wikiview StartSearch];
}

- (NSUInteger)numberOfTab:(QCSlideSwitchView *)view
{
    // you can set the best you can do it ;
    return 4;
}

- (UIViewController *)slideSwitchView:(QCSlideSwitchView *)view viewOfTab:(NSUInteger)number
{
    if (number == 0) {
        return self.baiduview;
    } else if (number == 1) {
        return self.zhihuview;
    } else if (number == 2) {
        return self.haosouview;
    } else if (number == 3) {
        return self.wikiview;
    } else {
        return nil;
    }
}

- (void)slideSwitchView:(QCSlideSwitchView *)view didselectTab:(NSUInteger)number
{
    [self.searchTF resignFirstResponder];

    BaiduTableViewController *vc1 = nil;
    ZhihuTableViewController *vc2 = nil;
    HaosouTableViewController *vc3 = nil;
    WikiTableViewController *vc4 = nil;
    
    if (number == 0) {
        vc1 = self.baiduview;
    } else if (number == 1) {
        vc2 = self.zhihuview;
    } else if (number == 2) {
        vc3 = self.haosouview;
    } else if (number == 3) {
        vc4 = self.wikiview;
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.searchTF) {
        [self.searchTF resignFirstResponder];
        [self startSearch];
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
//    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBarHidden = NO;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)GotoWeb:(NSNotification *)noti
{
    SearchDetModel *seachmodel = [noti object];
    if ([[[LocalData customDefault] objectForKey:LOADTYPE] integerValue] == 0) {
        SearchWeb *webview = [SearchWeb webVCWithUrlStr:seachmodel.Link];
        webview.webmodel = seachmodel;
        [self.navigationController pushViewController:webview animated:YES];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:seachmodel.Link]];
    }

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
