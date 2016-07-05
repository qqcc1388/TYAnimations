//
//  TYReplicatorLayerVC.m
//  TYAnimations
//
//  Created by tiny on 16/7/5.
//  Copyright © 2016年 tiny. All rights reserved.
//

#import "TYReplicatorLayerVC.h"
#import "TYLoadingView.h"

@interface TYReplicatorLayerVC ()

@property (nonatomic,strong)TYLoadingView *loadingView;

@end

@implementation TYReplicatorLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"开始loading" style:UIBarButtonItemStyleDone target:self action:@selector(loadingControl)];
    
    
    
    
    TYLoadingView * view = [[TYLoadingView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.center = CGPointMake(self.view.center.x, self.view.center.y);
    self.loadingView = view;
    [self.view addSubview:view];
}

-(void)loadingControl
{
    if (self.loadingView.isAnimation) {
        
        [self.loadingView stopLoading];
    }
    else
    {
        [self.loadingView startLoading];
    }
    
    NSString *name = self.loadingView.isAnimation?@"关闭loading":@"开始loading";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:name style:UIBarButtonItemStyleDone target:self action:@selector(loadingControl)];
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
