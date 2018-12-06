//
//  UIColorViewController.m
//  CommonCategory
//
//  Created by Tang杰 on 2018/11/5.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import "UIColorViewController.h"
#import "UIColor+hex.h"
#import "UIView+frame.h"

@interface UIColorViewController ()

@end

@implementation UIColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
    
    NSArray *colors = @[@"0x756877",@"#afd989",@"a9faf8",@"0Xabc989"];
    CGFloat x = 10;
    CGFloat y = 74;
    CGFloat width = (self.view.width - 5 * x) / 4;
    width = 82;
    for (NSInteger i = 0; i < 10; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x + (width + x) * (i % 4), y + (40 + x) * (i / 4), ceilf(width), 40)];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        label.adjustsFontSizeToFitWidth = YES;
        [self.view addSubview:label];
        if (i >= colors.count) {
            NSInteger index = i - colors.count;
            if (index == 0) {
                label.backgroundColor = kColorHex_RGB(0xbb09b8);
                label.text = @"0xbb09b8";
            } else if (index == 1) {
                label.backgroundColor = kColorHex_RGB(456789);
                label.text = @"456789";
            } else if (index == 2) {
                label.backgroundColor = kColor_RGB(89, 129, 229);
                label.text = @"(89, 129, 229)";
            } else {
                label.backgroundColor = kColorHex_RGBA(698764, 0.7);
                label.text = @"698764 0.7";
            }
            continue;
        }
        label.text = colors[i];
        label.backgroundColor = [UIColor colorWithHexString:label.text];
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
