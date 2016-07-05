//
//  TYGradientLayerVC.m
//  TYAnimations
//
//  Created by tiny on 16/7/5.
//  Copyright © 2016年 tiny. All rights reserved.
//

#import "TYGradientLayerVC.h"

@interface TYGradientLayerVC ()

@end

@implementation TYGradientLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"timg.jpeg"];
    [self.view addSubview:imageView];
    
    //给背景图添加渐变效果
    CAGradientLayer *gradient = [[CAGradientLayer alloc] init];
    gradient.frame = imageView.bounds;
    [imageView.layer addSublayer:gradient];
    
    //设置渐变颜色方向
    /**
     *渐变的起点和终点时吸入到层的
      *坐标空间。开始点对应于第一梯度
      *站，终点到最后的渐变。这两个点是
      *在一个单元中定义的坐标空间，然后将其映射到
      *当绘制图层的边界矩形。 （即，[0,0]是左下
      *层的角落，[1,1]是右上角。）默认值
      *是[.5,0]和[.5,1]分别。两者都是动画。
     
     | 0,1   1,1|
     |          |
     |          |
     | 0,0   1,0|
     */
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(0, 1);
    UIColor *color = [UIColor redColor];
    //设置渐变颜色组
    gradient.colors = @[(__bridge id)[UIColor clearColor].CGColor,(__bridge id)[UIColor clearColor].CGColor,(__bridge id)color.CGColor];
    
    //设置分割点
    gradient.locations = @[@(0.25),@(0.70),@(0.75)];
    
}


@end
