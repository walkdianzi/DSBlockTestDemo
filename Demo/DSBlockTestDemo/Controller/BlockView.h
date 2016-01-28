//
//  BlockView.h
//  DSBlockTestDemo
//
//  Created by dasheng on 16/1/28.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlockView : UIView
//???: 为什么用copy，而不是strong
@property(nonatomic, copy)int (^square)(int a);

@end
