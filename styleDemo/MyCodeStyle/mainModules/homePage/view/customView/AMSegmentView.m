//
//  AMSegmentView.m
//  MiaoTong
//
//  Created by mrc on 16/7/12.
//  Copyright © 2016年 com.yibaoli. All rights reserved.
//

#import "AMSegmentView.h"

@interface AMSegmentView (){
    
    UIButton *selectedButton;
    //UIButton *normalButton;
    //UIView *_customView;
    
}

@property (nonatomic,strong) NSMutableArray *buttonArray;


@end

@implementation AMSegmentView

-(void)setItems:(NSArray *)items{
    
    _items = items;
    //创建button
    if (!_buttonArray) {
        
        _buttonArray = [NSMutableArray arrayWithCapacity:items.count];
    }
    [_buttonArray removeAllObjects];
    
    for (int i=0; i<items.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor clearColor];
        [button setTitle:items[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont fontWithName:@"Avenir-Book" size:16];
        [self addSubview:button];
        [_buttonArray addObject:button];
        
    }
    
    //增加指示条
    [self insertSubview:self.incateView atIndex:0];
    
}

-(void)layoutSubviews{
  
    [super layoutSubviews];
    [self relayoutSubViews];

}

//视图重新布局
-(void)relayoutSubViews{
    
    CGFloat buttonWidth = (self.bounds.size.width - _horizontalSpace *2)/_items.count;
    CGFloat butonHeight = self.bounds.size.height;
    if (self.showIndicateView) {
        
        
        
        if (_incateView.transform.tx == CGAffineTransformIdentity.tx) {
            
            
            _incateView.frame = CGRectMake(_horizontalSpace, butonHeight-_indicateHieght, buttonWidth, _indicateHieght);
            _incateView.transform = CGAffineTransformMakeTranslation(_selectedIndex*_incateView.bounds.size.width, 0);
        }
        
        
}
    
    CGRect buttonFrame = CGRectMake(_horizontalSpace, 0, buttonWidth, butonHeight);
    for (int i=0; i<_buttonArray.count; i++) {
        
        UIButton *button = _buttonArray[i];
        button.frame = buttonFrame;
        if (!UIEdgeInsetsEqualToEdgeInsets(_buttonInset, UIEdgeInsetsZero)) {
            
            //缩进按钮
            CGRect edgeFrame = button.frame;
            edgeFrame.origin.x += _buttonInset.left;
            edgeFrame.origin.y += _buttonInset.top;
            edgeFrame.size.width -= (_buttonInset.left+_buttonInset.right);
            edgeFrame.size.height -=(_buttonInset.top+_buttonInset.bottom);
            //间距相等，间隙重合
            button.frame = edgeFrame;
            
        }
        
        buttonFrame.origin.x += buttonWidth;
       // self.selectedIndex = self.selectedIndex;
       if (self.selectedIndex == i) {
            
            [button setTitleColor:self.selectedTextColor forState:UIControlStateNormal];
            selectedButton = button;
            [button setBackgroundImage:_backgroundImage forState:UIControlStateNormal];
            selectedButton.layer.borderColor = self.selectedTextColor.CGColor;
            
        }else{
            
            [button setTitleColor:self.normalTextColor forState:UIControlStateNormal];
            [button setBackgroundImage:nil forState:UIControlStateNormal];
            button.layer.borderColor = [UIColor clearColor].CGColor;
            
        }
        
    }
    
}

-(void)drawBorder:(CGFloat)width color:(UIColor *)color radius:(CGFloat)radius{

      for (UIButton *button in _buttonArray) {
        
        button.clipsToBounds = YES;
        button.layer.borderWidth = width;
        
          if ([button isEqual:selectedButton] ) {
              
              button.layer.borderColor = self.selectedTextColor.CGColor;
              
          }else{
          
              button.layer.borderColor = [UIColor clearColor].CGColor;
          }
        
        button.layer.cornerRadius = radius;
    }

}

-(void)buttonClicked:(UIButton *)sender{

    NSInteger buttonIndex = [_buttonArray indexOfObject:sender];
    
    if ([selectedButton isEqual:sender] && _isRepeatClicked== NO) return;
    
    self.selectedIndex = buttonIndex;
    [self animationForIncateView];
    if (self.clickedIndex) {
        
        self.clickedIndex(self.selectedIndex);
    }


}
-(void)setSelectedIndex:(NSInteger)selectedIndex{
    
    _selectedIndex = selectedIndex;
    [selectedButton setTitleColor:self.normalTextColor forState:UIControlStateNormal];
    [selectedButton setBackgroundImage:nil forState:UIControlStateNormal];
    selectedButton.layer.borderColor = [UIColor clearColor].CGColor;
    //selectedButton.selected = NO;
    selectedButton = _buttonArray[selectedIndex];
    //selectedButton.selected = YES;
    [selectedButton setTitleColor:self.selectedTextColor forState:UIControlStateNormal];
    [selectedButton setBackgroundImage:_backgroundImage forState:UIControlStateNormal];
     selectedButton.layer.borderColor = self.selectedTextColor.CGColor;
    //selectedButton.layer.borderWidth = 1.0;
    
    
    
}
-(void)animationForIncateView{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.incateView.transform = CGAffineTransformMakeTranslation(_selectedIndex*_incateView.bounds.size.width, 0);
    }];
    
}


#pragma mark ------- setter and getter

#pragma mark -------getter

-(UIColor *)normalTextColor{
    
    if (!_normalTextColor) {
        
        _normalTextColor = RGB(144, 144, 144);
    }
    return _normalTextColor;
    
}
-(UIColor *)selectedTextColor{
    
    if (!_selectedTextColor) {
        
        _selectedTextColor = RGB(81, 143, 194);
    }
    return _selectedTextColor;
    
}
-(UIColor *)indicateColor{

    if (!_indicateColor) {
        
        return self.selectedTextColor;
    }
    return _indicateColor;

}
-(UIView *)incateView{

    if (!_incateView) {
        
        _incateView = [[UIView alloc] init];
        
    }
    return _incateView;

}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    _incateView.backgroundColor = self.indicateColor;
    
    //绘制分割线
    if (_hidenInnnerLine) return;
    if (self.strokeColor == nil) {
        
        self.strokeColor = self.normalTextColor;
    }
    [self.strokeColor setStroke];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1);
    CGFloat buttonWidth = (self.bounds.size.width - _horizontalSpace *2)/_items.count;
    
    //线长0.8
    CGFloat margin = rect.size.height*0.2;
    for (int i=1; i<_items.count; i++) {
        
        CGContextMoveToPoint(context, _horizontalSpace+buttonWidth*i, margin);
        CGContextAddLineToPoint(context, _horizontalSpace+buttonWidth*i, rect.size.height*0.8);
        CGContextStrokePath(context);
    }
    
}

-(NSArray *)buttons{

    return _buttonArray;
}
@end
