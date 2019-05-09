//
//  NSDateViewController.m
//  CommonCategory
//
//  Created by Tang杰 on 2018/12/29.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import "NSDateViewController.h"
#import "NSDate+category.h"

@interface NSDateViewController ()
{
    UIDatePicker *_datePicker;
    NSDate *_date1;
    NSDate *_date2;
    UIButton *_selectedButton;
}
@end


@implementation NSDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textView.editable = NO;

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(dateSelectedDone)];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    _datePicker = datePicker;
    [self.view addSubview:datePicker];
    [datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.equalTo(@200);
        make.bottom.equalTo(self.view).offset(200);
    }];
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"date1";
    label1.textAlignment = NSTextAlignmentCenter;
    label1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view);
        make.height.equalTo(@45);
        make.width.equalTo(@50);
    }];
    UIButton *date1 = [UIButton buttonWithType:UIButtonTypeCustom];
    date1.tag = 1;
    [date1 setTitle:[NSDate dateToString:datePicker.date withDateFormat:yyyy_MM_dd_HH_mm_ss_zzz] forState:UIControlStateNormal];
    date1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:date1];
    [date1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label1.mas_right).offset(1);
        make.right.equalTo(self.view);
        make.height.centerY.equalTo(label1);
    }];
    [date1 addTarget:self action:@selector(clickDate1:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"date2";
    label2.textAlignment = NSTextAlignmentCenter;
    label2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label1.mas_bottom).offset(1);
        make.width.equalTo(label1);
        make.height.equalTo(@45);
    }];
    UIButton *date2 = [UIButton buttonWithType:UIButtonTypeCustom];
    date2.tag = 2;
    [date2 setTitle:[NSDate dateToString:datePicker.date withDateFormat:yyyy_MM_dd_HH_mm_ss_zzz] forState:UIControlStateNormal];
    date2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:date2];
    [date2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.centerX.equalTo(date1);
        make.centerY.equalTo(label2);
    }];
    [date2 addTarget:self action:@selector(clickDate2:) forControlEvents:UIControlEventTouchUpInside];

    [datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    self.textView.textAlignment = NSTextAlignmentLeft;
    [self.textView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(date2.mas_bottom).offset(1);
        make.left.right.bottom.equalTo(self.view);
    }];
    _date1 = datePicker.date;
    _date2 = datePicker.date;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dateSelectedDone];
    });
}

- (void)datePickerValueChanged:(UIDatePicker *)datePicker {
    if (_selectedButton.tag == 1) {
        self->_date1 = datePicker.date;
    } else {
        self->_date2 = datePicker.date;
    }
    [_selectedButton setTitle:[NSDate dateToString:datePicker.date withDateFormat:yyyy_MM_dd_HH_mm_ss_zzz] forState:UIControlStateNormal];
}


- (void)clickDate1:(UIButton *)button {
    _selectedButton = button;
    [self showDatePicker];
}

- (void)clickDate2:(UIButton *)button {
    _selectedButton = button;
    [self showDatePicker];
}


- (void)showDatePicker {
    [_datePicker setDate:[NSDate date]];
    [UIView animateWithDuration:.5 animations:^{
        [self->_datePicker mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view);
        }];
        [self.view layoutIfNeeded];
    }];
}

- (void)hideDatePicker {
    [UIView animateWithDuration:.5 animations:^{
        [self->_datePicker mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view).offset(200);
        }];
        [self.view layoutIfNeeded];
    }];
}


- (void)dateSelectedDone {
    [self hideDatePicker];
    
    NSDate *date1 = _date1;
    NSDate *date2 = _date2;

    NSString *str = [NSString stringWithFormat:@"date1->年:%ld  月:%ld  日:%ld  \n星期:%ld 小时:%ld",(long)date1.year, (long)date1.month, (long)date1.day, (long)date1.weekday, (long)date1.hour];
    str = [str stringByAppendingString:[NSString stringWithFormat:@"\ndate2->年:%ld  月:%ld  日:%ld  \n星期:%ld 小时:%ld",(long)date2.year, (long)date2.month, (long)date2.day, (long)date2.weekday, (long)date2.hour]];
    str = [str stringByAppendingString:[NSString stringWithFormat:@"\n1970-01-01 00:00:00转化为系统时区区时间:%@",[NSDate worldTimeToSystemTime:[NSDate dateWithTimeIntervalSince1970:0]]]];
    self.textView.text = str;
    
    NSLog(@"date1-----%@",date1.description);
    NSLog(@"date2-----%@",date2.description);
}


@end
