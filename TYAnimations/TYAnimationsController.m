//
//  TYAnimationsController.m
//  TYAnimations
//
//  Created by tiny on 16/7/11.
//  Copyright © 2016年 tiny. All rights reserved.
//

#import "TYAnimationsController.h"
#import "TYBaseAnimationVC.h"
#import "TYKeyPathAnimationVC.h"
#import "TYTansAmimationsController.h"

@interface TYAnimationsController ()

@end

@implementation TYAnimationsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArr = @[@"CABaseAnimation - 基本动画",@"CAKeyframeAnimation - 路径动画",@"CATransAnimation"];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        TYBaseAnimationVC *vc = [[TYBaseAnimationVC alloc] init];
        vc.title = @"基础动画";
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 1)
    {
        TYKeyPathAnimationVC *vc = [[TYKeyPathAnimationVC alloc] init];
        vc.title = @"路径动画";
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 2)
    {
        TYTansAmimationsController *vc = [[TYTansAmimationsController alloc] init];
        vc.title = @"";
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
