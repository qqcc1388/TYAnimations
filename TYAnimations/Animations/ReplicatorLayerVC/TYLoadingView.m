//
//  TYLoadingView.m
//  TYAnimations
//
//  Created by tiny on 16/7/5.
//  Copyright © 2016年 tiny. All rights reserved.
//

#import "TYLoadingView.h"

@interface TYLoadingView ()

@property (nonatomic,strong)CAReplicatorLayer *replicator;
@end

@implementation TYLoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
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
//    [self setUpSubviews];
}

-(CAReplicatorLayer *)replicator
{
    if (_replicator == nil) {
        [self setUpSubviews];
    }
    return _replicator;
}

-(void)setUpSubviews
{
    CAReplicatorLayer *replicator = [[CAReplicatorLayer alloc] init];
    replicator.bounds = self.bounds;
    replicator.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    [self.layer addSublayer:replicator];
    
    //设置子layer
    CALayer *circle = [CALayer layer];
    circle.bounds = CGRectMake(0, 0, 15, 15);
    circle.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2 - 55);
    circle.cornerRadius = 7.5;
    circle.backgroundColor = [UIColor redColor].CGColor;
    [replicator addSublayer:circle];
    
    replicator.instanceCount = 15;
    replicator.instanceTransform = CATransform3DMakeRotation(M_PI*2/15, 0, 0, 1);
    replicator.instanceDelay = 1.0/15;
    
    //设置圆点缩放动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 1.0f;
    animation.repeatCount = HUGE;
    animation.fromValue = @1.0;
    animation.toValue = @0.1;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    circle.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
    [circle addAnimation:animation forKey:@"scaleAnimation"];
    self.isAnimation = YES;
    
    _replicator = replicator;
}

-(void)startLoading
{
    [self.layer addSublayer:self.replicator];
    self.isAnimation = YES;
}

-(void)stopLoading
{
    [self.replicator removeFromSuperlayer];
    self.isAnimation = NO;
}


@end
