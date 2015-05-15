//
//  SettingViewController.m
//  Search
//
//  Created by  plusub on 4/11/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"设置";
    
    UIBarButtonItem *leftbtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_menu_black"] style:UIBarButtonItemStylePlain target:self action:@selector(gotoLeftView)];
    [self.navigationItem setLeftBarButtonItem:leftbtn];
    self.loadtypeSC.tintColor = DEEPBLUE;
    
    if ([[[LocalData customDefault] objectForKey:LOADTYPE] integerValue] == 0) {
        self.loadtypeSC.selectedSegmentIndex = 0;
    } else {
        self.loadtypeSC.selectedSegmentIndex = 1;
    }
}

- (IBAction)ChooseType:(id)sender
{
    if (self.loadtypeSC.selectedSegmentIndex == 0) {
        [LocalData setDefaultValue:@"0" withKey:LOADTYPE];
    } else {
        [LocalData setDefaultValue:@"1" withKey:LOADTYPE];
    }
}

- (void)gotoLeftView
{
    [self.revealController showViewController:self.revealController.leftViewController];
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
