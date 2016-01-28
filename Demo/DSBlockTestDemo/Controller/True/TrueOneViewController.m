//
//  TrueOneViewController.m
//  DSBlockTestDemo
//
//  Created by dasheng on 16/1/28.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "TrueOneViewController.h"

@implementation TrueOneViewController{
    
    int (^square2)(int a);
}

- (void)dealloc{
    
    //会执行
    NSLog(@"释放了");
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    /**
     *
     *  square为局部变量，self没有强引用square1，不会发生循环引用
     *
     */
    int (^square1)(int a);
    square1 = ^(int a){
        return [self testMethon:a];
    };
    int result1 = square1(10);
    NSLog(@"square1 %d",result1);
    
    
    /*------------------第二种方法--------------------*/
    /**
     *
     *  使用weak–strong dance，
     *
     */
    __weak __typeof(self)weakSelf = self;
    square2 = ^(int a){
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        return [strongSelf testMethon:a];
    };
    int result2 = square2(10);
    NSLog(@"square2 %d",result2);
}

- (int)testMethon:(int)a{
    
    return a*a;
}

@end
