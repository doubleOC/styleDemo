//
//  MTMainTitleView.m
//  MiaoTong
//
//  Created by mrc on 16/9/23.
//  Copyright © 2016年 com.yibaoli. All rights reserved.
//

#import "MTMainTitleView.h"
#import "Masonry.h"
#import "MTRollItemView.h"
@implementation MTMainTitleView

-(id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
      
        [self setUpSubViews];
    }
    return self;

}


-(void)setUpSubViews{

   // UIView *headView = [[UIView alloc] init];
    //headView.backgroundColor = RGB(222, 223, 222);
    
    //轮播图
    //CGRect frame = CGRectMake(0, 0, kScreenWidth, kScreenWidth*0.35);
    WheelView *rollingView = [[WheelView alloc] initWithFrame:CGRectZero];
    _rollView = rollingView;
    _rollView.items = [self createRollingElements];
    
    
//    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    //moreButton.backgroundColor = [UIColor redColor];
//    moreButton.titleLabel.font = [UIFont systemFontOfSize:15];
//    [moreButton setTitleColor:RGB(87, 140, 187) forState:UIControlStateNormal];
//    [moreButton setTitle:@"More >>" forState:UIControlStateNormal];
//    _moreButton = moreButton;
//    rollingView.frame = frame;
//    //rollingView.items = [self creatRollingView];
//    rollingView.action = ^(NSInteger index){[self enterTopicAtIndex:index];};
//    _rollingView = rollingView;
//    //增加更多按钮
//    UIButton *moreButton = self.makeButton(CGRectMake(frame.size.width-70, frame.size.height-30, 70, 30),self,@selector(pushToTopicList:));
//    moreButton.titleLabel.font = [UIFont systemFontOfSize:15];
//    [moreButton setTitleColor:RGB(87, 140, 187) forState:UIControlStateNormal];
//    [moreButton setTitle:@"More >>" forState:UIControlStateNormal];
    //moreButton.backgroundColor = [UIColor redColor];
    
    //分类图
//    frame.origin.y += frame.size.height+1;
//    frame.size.height = kScreenWidth *0.26;
    CategoryPageView *categoryView= [[CategoryPageView alloc] initWithFrame:CGRectZero];
    //categoryView.items = [self categoryItems];
    categoryView.numberOfLines = 2;
    categoryView.numberOfColumn = 3;
    categoryView.lineSpace = 5;
    categoryView.interSpace = 5;
    categoryView.edgeX = 15;
    categoryView.edgeY = 8;
    categoryView.backgroundColor = RGB(255, 255, 255);
    categoryView.clipsToBounds = YES;
    categoryView.items = [self createCategoryElements];
    //categoryView.action = ^(NSInteger index){[self enterCategoryAtIndex:index];};
    _categoryView = categoryView;
//    //发言按钮
//    frame.origin.y += frame.size.height;
//    frame.size.height = kScreenWidth *0.12;
//    UIButton *speakButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    speakButton.backgroundColor = RGB(247, 151, 103);
//    speakButton.titleLabel.font = [UIFont systemFontOfSize:16];
//    speakButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0,6);
//    speakButton.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0);
//    [speakButton setTitle:@"发言" forState:UIControlStateNormal];
    //[speakButton setImage:IMG(@"edit") forState:UIControlStateNormal];
//    _speakButton = speakButton;
//    _speakButton.titleLabel.font = [UIFont systemFontOfSize:kScreenWidth/320.0*15];
    //[_speakButton borderForWidth:0 corner:5 color:nil];
    [self addSubview:_rollView];
//    //[self addSubview:_moreButton];
    [self addSubview:_categoryView];
    //[self addSubview:_speakButton];
    
    [self setUpConstains];
//    headView.frame = CGRectMake(0, 0, kScreenWidth, CGRectGetMaxY(frame));
//    [headView addSubview:rollingView];
//    [headView addSubview:categoryView];
//    [headView addSubview:moreButton];
//    [headView addSubview:speakButton];
//    return headView;



}
-(NSArray *)createRollingElements{
    
    NSMutableArray *elements = [NSMutableArray array];
    for (int i=0; i<5; i++) {
        
        MTRollItemView *itemView = [[MTRollItemView alloc] init];
        [elements addObject:itemView];
    }
    _rollView.firstItem = [[MTRollItemView alloc] init];
    _rollView.lastItem = [[MTRollItemView alloc] init];
//    UIView *firstView = [elements.lastObject mutableCopy];
//    UIView *lastView = [elements.firstObject mutableCopy];
    return elements;
}
-(NSArray *)createCategoryElements{

    NSMutableArray *items = [NSMutableArray array];
    //NSArray *temp =@[@"会议议程",@"用餐安排",@"住宿安排",@"交通指引",@"投票"];
    for (int i=0;i<6;i++) {
        
        CateModel *model = [[CateModel alloc]init];
        model.title = [NSString stringWithFormat:@"分类%d",i];
        model.icon = @"fenlei";
        [items addObject:model];
        
    }
    return items;


}
-(void)setUpConstains{

    //0.48
//    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.left.equalTo(self.mas_left).with.offset(0);
//        make.bottom.equalTo(self.mas_bottom).with.offset(0);
//        make.right.equalTo(self.mas_right).with.offset(0);
//        make.height.equalTo(@20);
//        
//    }];
  
  
  //CGFloat height = self.bounds.size.height-1;
  [_rollView mas_makeConstraints:^(MASConstraintMaker *make) {
      
      make.left.equalTo(self.mas_left).offset(0);
      make.top.equalTo(self.mas_top).offset(0);
      make.right.equalTo(self.mas_right).offset(0);
      make.height.mas_equalTo(kScreenWidth*0.3);
      
  }];
//  [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.right.equalTo(_rollView.mas_right).offset(-3);
//        make.bottom.equalTo(_rollView.mas_bottom).offset(-2);
//        make.width.mas_equalTo(65);
//        make.height.equalTo(_moreButton.mas_width).multipliedBy(0.4);
//  
//        
//  }];
  [_categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
      
      make.left.equalTo(self.mas_left).offset(0);
      make.top.equalTo(_rollView.mas_bottom).offset(1);
      make.right.equalTo(self.mas_right).offset(0);
      make.bottom.equalTo(self.mas_bottom).offset(-1);
      //make.height.mas_equalTo(kScreenWidth*0.35);

      
  }];
