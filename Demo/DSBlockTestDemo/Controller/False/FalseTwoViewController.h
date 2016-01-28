//
//  FalseTwoViewController.h
//  DSBlockTestDemo
//
//  Created by dasheng on 16/1/28.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "BaseViewController.h"

typedef int(^squareClass)(int a);

@interface FalseTwoViewController : BaseViewController

@property(nonatomic, copy)int (^square1)(int a);

@property(nonatomic, copy)squareClass square2;

@end
