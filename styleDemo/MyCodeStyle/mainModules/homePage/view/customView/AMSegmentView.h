//
//  AMSegmentView.h
//  MiaoTong
//
//  Created by mrc on 16/7/12.
//  Copyright © 2016年 com.yibaoli. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SEG_ACTION)(NSInteger );

@interface AMSegmentView : UIView

@property (nonatomic,strong) NSArray *items; //元素个数
@property (nonatomic,assign) NSInteger selectedIndex;  //当前选中index
@property (nonatomic,strong) UIColor *normalTextColor; //文本颜色
@property (nonatomic,strong) UIColor *selectedTextColor;
@property (nonatomic,assign) BOOL showIndicateView;   //是否显示指示条
@property (nonatomic,assign) UIEdgeInsets buttonInset; // 按钮偏移
@property (nonatomic,assign) CGFloat horizontalSpace;
@property (nonatomic,assign) CGFloat indicateHieght;
@property (nonatomic,strong) UIColor *indicateColor;
@property (nonatomic,strong) UIImage *backgroundImage; //背景图片
@property (nonatomic,copy)   SEG_ACTION clickedIndex;
@property (nonatomic,strong) UIView *incateView; //指示条
@property (nonatomic,strong,readonly) NSArray *buttons;
//画笔颜色
@property (nonatomic,strong) UIColor *strokeColor;
@property (nonatomic,assign) BOOL isRepeatClicked;
@property (nonatomic,assign) BOOL hidenInnnerLine;
//绘制button边框
-(void)drawBorder:(CGFloat)width color:(UIColor *)color radius:(CGFloat)radius;
@end
