//
//  TYTestController.m
//  TYAnimations
//
//  Created by tiny on 16/7/11.
//  Copyright © 2016年 tiny. All rights reserved.
//

#import "TYTestController.h"
#import "XWInteractiveTransition.h"
#import "UIViewController+XWTransition.h"

@interface TYTestController ()

@property (nonatomic,assign)BOOL type;
@property (nonatomic,strong)UIButton *button;

@end

@implementation TYTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpUI];
    _type = 1;
    NSString *title = _type ? @"点我或向下滑动" : @"点我或向左滑动";
    [self.button setTitle:title forState:UIControlStateNormal];
//    self.button.hidden = YES;
    XWInteractiveTransitionGestureDirection direction = _type ? XWInteractiveTransitionGestureDirectionDown : XWInteractiveTransitionGestureDirectionLeft;
    __weak typeof(self)weakSelf = self;
    [self xw_registerBackInteractiveTransitionWithDirection:direction transitonBlock:^(CGPoint startPoint){
        [weakSelf xw_transiton];
    } edgeSpacing:0];

}

-(void)setUpUI
{
    self.view.backgroundColor = [UIColor grayColor];
//    self.view.layer.contents = (__bridge id)[UIImage imageNamed:@"111.jpg"].CGImage;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button = button;
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    button.titleLabel.textAlignment = 1;
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.center = CGPointMake(self.view.center.x, self.view.center.y + 30);
    button.bounds = CGRectMake(0, 0, 150, 30);
    [button addTarget:self action:@selector(xw_transiton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


- (void)xw_transiton{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
