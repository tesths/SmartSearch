//
//  SearchWeb.m
//  Search
//
//  Created by  plusub on 4/11/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import "SearchWeb.h"
#import "SearchDB.h"

@interface SearchWeb ()<UIWebViewDelegate>
@property (strong, nonatomic) NJKWebViewProgress *progressProxy;
@property (strong, nonatomic) NJKWebViewProgressView *progressView;
@property (assign, nonatomic) NSNumber *dbstatus;
@property (strong, nonatomic) UIImage *rightImg;
@property (strong, nonatomic) UIBarButtonItem *r;


@end

@implementation SearchWeb
+ (instancetype)webVCWithUrlStr:(NSString *)curUrlStr
{
    if (!curUrlStr || curUrlStr.length <= 0) {
        return nil;
    } else {
        return [[self alloc] initWithAddress:curUrlStr];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"加载中...";
    UIBarButtonItem *l = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_backarrow"] style:UIBarButtonItemStylePlain target:self action:@selector(backtocenter)];
    [self.navigationItem setLeftBarButtonItem:l];
    
    if ([SearchDB selectChoose:self.webmodel.Title]) {
        self.rightImg = [UIImage imageNamed:@"feed_button_like_active"];
        self.dbstatus = [NSNumber numberWithInteger:1];
    } else {
        self.rightImg = [UIImage imageNamed:@"feed_button_like"];
        self.dbstatus = [NSNumber numberWithInteger:0];
    }
    self.r = [[UIBarButtonItem alloc] initWithImage:self.rightImg style:UIBarButtonItemStylePlain target:self action:@selector(collectWeb)];
    [self.navigationItem setRightBarButtonItem:self.r];
    
    _progressProxy = [[NJKWebViewProgress alloc] init];
    self.delegate = _progressProxy;
    @weakify(self);
    _progressProxy.progressBlock = ^(float progress) {
        @strongify(self);
        [self.progressView setProgress:progress animated:NO];
    };
    
    CGFloat progressBarHeight = 2.f;
    CGRect navigaitonBarBounds = self.navigationController.navigationBar.bounds;
    CGRect barFrame = CGRectMake(0, navigaitonBarBounds.size.height - progressBarHeight, navigaitonBarBounds.size.width, progressBarHeight);
    _progressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
    _progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    _progressView.progressBarView.backgroundColor = [UIColor greenColor];
    
    [self.revealController setRecognizesPanningOnFrontView:NO];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.navigationController.navigationBar addSubview:_progressView];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [_progressView removeFromSuperview];
}

- (void)collectWeb
{
    if ([self.dbstatus integerValue] == 0) {
        [SearchDB insertData:self.webmodel];
        self.rightImg = [UIImage imageNamed:@"feed_button_like_active"];
        self.dbstatus = [NSNumber numberWithInteger:1];
    } else {
        [SearchDB deleteData:self.webmodel.Title];
        self.rightImg = [UIImage imageNamed:@"feed_button_like"];
        self.dbstatus = [NSNumber numberWithInteger:0];
    }
    self.r.image = self.rightImg;
    [self.navigationItem setRightBarButtonItem:self.r];
    NSNotification *changebtn = [NSNotification notificationWithName:@"changebtn" object:self.dbstatus];
    [[NSNotificationCenter defaultCenter] postNotification:changebtn];
}

- (void)backtocenter
{
    [self.navigationController popViewControllerAnimated:YES];
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
