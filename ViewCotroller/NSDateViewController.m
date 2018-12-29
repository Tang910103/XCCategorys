//
//  NSDateViewController.m
//  CommonCategory
//
//  Created by Tang杰 on 2018/12/29.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import "NSDateViewController.h"
#import "UIControl+category.h"

@interface NSDateViewController ()

@end

@implementation NSDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *date1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [date1 setTitle:@"date1" forState:UIControlStateNormal];
    date1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:date1];
    [date1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view);
        make.height.equalTo(@45);
    }];
    [date1 addTouchUpInsideBlock:^(UIControl *sender) {
        
    }];
    
    UIButton *date2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [date2 setTitle:@"date2" forState:UIControlStateNormal];
    date2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:date2];
    [date2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self.view);
        make.left.equalTo(date1.mas_right).offset(1);
        make.height.width.equalTo(date1);
    }];
    [date2 addTouchUpInsideBlock:^(UIControl *sender) {
        
    }];
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
//    [self.textView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(date1.mas_bottom);
//    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
