//
//  UIViewViewController.m
//  CommonCategory
//
//  Created by Tang杰 on 2018/11/5.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import "UIViewViewController.h"
#import "UIView+frame.h"
#import "UIView+layer.h"
#import "UIView+gesture.h"
#import "NSObject+runtime.h"

@interface UIViewViewController ()
@property (nonatomic, strong) UILabel *label;

@end

@implementation UIViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.width = 200;
    label.height = 300;
    label.cornerRadius = 5;
    label.borderColor = [UIColor blueColor];
    label.borderWidth = 1;
    label.numberOfLines = 0;
    [UIView addSingleTapGestureForView:label target:self action:@selector(singleTapGesture:)];
    [UIView addDoubleTapGestureForView:label target:self action:@selector(doubleTapGesture:)];
    [UIView addSwipeLeftGestureForView:label target:self action:@selector(swipeLeftGesture:)];
    [UIView addSwipeRightGestureForView:label target:self action:@selector(swipeRightGesture:)];
    [UIView addLongPressGestureRecognizerForView:label target:self action:@selector(longPressGesture:)];
    
    [self.view addSubview:label];
    _label = label;
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSString *text = [NSString stringWithFormat:@" x = %f\n y = %f\n width = %f\n height = %f\n bottom = %f\n right = %f\n center = %@\n centerX = %f\n centerY = %f",self.label.x,self.label.y,self.label.width,self.label.height,self.label.bottom,self.label.right,NSStringFromCGPoint(self.label.center),self.label.centerX,self.label.centerY];
    self.label.text = text;
}
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.label.centerX = self.view.centerX;
    self.label.centerY = self.view.centerY;
}

- (void)singleTapGesture:(UITapGestureRecognizer *)tap {
    [self logGestureRecognizer:tap];
}

- (void)doubleTapGesture:(UITapGestureRecognizer *)tap {
    [self logGestureRecognizer:tap];
}
- (void)swipeLeftGesture:(UITapGestureRecognizer *)tap {
    [self logGestureRecognizer:tap];
}
- (void)swipeRightGesture:(UITapGestureRecognizer *)tap {
    [self logGestureRecognizer:tap];
}
- (void)longPressGesture:(UITapGestureRecognizer *)tap {
    [self logGestureRecognizer:tap];
}

- (void)logGestureRecognizer:(UIGestureRecognizer *)tap {
    NSMutableDictionary *dic = @{}.mutableCopy;
    for (NSString *key in [tap.class getProperties]) {
        [dic setObject:[tap valueForKey:key] forKey:key];
    }
    NSLog(@"%@",dic);
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
