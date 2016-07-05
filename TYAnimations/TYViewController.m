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

@interface TYViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *dataArr;


@end

@implementation TYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.title = @"各种动画Demo";
    self.dataArr = @[@"CABaseAnimation - 基本动画",@"CAKeyframeAnimation - 路径动画",@"CAGradientLayer - 颜色渐变",@"CAReplicatorLayer"];
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
        TYGradientLayerVC *vc = [[TYGradientLayerVC alloc] init];
        vc.title = @"颜色渐变";
        [self.navigationController pushViewController:vc animated:YES];

    }
    else if (indexPath.row == 3)
    {
        TYReplicatorLayerVC *vc = [[TYReplicatorLayerVC alloc] init];
        vc.title = @"Loading动画";
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}
@end
