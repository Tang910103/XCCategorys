//
//  UnicodeViewController.m
//  CommonCategory
//
//  Created by Tang杰 on 2018/12/18.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import "UnicodeViewController.h"
#import <Masonry/Masonry.h>
#import "NSString+unicode.h"

@interface UnicodeViewController ()

@end

@implementation UnicodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self testArray];
    [self testSet];
    [self testEmpty];
    [self testDictionary];
    [self testDictionayArray];
    [self testArraySet];
    [self testDictionayArraySet];
}

- (void)testDictionary
{
    NSDictionary *dict = @{
                           @"名字" : @"杰克",
                           @"年龄" : @20,
                           };
    
    NSLog(@"\n%@", dict);
}

- (void)testArray
{
    NSArray *array = @[
                       @"语文",
                       @"数学",
                       @"外语",
                       ];
    
    NSLog(@"%@", array);
}

- (void)testSet
{
    NSMutableSet *mSet = [NSMutableSet set];
    [mSet addObject:@"语文"];
    [mSet addObject:@"数学"];
    [mSet addObject:@"外语"];
    [mSet addObject:mSet.mutableCopy];
    
    NSLog(@"%@", mSet);
}

- (void)testArraySet
{
    NSMutableSet *mSet = [NSMutableSet set];
    [mSet addObject:@"语文"];
    [mSet addObject:@"数学"];
    [mSet addObject:@"外语"];
    [mSet addObject:@[@"科学"]];
    NSLog(@"%@", mSet);
    NSMutableArray *mArray = @[].mutableCopy;
    [mArray addObject:mSet];
    
    NSLog(@"%@", mArray);
}

- (void)testDictionayArray
{
    NSDictionary *dict = @{@"名字" : @"杰克",
                           @"年龄" : @12,
                           @"内容" : @{
                                   @"userName" : @"rose",
                                   @"message" : @"好好学习",
                                   @"testArray" : @[@"数学",
                                                    @"英语",
                                                    @"历史",
                                                    @[
                                                        @"zhangsan",
                                                        @"lisi",
                                                        @[
                                                            @"test1",
                                                            @"test2",
                                                            @"test3"
                                                            ],
                                                        ],
                                                    ],
                                   @"test" : @{
                                           @"key1" : @"测试1",
                                           @"键值2" : @"test2",
                                           @"key3" : @"test3"
                                           }
                                   
                                   },
                           
                           
                           };
    NSLog(@"%@", dict);
}

- (void)testEmpty
{
    NSArray *array = @[];
    NSMutableSet *set = [NSMutableSet set];
    NSDictionary *dict = @{};
    
    NSLog(@"%@", array);
    NSLog(@"%@", set);
    NSLog(@"%@", dict);
}

- (void)testDictionayArraySet
{
    NSMutableSet *mSet = [NSMutableSet set];
    [mSet addObject:@"英语"];
    [mSet addObject:@"历史"];
    [mSet addObject:@"数学"];
    
    NSArray *arr = @[@"a", @"b", @"c"];
    [mSet addObject:arr];
    
    NSMutableSet *subSet = mSet.mutableCopy;
    NSMutableSet *subSubSet = mSet.mutableCopy;
    [subSet addObject:subSubSet];
    [mSet addObject:subSet];
    
    NSDictionary *subDict = @{
                              @"键0" : @"值0",
                              @"键1" : @"值1",
                              @"键2" : @"值2",
                              };
    [mSet addObject:subDict];
    NSDictionary *dict = @{@"something" : mSet};
    
    NSLog(@"%@", dict);
}
@end
