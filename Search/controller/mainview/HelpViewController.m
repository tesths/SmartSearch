//
//  HelpViewController.m
//  Search
//
//  Created by  plusub on 4/11/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import "HelpViewController.h"

@interface HelpViewController ()

@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"帮助";
    
    UIBarButtonItem *leftbtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_menu_black"] style:UIBarButtonItemStylePlain target:self action:@selector(gotoLeftView)];
    [self.navigationItem setLeftBarButtonItem:leftbtn];
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
