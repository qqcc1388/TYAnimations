//
//  TYCircleSpreadFromController.m
//  TYAnimations
//
//  Created by tiny on 16/7/11.
//  Copyright © 2016年 tiny. All rights reserved.
//

#import "TYCircleSpreadFromController.h"
#import "TYCircleSpreadToController.h"
#import "XWCircleSpreadAnimator.h"
#import "UIViewController+XWTransition.h"

@interface TYCircleSpreadFromController ()
@property (nonatomic,strong)UIButton *button;

@end

@implementation TYCircleSpreadFromController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpUI];
}

- (void)xw_transition{
    XWCircleSpreadAnimator *animator = [XWCircleSpreadAnimator xw_animatorWithStartCenter:self.button.center radius:20];
    animator.toDuration = 0.5f;
    animator.backDuration = 0.5f;
    TYCircleSpreadToController *toVC = [TYCircleSpreadToController new];
//    if (self.pushOrPresntSwitch.on) {
//        [self.navigationController xw_pushViewController:toVC withAnimator:animator];
//    }else{
        [self xw_presentViewController:toVC withAnimator:animator];
//    }
}


-(void)setUpUI
{
    self.button = [[UIButton alloc] init];
    self.button.backgroundColor = [UIColor redColor];
    [self.button addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(xw_drag:)]];
    [self.button addTarget:self action:@selector(xw_transition) forControlEvents:UIControlEventTouchUpInside];
    [self.button setTitle:@"点我\n拖我" forState:UIControlStateNormal];
    self.button.titleLabel.numberOfLines = 0;
    self.button.titleLabel.font = [UIFont systemFontOfSize:12];
    self.button.bounds = CGRectMake(0, 0, 40, 40);
    self.button.center = CGPointMake(self.view.center.x, self.view.center.y - 100);
    self.button.layer.cornerRadius = 20;
    [self.view addSubview:self.button];
}

- (void)xw_drag:(UIPanGestureRecognizer *)panGesture{
    CGPoint transitionP = [panGesture translationInView:panGesture.view];
    CGFloat transitionX = fmax(20, fmin(self.button.center.x + transitionP.x, self.view.bounds.size.width - 20));
    CGFloat transitionY = fmax(64 + 20, fmin(self.button.center.y + transitionP.y, self.view.bounds.size.height - 20));
    self.button.center = CGPointMake(transitionX, transitionY);
    [panGesture setTranslation:CGPointZero inView:panGesture.view];
}


@end
