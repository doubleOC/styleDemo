//
//  CategoryPageView.h
//  MiaoTong
//
//  Created by mrc on 16/9/6.
//  Copyright © 2016年 com.yibaoli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CateModel : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *icon;


@end

@interface CategoryCell : UIView

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *textLabel;
@property (nonatomic,strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic,assign) NSInteger index;
@property (nonatomic,strong) UILabel *redPot; //小红点
@end

@interface CategoryPageView : UIScrollView

@property (nonatomic,strong) NSArray <CateModel*>*items;
/**
 *  全屏显示的行数(numberOfLines)和列数(numberOfColumn)
 */
@property (nonatomic,assign) NSInteger numberOfLines;
@property (nonatomic,assign) NSInteger numberOfColumn;
@property (nonatomic,assign) CGFloat interSpace; //上下间距
@property (nonatomic,assign) CGFloat lineSpace;  //水平间距
@property (nonatomic,copy) TAP_ACTION action;
@property (nonatomic,strong) NSArray *icons;     //图标
@property (nonatomic,assign) UIEdgeInsets pageInset;
@property (nonatomic,assign) CGFloat edgeX,edgeY;

//@property (nonatomic,assign) BOOL pageEnbled;   //按页翻

@end
