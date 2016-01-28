//
//  TrueFourViewController.m
//  DSBlockTestDemo
//
//  Created by dasheng on 16/1/28.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "TrueFourViewController.h"

@implementation TrueFourViewController{
    
    int (^square)(int a);
}

- (void)dealloc{
    
    //会执行
    NSLog(@"释放了");
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    int b = 10;
    square = ^(int a){
        return b + a;
    };
    int result = square(10);
    NSLog(@"square %d",result);
}

- (int)testMethon:(int)a{
    
    return a*a;
}

@end
