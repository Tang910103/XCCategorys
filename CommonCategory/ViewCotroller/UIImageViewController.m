//
//  UIImageViewController.m
//  CommonCategory
//
//  Created by Tang杰 on 2018/11/1.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import "UIImageViewController.h"
#import "UIImage+Color.h"
#import <JXTAlertManager/JXTAlertManagerHeader.h>

@interface UIImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *testImageView;

@end

@implementation UIImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[UIImageViewController alloc] initWithNibName:NSStringFromClass(self.class) bundle:nil];
    }
    return self;
}
- (IBAction)clickButton:(UIButton *)sender {
    [JXTAlertView showAlertViewWithTitle:nil message:nil cancelButtonTitle:@"cancel" buttonIndexBlock:^(NSInteger buttonIndex) {
        if (buttonIndex == 0) {
            NSLog(@"cancel");
        }
        else if (buttonIndex == 1) {
            self.testImageView.image = [UIImage imageWithColor:[UIColor greenColor]];
        }
        else if (buttonIndex == 2) {
            self.testImageView.image = [UIImage scaleToSize:[UIImage imageNamed:@"image"] size:CGSizeMake(100, 100)];
        }
        else if (buttonIndex == 3) {
        }
        else if (buttonIndex == 4) {

        }
        else if (buttonIndex == 5) {
            NSLog(@"按钮5");
        }
    } otherButtonTitles:@"根据颜色生成图片", @"按钮2", @"按钮3", @"按钮4", @"按钮5", nil];
}


@end
