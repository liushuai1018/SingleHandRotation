//
//  LS_Rotation_View.m
//  单指转盘
//
//  Created by 铂隆资产1号 on 16/5/17.
//  Copyright © 2016年 铂隆资产. All rights reserved.
//

#import "LS_Rotation_View.h"

@interface LS_Rotation_View ()

@property (strong, nonatomic) UIBezierPath *path;

@end

@implementation LS_Rotation_View

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path addArcWithCenter:CGPointMake(CGRectGetWidth(self.frame) * 0.5, CGRectGetWidth(self.frame) * 0.5)
                    radius:CGRectGetWidth(self.frame) * 0.5
                startAngle:0.0
                  endAngle:M_PI * 2.0
                 clockwise:YES];
    [path stroke];
    
    _path = path;
}

// 设置可点击范围
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL res = [super pointInside:point withEvent:event];
    
    if (res) {
        
        if ([_path containsPoint:point]) {
            return YES;
        }
        return NO;
    }
    return NO;
}

// 设置单手拖拽
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    NSInteger touchNumber = [[event allTouches] count];
    if (touchNumber > 1) { // 判断是否是一个手指
        return;
    }
    
    // 获取中心点
    CGPoint center = CGPointMake(CGRectGetMidX([self bounds]), CGRectGetMidY([self bounds]));
    // 获取上一个坐标
    CGPoint previousPoint = [[touches anyObject] previousLocationInView:self];
    // 获取当前坐标
    CGPoint currentPoint = [[touches anyObject] locationInView:self];
    
    /**
     *  获取每次手指移动变化的角度
     *  atan2f 是求反正切函数 参考:http://blog.csdn.net/chinabinlang/article/details/6802686
     */
    CGFloat angle_new = atan2f(currentPoint.y - center.y, currentPoint.x - center.x);
    CGFloat angle_old = atan2f(previousPoint.y - center.y, previousPoint.x - center.x);
    CGFloat angle = angle_new - angle_old;
    
    // 旋转视图
    self.transform = CGAffineTransformRotate(self.transform, angle);
    
    NSArray *array = [touch.view subviews];
    
    // 让其之类都反向旋转
    for (UIView *subView in array) {
        subView.transform = CGAffineTransformRotate(subView.transform, -angle);
    }

}

@end
