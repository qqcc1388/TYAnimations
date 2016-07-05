//
//  CAKeyframeAnimation+Keyframe.h
//  TYAnimations
//
//  Created by tiny on 16/7/5.
//  Copyright © 2016年 tiny. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAKeyframeAnimation (Keyframe)

+(CAKeyframeAnimation *)moveAlongToPath:(CGMutablePathRef)path Duration:(NSTimeInterval)duration RepeatTimes:(NSInteger)time;

@end
