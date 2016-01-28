//
//  FalseFourViewController.m
//  DSBlockTestDemo
//
//  Created by dasheng on 16/1/28.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "FalseFourViewController.h"

@implementation FalseFourViewController{
    
    int (^square)(int a);
    int b;
}

- (void)dealloc{
    
    //不会执行
    NSLog(@"释放了");
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    /*---------------------*/
    /**
     *
     *  square，b都为成员变量也会发生循环引用。
     *  self强引用square，square里又强引用了b，b为成员变量强引用了self，发生循环引用
     *
     */
    b = 10;
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
