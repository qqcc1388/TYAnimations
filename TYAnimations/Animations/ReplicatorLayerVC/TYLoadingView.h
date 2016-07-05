//
//  TYLoadingView.h
//  TYAnimations
//
//  Created by tiny on 16/7/5.
//  Copyright © 2016年 tiny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYLoadingView : UIView

-(void)startLoading;

-(void)stopLoading;

@property (nonatomic,assign)BOOL isAnimation;

@end
