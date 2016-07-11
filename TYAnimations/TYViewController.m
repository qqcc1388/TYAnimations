//
//  TYViewController.m
//  TYAnimations
//
//  Created by tiny on 16/7/5.
//  Copyright © 2016年 tiny. All rights reserved.
//

#import "TYViewController.h"
#import "TYBaseAnimationVC.h"
#import "TYKeyPathAnimationVC.h"
#import "TYGradientLayerVC.h"
#import "TYReplicatorLayerVC.h"
#import "TYAnimationsController.h"
#import "TYCaLayerViewController.h"

@interface TYViewController ()


@end

@implementation TYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.title = @"各种动画效果实现";
//    self.dataArr = @[@"CABaseAnimation - 基本动画",@"CAKeyframeAnimation - 路径动画",@"CAGradientLayer - 颜色渐变",@"CAReplicatorLayer"];
    self.dataArr = @[@"Animations",@"CALayer"];
    self.tableView.showsVerticalScrollIndicator = NO;
    
}

-(UITableView *)tableView
{
    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


#pragma mark - tableView代理方法和数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        TYAnimationsController *animations = [[TYAnimationsController alloc] init];
        animations.title = @"Animations";
        [self.navigationController pushViewController:animations animated:YES];
    }
    else if(indexPath.row == 1)
    {
        TYCaLayerViewController *layers = [[TYCaLayerViewController alloc] init];
        layers.title = @"CALayer";
        [self.navigationController pushViewController:layers animated:YES];
    }


    
}
@end
