//
//  UIApplicationViewController.m
//  CommonCategory
//
//  Created by Tang杰 on 2018/11/5.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import "UIApplicationViewController.h"
#import "UIApplication+Header.h"

@interface UIApplicationViewController ()
@end

@implementation UIApplicationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, CGRectGetWidth(self.view.bounds)-20, 400)];
    label.numberOfLines = 0;
    [self.view addSubview:label];
    label.text = [NSString stringWithFormat:@"app名称：%@\napp版本：%@\napp构建版本：%@\nbundleID：%@\n状态栏颜色：%@",TJ_Application.appName,TJ_Application.appVersion,TJ_Application.appBuildVersion,TJ_Application.appBundleID,TJ_Application.statusBarIsWhite?@"白色":@"黑色"];
    
    NSLog(@"%@",[[NSBundle mainBundle] infoDictionary]);
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
