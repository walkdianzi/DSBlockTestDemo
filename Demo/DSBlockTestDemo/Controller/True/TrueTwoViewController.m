//
//  TrueTwoViewController.m
//  DSBlockTestDemo
//
//  Created by dasheng on 16/1/28.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "TrueTwoViewController.h"

@implementation TrueTwoViewController

- (void)dealloc{
    
    //会执行
    NSLog(@"释放了");
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    __weak __typeof(self)weakSelf1 = self;
    self.square1 = ^(int a){
        __strong __typeof(weakSelf1)strongSelf1 = weakSelf1;
        return [strongSelf1 testMethon:a];
    };
    int result1 = self.square1(10);
    NSLog(@"square1 %d",result1);
    
    
    __weak __typeof(self)weakSelf2 = self;
    self.square2 = ^(int a){
        __strong __typeof(weakSelf2)strongSelf2 = weakSelf2;
        return [strongSelf2 testMethon:a];
    };
    int result2 = self.square2(10);
    NSLog(@"square2 %d",result2);
}

- (int)testMethon:(int)a{
    
    return a*a;
}

@end
