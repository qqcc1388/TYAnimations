//
//  TYTaobaoDetailController.m
//  TYAnimations
//
//  Created by tiny on 16/7/11.
//  Copyright © 2016年 tiny. All rights reserved.
//

#import "TYTaobaoDetailController.h"
#import "XWInteractiveTransition.h"
#import "UIViewController+XWTransition.h"
#import "XWDrawerAnimator.h"
#import "TYTestController.h"


@interface TYTaobaoDetailController ()

@property (nonatomic,strong)UIButton *button;
@property (nonatomic,assign)BOOL type;

@end

@implementation TYTaobaoDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpUI];
    _type = 1;
    [self.button setTitle:@"点我向上滑" forState:UIControlStateNormal];
        __weak typeof(self)weakSelf = self;
    XWInteractiveTransitionGestureDirection direction = _type ? XWInteractiveTransitionGestureDirectionUp : XWInteractiveTransitionGestureDirectionRight;
    [self xw_registerToInteractiveTransitionWithDirection:direction transitonBlock:^(CGPoint startPoint){
        [weakSelf xw_transition];
    } edgeSpacing:_type ? 0 : 80];
    
}

-(void)setUpUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.layer.contents = (__bridge id)[UIImage imageNamed:@"timg.jpeg"].CGImage;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button = button;
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    button.titleLabel.textAlignment = 1;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.center = CGPointMake(self.view.center.x, self.view.center.y + 30);
    button.bounds = CGRectMake(0, 0, 150, 30);
    [button addTarget:self action:@selector(xw_transition) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

- (void)_xw_back{
    if (self.presentedViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}


- (void)xw_transition{
    XWDrawerAnimatorDirection direction = _type ? XWDrawerAnimatorDirectionBottom : XWDrawerAnimatorDirectionLeft;
    CGFloat distance = _type ? 450 : 250;
    XWDrawerAnimator *animator = [XWDrawerAnimator xw_animatorWithDirection:direction moveDistance:distance];
    animator.toDuration = 0.5;
    animator.backDuration = 0.5;
    if (_type) {
        animator.flipEnable = YES;
    }else{
        animator.parallaxEnable = YES;
    }
    TYTestController *toVC = [TYTestController new];
//    toVC.type = _type;
//    if (self.pushOrPresntSwitch.on) {
//        [self.navigationController xw_pushViewController:toVC withAnimator:animator];
//    }else{
        [self xw_presentViewController:toVC withAnimator:animator];
//    }
    __weak typeof(self)weakSelf = self;
    [animator xw_enableEdgeGestureAndBackTapWithConfig:^{
        [weakSelf _xw_back];
    }];
}


@end
