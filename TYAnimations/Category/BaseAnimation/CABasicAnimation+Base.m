//
//  CABasicAnimation+Base.m
//  TYAnimations
//
//  Created by tiny on 16/7/5.
//  Copyright © 2016年 tiny. All rights reserved.
//

#import "CABasicAnimation+Base.h"

@implementation CABasicAnimation (Base)


+(CABasicAnimation *)moveToX:(CGFloat)x Duration:(NSTimeInterval)duration{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.toValue = @(x);
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    animation.fillMode =  kCAFillModeForwards;
    return animation;
}

+(CABasicAnimation *)moveToY:(CGFloat)y Duration:(NSTimeInterval)duration
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    animation.toValue = @(y);
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    animation.fillMode =  kCAFillModeForwards;
    return animation;
}


+(CABasicAnimation *)moveToPoint:(CGPoint)point Duration:(NSTimeInterval)duration
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.toValue = [NSValue valueWithCGPoint:point];
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    animation.fillMode =  kCAFillModeForwards;
    return animation;
}


+(CABasicAnimation *)opacityFromValue:(CGFloat)from ToValue:(CGFloat)to Duration:(NSTimeInterval)duration
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = @(from);
    animation.toValue = @(to);
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    return animation;
}


+(CABasicAnimation *)rotationWithAngle:(CGFloat)from ToValue:(CGFloat)to Duration:(NSTimeInterval)duration
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.fromValue = @(from);
    animation.toValue = @(to);
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    return animation;
}


+(CABasicAnimation *)rotation_3DWithAngle:(CGFloat)degree Duration:(NSTimeInterval)duration
{
    CATransform3D rotationTransform = CATransform3DMakeRotation(degree, 0,1.0,0);
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:rotationTransform];
    animation.duration = duration;
    animation.cumulative = YES;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
}

+(CABasicAnimation *)scale:(CGFloat)from ToValue:(CGFloat)to Duration:(NSTimeInterval)duration
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = @(from);
    animation.toValue = @(to);
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    return animation;
}
@end
