//
//  FalseOneViewController.m
//  DSBlockTestDemo
//
//  Created by dasheng on 16/1/28.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "FalseOneViewController.h"


@implementation FalseOneViewController{
    
    int (^square)(int a);
}

- (void)dealloc{
    
    //不会执行
    NSLog(@"释放了");
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    /**
     *
     *  square为实例变量，self强引用square，square里又强引用了self，发生循环引用
     *
     */
    square = ^(int a){
        return [self testMethon:a];
    };
    int result = square(10);
    NSLog(@"%d",result);
}

- (int)testMethon:(int)a{
    
    return a*a;
}

@end
