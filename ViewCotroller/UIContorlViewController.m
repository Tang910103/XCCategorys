//
//  UIButtonViewController.m
//  CommonCategory
//
//  Created by Tang杰 on 2018/12/29.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import "UIContorlViewController.h"
#import "UIControl+category.h"
#import "UIColor+hex.h"
#import <JXTAlertManager/JXTAlertView.h>

@interface UIContorlViewController ()

@end

@implementation UIContorlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"Touch" forState:UIControlStateNormal];
    button.backgroundColor = UIColor.randomColor;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).offset(50);
        make.right.equalTo(self.view).offset(-50);
        make.height.equalTo(button.mas_width);
    }];
    void(^__block block)(UIControl *) = ^(UIControl *button){
        [(UIButton*)button setTitle:@"touch down" forState:UIControlStateNormal];
    };
    [button addTouchDownBlock:block];

    [button addTouchDragExitBlock:^(UIControl *sender) {
        [(UIButton*)sender setTitle:@"touch drag exit" forState:UIControlStateNormal];
    }];
    [button addTouchUpInsideBlock:^(UIControl *sender) {
        [self.view endEditing:YES];
        [(UIButton*)sender removeTouchDownBlock:block];
        [(UIButton*)sender setTitle:@"touch up inside" forState:UIControlStateNormal];
    }];
    [button addTouchCancelBlock:^(UIControl *sender) {
        [(UIButton*)sender setTitle:@"touch cancel" forState:UIControlStateNormal];
    }];
    
    
    UITextField *textField = [[UITextField alloc] init];
    textField.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:textField];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(button.mas_top);
    }];
    [textField addEditingDidBeginBlock:^(UIControl *sender) {
        [button setTitle:@"Editing Did Begin" forState:UIControlStateNormal];
    }];
    [textField addEditingChangedBlock:^(UIControl *sender) {
        [button setTitle:@"Editing Changed" forState:UIControlStateNormal];
    }];
    [textField addEditingDidEndBlock:^(UIControl *sender) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [button setTitle:@"Editing Did End" forState:UIControlStateNormal];
        });
    }];
    [textField addEditingDidEndOnExitBlock:^(UIControl *sender) {
        [button setTitle:@"Editing Did End On Exit" forState:UIControlStateNormal];
    }];
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
