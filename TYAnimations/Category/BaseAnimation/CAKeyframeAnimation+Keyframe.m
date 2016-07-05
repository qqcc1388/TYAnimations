//
//  CAKeyframeAnimation+Keyframe.m
//  TYAnimations
//
//  Created by tiny on 16/7/5.
//  Copyright © 2016年 tiny. All rights reserved.
//

#import "CAKeyframeAnimation+Keyframe.h"

@implementation CAKeyframeAnimation (Keyframe)

+(CAKeyframeAnimation *)moveAlongToPath:(CGMutablePathRef)path Duration:(NSTimeInterval)duration RepeatTimes:(NSInteger)time
{
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframeAnimation.path = path;
    keyframeAnimation.removedOnCompletion = NO;
    keyframeAnimation.fillMode =  kCAFillModeForwards;
    keyframeAnimation.duration = duration;
    keyframeAnimation.repeatCount = time;
    keyframeAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    return keyframeAnimation;
}

@end
