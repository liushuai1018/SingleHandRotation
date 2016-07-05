//
//  LS_TpoUp_View.m
//  单指转盘
//
//  Created by 铂隆资产1号 on 16/5/16.
//  Copyright © 2016年 铂隆资产. All rights reserved.
//

#import "LS_TpoUp_View.h"
#import "LS_Rotation_View.h"

@interface LS_TpoUp_View ()

@property (strong, nonatomic) UIView *view;

@property (assign, nonatomic) CGPoint oldPoint;

@end

@implementation LS_TpoUp_View

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createrAllSubView];
    }
    return self;
}

#pragma mark - 创建所有子视图
- (void)createrAllSubView
{
    self.backgroundColor = [UIColor whiteColor];
    
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    
    // 背景
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, height * 0.3, width, height * 0.6)];
    view.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.96 alpha:1];
    [self addSubview:view];
    
    // 第一个圆
    LS_Rotation_View *view1 = [[LS_Rotation_View alloc] initWithFrame:CGRectMake(0, 0, width - 40, width - 40)];
    view1.backgroundColor = [UIColor whiteColor];
    view1.center = view.center;
    view1.layer.masksToBounds = YES;
    view1.layer.cornerRadius = CGRectGetWidth(view1.frame) * 0.5;
    [self addSubview:view1];
    
//    _view = view1;
    
    // 第二个圆
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(view1.frame) * 0.5, CGRectGetWidth(view1.frame) * 0.5)];
    view2.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.96 alpha:1.0];
    view2.center = view1.center;
    view2.layer.masksToBounds = YES;
    view2.layer.cornerRadius = CGRectGetWidth(view2.frame) * 0.5;
    [self addSubview:view2];
    
    
    for (int i = 0; i < 8; i++) {
        
        // 添加物
        UILabel *view3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        view3.backgroundColor = [self setColor];
        view3.text = [NSString stringWithFormat:@"%d", i];
        view3.textAlignment = NSTextAlignmentCenter;
        view3.layer.masksToBounds = YES;
        view3.layer.cornerRadius = 10;
        [view1 addSubview:view3];
        
        
        CGFloat x = CGRectGetWidth(view1.frame) * 0.5 + CGRectGetWidth(view1.frame) * 0.4 * sin(M_PI_4 * i);
        CGFloat y = CGRectGetWidth(view1.frame) * 0.5 + CGRectGetWidth(view1.frame) * 0.4 * cos(M_PI_4 * i);
        
        
        NSLog(@"sin = %f , cos = %f", sin(45 * i), cos(45 * i));
        
        view3.center = CGPointMake(x, y);
    }
    
}

- (UIColor *)setColor{
    float r = arc4random() % 256 / 255.0;
    float g = arc4random() % 256 / 255.0;
    float b = arc4random() % 256 / 255.0;
    UIColor *color = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    return color;
}

@end
