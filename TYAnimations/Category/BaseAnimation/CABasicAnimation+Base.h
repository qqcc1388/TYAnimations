//
//  CABasicAnimation+Base.h
//  TYAnimations
//
//  Created by tiny on 16/7/5.
//  Copyright © 2016年 tiny. All rights reserved.
//  基础动画

#import <QuartzCore/QuartzCore.h>

@interface CABasicAnimation (Base)

/**
 *  水平方法平移
 *
 *  @param x        平移到水平方向某个值
 *  @param duration 时长
 *
 *  @return animation对象
 */
+(CABasicAnimation *)moveToX:(CGFloat)x Duration:(NSTimeInterval)duration;

/**
 *  垂直方向平移
 *
 *  @param y        平移到垂直方向某个值
 *  @param duration 时长
 *
 *  @return animation对象
 */

+(CABasicAnimation *)moveToY:(CGFloat)y Duration:(NSTimeInterval)duration;

/**
 *  移动到指定位置
 *
 *  @param point    指定位置
 *  @param duration 时长
 *
 *  @return animation对象
 */
+(CABasicAnimation *)moveToPoint:(CGPoint)point Duration:(NSTimeInterval)duration;

/**
 *  透明度动画
 *
 *  @param from     开始值
 *  @param to       结束值
 *  @param duration 持续时间
 *
 *  @return animation动画
 */
+(CABasicAnimation *)opacityFromValue:(CGFloat)from ToValue:(CGFloat)to Duration:(NSTimeInterval)duration;


/**
 *  平面旋转
 *
 *  @param from     开始角度
 *  @param to       结束角度
 *  @param duration 时长
 *
 *  @return   animaton动画
 */
+(CABasicAnimation *)rotationWithAngle:(CGFloat)from ToValue:(CGFloat)to Duration:(NSTimeInterval)duration;


/**
 *  3D旋转
 *
 *  @param degree   角度
 *  @param duration 时长
 *
 *  @return animation动画
 */
+(CABasicAnimation *)rotation_3DWithAngle:(CGFloat)degree  Duration:(NSTimeInterval)duration;


/**
 *  缩放
 *
 *  @param from     开始缩放比例
 *  @param to       缩放到当前比例
 *  @param duration 时长
 *
 *  @return animation动画
 */
+(CABasicAnimation *)scale:(CGFloat)from ToValue:(CGFloat)to Duration:(NSTimeInterval)duration;


@end
