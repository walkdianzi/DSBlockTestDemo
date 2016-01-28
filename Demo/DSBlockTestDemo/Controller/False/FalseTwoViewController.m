//
//  FalseTwoViewController.m
//  DSBlockTestDemo
//
//  Created by dasheng on 16/1/28.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "FalseTwoViewController.h"

@implementation FalseTwoViewController

- (void)dealloc{
    
    //不会执行
    NSLog(@"释放了");
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    /**
     *
     *  self强引用square1，square1里又强引用了self，发生循环引用
     *
     */
    self.square1 = ^(int a){
        return [self testMethon:a];
    };
    int result1 = self.square1(10);
    NSLog(@"square1 %d",result1);
    
    
    self.square2 = ^(int a){
        return [self testMethon:a];
    };
    int result2 = self.square2(10);
    NSLog(@"square2 %d",result2);
}

- (int)testMethon:(int)a{
    
    return a*a;
}

@end