//  [_speakButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        //make.left.equalTo(self.mas_left).offset(10);
//        //make.top.equalTo(_categoryView.mas_bottom).offset(0);
//        //make.right.equalTo(self.mas_right).offset(-10);
//        make.bottom.equalTo(self.mas_bottom).offset(-8);
//        make.width.equalTo(self.mas_width).multipliedBy(0.93);
//        make.centerX.equalTo(self.mas_centerX);
//        make.height.mas_equalTo(kScreenWidth*0.14-16);
//        
//        
//    }];


}

-(void)remakeConstains{

//    CGFloat height = self.bounds.size.height-1;
//    //5:0.35:0.1
//    CGFloat rollHeight = height*0.5;
//    CGFloat cateHeight = height*0.35;
//    CGFloat editheight = height*0.15;
//    if (_categoryView.items.count == 0) {
//        
//        rollHeight = height*0.75;
//        cateHeight = 0;
//        editheight = height*0.25;
//    }
//    
//    
//    
//    NSLayoutConstraint *rc = self.rollView.constraints.firstObject;
//    NSLayoutConstraint *cc = self.categoryView.constraints.firstObject;
//    NSLayoutConstraint *ec = self.speakButton.constraints.firstObject;
//    
//    rc.constant = rollHeight;
//    cc.constant = cateHeight;
//    ec.constant = editheight;


}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
