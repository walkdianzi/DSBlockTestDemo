//
//  FalseOneViewController.m
//  DSBlockTestDemo
//
//  Created by dasheng on 16/1/28.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "FalseOneViewController.h"


@implementation FalseOneViewController{
    
    int (^square1)(int a);
    
    
    int (^square2)(int a);
    int b;
}

- (void)dealloc{
    
    //不会执行
    NSLog(@"释放了");
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    /**
     *
     *  square为成员变量，self强引用square，square里又强引用了self，发生循环引用
     *
     */
    square1 = ^(int a){
        return [self testMethon:a];
    };
    int result1 = square1(10);
    NSLog(@"square1 %d",result1);
    
    
    /*---------------------*/
    b = 10;  //square2，b都为成员变量也会发生循环引用
    square2 = ^(int a){
        return b + a;
    };
    int result2 = square2(10);
    NSLog(@"square2 %d",result2);
}

- (int)testMethon:(int)a{
    
    return a*a;
}

@end
