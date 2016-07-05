//
//  DrawView.m
//  TYAnimations
//
//  Created by tiny on 16/7/5.
//  Copyright © 2016年 tiny. All rights reserved.
//

#import "DrawView.h"

@interface DrawView ()

@property (nonatomic,strong)UIBezierPath *bezierPath;
@property (nonatomic,strong)UIView *redDot;

@end

@implementation DrawView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self initialize];
    }
    return self;
}

-(void)awakeFromNib
{
    [self initialize];
}


-(void)initialize
{
    self.bezierPath = [UIBezierPath bezierPath];
    _bezierPath.lineWidth = 3.0f;
    
    self.redDot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    [self addSubview:self.redDot];
    self.redDot.backgroundColor = [UIColor redColor];
    self.redDot.center = self.center;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //开始划线
    //1.拿到当前划线的起始点
    UITouch *touch = touches.anyObject;
    CGPoint startPoint = [touch locationInView:self];
    
    [_bezierPath moveToPoint:startPoint];
    [self setNeedsDisplay];
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    [_bezierPath addLineToPoint:point];
    [self setNeedsDisplay];
}


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    [_bezierPath addLineToPoint:point];
    [self setNeedsDisplay];
    
    //绘制完路径之后让视图沿着路径运行
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = self.bezierPath.CGPath;
    animation.duration = 5.0f;
    animation.repeatCount = HUGE;
    animation.autoreverses = YES;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.redDot.layer addAnimation:animation forKey:@"keyframeAnimation"];
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self.bezierPath stroke];
}


#pragma mark - 截屏
-(void)screenshots
{
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image= UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    NSLog(@"image:%@",image);
    UIImageView *imaView = [[UIImageView alloc] initWithImage:image];
    imaView.frame = CGRectMake(0, 700, 500, 500);
    [self addSubview:imaView];
    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
}
@end
