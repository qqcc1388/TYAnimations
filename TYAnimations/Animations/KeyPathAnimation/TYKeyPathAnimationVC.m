//
//  TYKeyPathAnimationVC.m
//  TYAnimations
//
//  Created by tiny on 16/7/5.
//  Copyright © 2016年 tiny. All rights reserved.
//  关键帧动画

#import "TYKeyPathAnimationVC.h"
#import "DrawView.h"

@interface TYKeyPathAnimationVC ()

@property (nonatomic,strong)DrawView *drawView;
@end

@implementation TYKeyPathAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    DrawView *drawView = [[DrawView alloc] initWithFrame:self.view.bounds];
    drawView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:drawView];
    _drawView = drawView;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存图片" style:UIBarButtonItemStyleDone target:self action:@selector(saveImage)];
    
}


-(void)saveImage
{
    [self.drawView screenshots];
}
@end
