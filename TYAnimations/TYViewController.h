//
//  TYViewController.h
//  TYAnimations
//
//  Created by tiny on 16/7/5.
//  Copyright © 2016年 tiny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *dataArr;

@end
