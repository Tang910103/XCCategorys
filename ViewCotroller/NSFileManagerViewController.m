//
//  NSFileManagerViewController.m
//  CommonCategory
//
//  Created by Tang杰 on 2018/11/7.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import "NSFileManagerViewController.h"
#import "UIView+frame.h"
#import "JXTAlertManagerHeader.h"
#import "NSFileManager+path.h"

@interface NSFileManagerViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *titleArray;

@end

@implementation NSFileManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    _titleArray = @[@"获取LibraryPath",@"获取CachesPath",@"获取DocumentsPath",@"获取PreferencesPath",@"获取TmpPath",@"计算单个文件大小",@"计算目录大小",@"清除文件"];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSError *error = nil;
    NSString *path = [[NSFileManager getCachesPath] stringByAppendingPathComponent:@"Info.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] copyItemAtPath:[[NSBundle mainBundle].bundlePath stringByAppendingPathComponent:@"Info.plist"] toPath:path error:&error];
        if (error) {
            NSLog(@"文件copy失败：%@",error);
        }
    }
    
    NSString *message = nil;
    if (indexPath.row == 0) {
        message = [NSFileManager getLibraryPath];
    } else if (indexPath.row == 1) {
        message = [NSFileManager getCachesPath];
    } else if (indexPath.row == 2) {
        message = [NSFileManager getDocumentsPath];
    } else if (indexPath.row == 3) {
        message = [NSFileManager getPreferencesPath];
    } else if (indexPath.row == 4) {
        message = [NSFileManager getTmpPath];
    } else if (indexPath.row == 5) {
        message = [NSString stringWithFormat:@"info.plist 文件大小：%f",[NSFileManager getFileSizeAtPath:path]];
    } else if (indexPath.row == 6) {
        message = [NSString stringWithFormat:@"缓存文件夹大小：%f",[NSFileManager getFolderSizeAtPath:[NSFileManager getCachesPath]]];
    } else if (indexPath.row == 7) {
        message = [NSString stringWithFormat:@"tmp文件夹移除%@",[NSFileManager clearCache:[NSFileManager getTmpPath]] ? @"成功" : @"失败"];
    }
    jxt_showToastTitleMessageDismiss([self.titleArray objectAtIndex:indexPath.row], message, 2, ^(NSInteger buttonIndex) {
    });
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [self.titleArray objectAtIndex:indexPath.row];
    
    return cell;
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 45;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.tableFooterView = [[UIView alloc] init];
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

@end
