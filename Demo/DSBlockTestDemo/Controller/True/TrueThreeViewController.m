//
//  TrueThreeViewController.m
//  DSBlockTestDemo
//
//  Created by dasheng on 16/1/28.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "TrueThreeViewController.h"
#import "BlockView.h"

@implementation TrueThreeViewController{
    
    BlockView  *_blockView1;
}

- (void)dealloc{
    
    //会执行
    NSLog(@"释放了");
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    
    _blockView1 = [[BlockView alloc] init];
    __weak __typeof(self)weakSelf1 = self;
    _blockView1.square = ^(int a){
        __strong __typeof(weakSelf1)strongSelf1 = weakSelf1;
        return [strongSelf1 testMethon:a];
    };
    
    
    /*---------------------------------*/
    BlockView  *blockView2 = [[BlockView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    blockView2.backgroundColor = [UIColor blackColor];
    __weak __typeof(blockView2)weakSelf2 = blockView2;
    blockView2.square = ^(int a){
        __strong __typeof(weakSelf2)strongSelf2 = weakSelf2;
        strongSelf2.backgroundColor = [UIColor redColor];
        return [self testMethon:a];
    };
    blockView2.square(5);
    
    
    /*---------------------------------*/
    BlockView  *blockView3 = [[BlockView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    blockView3.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blockView3];    //加入这句之后self强引用了blockView3，所以square里要使用self的话要采取weak–strong dance
    __weak __typeof(blockView3)weakSelf3 = blockView3;
    __weak __typeof(self)weakSelf4 = self;
    blockView3.square = ^(int a){
        __strong __typeof(weakSelf3)strongSelf3 = weakSelf3;
        strongSelf3.backgroundColor = [UIColor redColor];
        
        __strong __typeof(weakSelf4)strongSelf4 = weakSelf4;
        return [strongSelf4 testMethon:a];
    };
    blockView3.square(5);
}

- (int)testMethon:(int)a{
    
    return a*a;
}

@end
