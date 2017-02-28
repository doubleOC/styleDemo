//
//  MTMainTitleView.h
//  MiaoTong
//
//  Created by mrc on 16/9/23.
//  Copyright © 2016年 com.yibaoli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryPageView.h"
#import "WheelView.h"

#define KR_HEIGHT ()

@interface MTMainTitleView : UIView

@property (nonatomic,strong) CategoryPageView *categoryView;
@property (nonatomic,strong) WheelView *rollView;
@property (nonatomic,strong) UIButton *speakButton;
@property (nonatomic,strong) UIButton *moreButton;

-(void)remakeConstains;

@end
