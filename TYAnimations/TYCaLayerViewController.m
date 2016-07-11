//
//  TYCaLayerViewController.m
//  TYAnimations
//
//  Created by tiny on 16/7/11.
//  Copyright © 2016年 tiny. All rights reserved.
//

#import "TYCaLayerViewController.h"
#import "TYGradientLayerVC.h"
#import "TYReplicatorLayerVC.h"

@interface TYCaLayerViewController ()

@end

@implementation TYCaLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArr = @[@"CAGradientLayer - 颜色渐变",@"CAReplicatorLayer"];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        TYGradientLayerVC *vc = [[TYGradientLayerVC alloc] init];
        vc.title = @"颜色渐变";
        [self.navigationController pushViewController:vc animated:YES];

    }
    else if (indexPath.row == 1)
    {
        TYReplicatorLayerVC *vc = [[TYReplicatorLayerVC alloc] init];
        vc.title = @"Loading动画";
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
