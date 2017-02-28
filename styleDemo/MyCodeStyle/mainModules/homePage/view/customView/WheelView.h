//
//  WheelView.h
//  MiaoTong
//
//  Created by mrc on 16/9/6.
//  Copyright © 2016年 com.yibaoli. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 自定义轮播视图
 */
@interface WheelView : UIView<UIScrollViewDelegate>

/**
 *  需要滚动的元素数组
 */
@property (nonatomic,strong) NSArray<UIView*>*items;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,copy)  TAP_ACTION action;
//复制问题
@property (nonatomic,strong) UIView *firstItem;
@property (nonatomic,strong) UIView *lastItem;

@end
