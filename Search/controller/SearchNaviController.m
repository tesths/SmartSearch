//
//  SearchNaviController.m
//  Search
//
//  Created by  plusub on 4/11/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import "SearchNaviController.h"

@interface SearchNaviController ()

@end

@implementation SearchNaviController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setBarTintColor:DEEPBLUE];//设置navigationbar的颜色
    [self.navigationBar setTintColor:[UIColor whiteColor]];//设置navigationbar上左右按钮字体颜色
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [self.navigationBar setTranslucent:false];

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
