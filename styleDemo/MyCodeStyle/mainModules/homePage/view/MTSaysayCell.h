//
//  MTSaysayCell.h
//  MiaoTong
//
//  Created by mrc on 16/9/7.
//  Copyright © 2016年 com.yibaoli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryCollectionCell.h"
#import "AMSegmentView.h"
#import "ESSaySayModdel.h"
//#import "ESActionModel.h"
//typedef void(^BOTTOM_ACTION)(NSInteger index, id obj);

@interface MTSaysayCell : UITableViewCell<DynamicHeightDelegate>

@property (nonatomic,copy) SaySayInfo *data;
//@property (nonatomic,strong) ThumbData *thumbData;  //点赞数据
@property (weak, nonatomic) IBOutlet CategoryCollectionView *collectionView;

@property (weak, nonatomic) IBOutlet AMSegmentView *segmentView;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UILabel *transmitLabel;

@property (weak, nonatomic) IBOutlet UIView *containerVIew;

@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lefeEdge;

@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

//@property (nonatomic,strong) NSArray *bottomItems;
//@property (nonatomic,assign) BOOL showIconmage;  //YES
@property (nonatomic,strong) id target;

//是否隐藏点赞视图评论视图
//@property (nonatomic,assign) BOOL hideBottomView;
@property (nonatomic,assign) BOOL hideButtonView;
@property (nonatomic,assign) BOOL isTransmit; //该说说是否是转发的
//@property (nonatomic,assign) BOOL isShowImage; //是否显示图片 测试用
@property (nonatomic,assign) BOOL isAllText;
-(void)setUpSegmentView;

-(void)recoverDefaultState;
//！！！！
//+(CGFloat)cacuteHeightWithCommentData:(CommentData *)data;
@end
