//
//  FalseThreeViewController.m
//  DSBlockTestDemo
//
//  Created by dasheng on 16/1/28.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "FalseThreeViewController.h"
#import "BlockView.h"

@implementation FalseThreeViewController{
    
    BlockView  *_blockView1;
}

- (void)dealloc{
    
    //不会执行
    NSLog(@"释放了");
}

- (void)viewDidLoad{
    
    [super viewDidLoad];

    /**
     *
     *  self强引用_blockView1,_blockView1强引用square，square里又强引用了self，发生循环引用
     *
     */
    _blockView1 = [[BlockView alloc] init];
    _blockView1.square = ^(int a){
        return [self testMethon:a];
    };
    
    
    /**
     *
     *  _blockView2强引用square，square里又强引用了_blockView2，发生循环引用
     *
     */
    BlockView  *blockView2 = [[BlockView alloc] init];
    blockView2.square = ^(int a){
        blockView2.backgroundColor = [UIColor redColor];
        return [self testMethon:a];
    };
    
    
    
    BlockView  *blockView3 = [[BlockView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:blockView3];    //加入这句之后，self强引用了blockView3，blockView3强引用square，square里又强引用了self，发生循环引用
    __weak __typeof(blockView3)weakSelf3 = blockView3;
    blockView3.square = ^(int a){
        __strong __typeof(weakSelf3)strongSelf3 = weakSelf3;
        strongSelf3.backgroundColor = [UIColor redColor];
        return [self testMethon:a];
    };
    blockView3.square(5);
}

- (int)testMethon:(int)a{
    
    return a*a;
}
@end
