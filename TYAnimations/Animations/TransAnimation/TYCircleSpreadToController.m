//
//  TYCircleSpreadToController.m
//  TYAnimations
//
//  Created by tiny on 16/7/11.
//  Copyright © 2016年 tiny. All rights reserved.
//

#import "TYCircleSpreadToController.h"
#import "UIViewController+XWTransition.h"
#import "XWInteractiveTransition.h"

@interface TYCircleSpreadToController ()

@property (nonatomic,strong)UIButton *button;
@end

@implementation TYCircleSpreadToController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    [self setUpUI];
    [self.button setTitle:@"点我或向下滑动" forState:UIControlStateNormal];
    __weak typeof(self)weakSelf = self;
    [self xw_registerBackInteractiveTransitionWithDirection:XWInteractiveTransitionGestureDirectionDown transitonBlock:^(CGPoint startPoint){
        [weakSelf xw_transiton];
    } edgeSpacing:0];
}

-(void)setUpUI
{
    self.button = [[UIButton alloc] init];
    self.button.backgroundColor = [UIColor redColor];
//    [self.button addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(xw_drag:)]];
    [self.button addTarget:self action:@selector(xw_transiton) forControlEvents:UIControlEventTouchUpInside];
    [self.button setTitle:@"点我\n拖我" forState:UIControlStateNormal];
    self.button.titleLabel.numberOfLines = 0;
    self.button.titleLabel.font = [UIFont systemFontOfSize:12];
    self.button.bounds = CGRectMake(0, 0, 40, 40);
    self.button.center = CGPointMake(self.view.center.x, self.view.center.y - 100);
    self.button.layer.cornerRadius = 20;
    [self.view addSubview:self.button];
}

- (void)xw_transiton{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
