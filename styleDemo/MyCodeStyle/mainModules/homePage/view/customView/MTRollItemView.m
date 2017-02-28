//
//  MTRollItemView.m
//  MyCodeStyle
//
//  Created by mrc on 2017/2/24.
//  Copyright © 2017年 mrc. All rights reserved.
//

#import "MTRollItemView.h"
#import "Masonry.h"
@implementation MTRollItemView

-(id)init{
    self = [super init];
    if (self) {
        _imageView = [[UIImageView alloc] initWithImage:IMG(@"display")];
        _imageView.clipsToBounds = YES;
        _imageView.layer.cornerRadius = 5.0f;
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:19];
        _titleLabel.numberOfLines = 2;
        _titleLabel.text = @"主题名称显示区域";
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.numberOfLines = 2;
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.text = @"此地山清水秀，人生不来次一游，实在是人生一大损失，期待你的光临";
        
        [self addSubview:_imageView];
        [self addSubview:_titleLabel];
        [self addSubview:_contentLabel];
        [self addConstraintForSubviews];
    }
    return self;
}
-(void)addConstraintForSubviews{
    
   // _imageView.backgroundColor = [UIColor redColor];
//    _titleLabel.backgroundColor = [UIColor greenColor];
//    _contentLabel.backgroundColor = [UIColor orangeColor];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(15);
        make.left.mas_equalTo(8);
        make.bottom.mas_equalTo(-20);
        make.width.mas_equalTo(_imageView.mas_height);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_imageView.mas_top).offset(-10);
        make.left.mas_equalTo(_imageView.mas_right).offset(5);
        make.bottom.mas_equalTo(_contentLabel.mas_top).offset(-5);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(_contentLabel.mas_height);
    }];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.left.mas_equalTo(_imageView.mas_right).offset(5);
        make.bottom.mas_equalTo(_imageView.mas_bottom);
        make.right.mas_equalTo(-10);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
