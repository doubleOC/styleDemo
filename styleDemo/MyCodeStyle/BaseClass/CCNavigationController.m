//
//  CCNavigationController.m
//  MyCodeStyle
//
//  Created by mrc on 2017/2/24.
//  Copyright © 2017年 mrc. All rights reserved.
//

#import "CCNavigationController.h"

@interface CCNavigationController ()

@end

@implementation CCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.barTintColor = [UIColor redColor];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:RGB(255, 255, 255)}];
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
