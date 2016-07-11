//
//  TYTansAmimationsController.m
//  TYAnimations
//
//  Created by tiny on 16/7/11.
//  Copyright © 2016年 tiny. All rights reserved.
//

#import "TYTansAmimationsController.h"
#import "TYTaobaoDetailController.h"
#import "TYCircleSpreadFromController.h"

@interface TYTansAmimationsController ()

@end

@implementation TYTansAmimationsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataArr = @[@"仿淘宝效果",@"小圆点中心扩散"];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        TYTaobaoDetailController *vc = [[TYTaobaoDetailController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 1)
    {
        TYCircleSpreadFromController *fromVc = [[TYCircleSpreadFromController alloc] init];
        [self.navigationController pushViewController:fromVc animated:YES];
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
