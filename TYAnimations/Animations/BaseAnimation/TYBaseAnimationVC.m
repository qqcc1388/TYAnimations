//
//  TYBaseAnimationVC.m
//  TYAnimations
//
//  Created by tiny on 16/7/5.
//  Copyright © 2016年 tiny. All rights reserved.
//

#import "TYBaseAnimationVC.h"
#import "CABasicAnimation+Base.h"

@interface TYBaseAnimationVC ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@end

@implementation TYBaseAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)TransAction {
    
    //平移动画
    CABasicAnimation *ani = [CABasicAnimation moveToX:100 Duration:1.0f];
    ani.repeatCount  = CGFLOAT_MAX;
    ani.autoreverses = YES;   //是否反向动画
    [self.imgView.layer addAnimation:ani forKey:@"translationXAnimation"];
    
}

- (IBAction)RolatAction {
    //旋转动画
    CABasicAnimation *ani = [CABasicAnimation rotationWithAngle:0 ToValue:M_PI*2 Duration:1.0f];
    ani.repeatCount  = CGFLOAT_MAX;
    ani.autoreverses = NO;   //是否反向动画
    [self.imgView.layer addAnimation:ani forKey:@"rotationAnimation"];
}


- (IBAction)Rolat3DAction {
    //3D旋转动画
    CABasicAnimation *ani = [CABasicAnimation rotation_3DWithAngle:M_PI Duration:1.0f];
    ani.repeatCount  = CGFLOAT_MAX;
    ani.autoreverses = NO;   //是否反向动画
    [self.imgView.layer addAnimation:ani forKey:@"rotation3DAnimation"];
}

- (IBAction)OpacityAction {
    CABasicAnimation *ani = [CABasicAnimation opacityFromValue:1.0f ToValue:0.5f Duration:1.0f];
    ani.repeatCount  = CGFLOAT_MAX;
    ani.autoreverses = YES;   //是否反向动画
    [self.imgView.layer addAnimation:ani forKey:@"rotation3DAnimation"];
}

- (IBAction)ScaleAction {
    //缩放动画
    CABasicAnimation *ani = [CABasicAnimation scale:1.0 ToValue:0.3 Duration:1.0f];
    ani.repeatCount  = CGFLOAT_MAX;
    ani.autoreverses = YES;   //是否反向动画
    [self.imgView.layer addAnimation:ani forKey:@"scaleAnimation"];
}


- (IBAction)GroupAction {
    
    //添加多组动画
    CABasicAnimation *animation1 = [CABasicAnimation moveToPoint:CGPointMake(10, 10) Duration:1.0f];
    CABasicAnimation *animation2 = [CABasicAnimation moveToPoint:CGPointMake(200, 200) Duration:1.0f];
    CABasicAnimation *animation3 = [CABasicAnimation opacityFromValue:0.3 ToValue:1.0 Duration:1.0f];
    CABasicAnimation *animation4 = [CABasicAnimation scale:1.0 ToValue:0.8f Duration:1.0f];
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[animation1,animation2,animation3,animation4];
    animationGroup.duration = 4.0f;
    [self.imgView.layer addAnimation:animationGroup forKey:@"groupAnimation"];
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.imgView.layer removeAllAnimations];
}
@end
