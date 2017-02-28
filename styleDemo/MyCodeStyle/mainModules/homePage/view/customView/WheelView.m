//
//  WheelView.m
//  MiaoTong
//
//  Created by mrc on 16/9/6.
//  Copyright © 2016年 com.yibaoli. All rights reserved.
//

#import "WheelView.h"

@interface WheelView (){

    NSDate *lastAutoScrollDate;
}

//@property (nonatomic,strong) UIView *firstItem;
//@property (nonatomic,strong) UIView *lastItem;

@end

@implementation WheelView

-(id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, kScreenWidth, 100);
        [self initlizeSetUp];
    }
    return self;

}
-(id)initWithCoder:(NSCoder *)aDecoder{

    self = [super initWithCoder:aDecoder];
    if (self) {
        
        [self initlizeSetUp];
      
    }
    return self;

}
-(void)initlizeSetUp{
    
    lastAutoScrollDate = [NSDate date];
    
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
    //[self performSelector:@selector(autoScroller) withObject:nil afterDelay:2];

}

-(void)setItems:(NSArray<UIView *> *)items{
    
    for (UIView *view in _scrollView.subviews) {
        
        [view removeFromSuperview];
    }
    
    _items = items;
    _pageControl.numberOfPages = items.count;
    //_pageControl.backgroundColor = [UIColor redColor];
    //_pageControl.hidden = (items.count==0);
    [self addElement];
    [self layoutSubviews];
    
    //控制滚动
    if (items.count <= 1) {
        
        _pageControl.hidden = YES;
         [self stop];
    }else{
    
        _pageControl.hidden = NO;
        [self start];
    }
    
}


-(UIScrollView *)scrollView{

    if (!_scrollView) {
        
        _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        _scrollView.backgroundColor = RGB(255, 255, 255);
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        //_scrollView.decelerationRate = 0.1;
        
    }
    return _scrollView;

}
-(UIPageControl *)pageControl{

    if (!_pageControl) {
        
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.center = CGPointMake(self.bounds.size.width/2, _pageControl.center.y);
        _pageControl.numberOfPages = 0;
        _pageControl.currentPageIndicatorTintColor = RGB(138, 138, 138);
        _pageControl.pageIndicatorTintColor = RGB(230, 230, 230);
        
    }
    return _pageControl;

}
-(void)addElement{

    for (UIView *view in self.items) {
        //增加点击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        tap.numberOfTapsRequired = 1;
        view.userInteractionEnabled = YES;
        [view addGestureRecognizer:tap];
        
        [self.scrollView addSubview:view];
    }
    
//    NSArray *copyArray = [self.items mutableCopy];
//    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:self.items];
//    [array insertObject:_items.lastObject atIndex:0];
//    [array addObject:_items.firstObject];
    //造成循环滚动效果，首尾各加一张图片 ,无法使用mutableCopy!!
//    _firstItem =[self duplicate:[_items lastObject]];
//    _lastItem = [self duplicate:[_items firstObject]];
    if (_firstItem) {
        
        [self.scrollView addSubview:_firstItem];
    }
    if (_lastItem) {
        
        [self.scrollView addSubview:_lastItem];
    }
    
    

}
-(void)layoutSubviews{

    [super layoutSubviews];
    
    CGRect frame = self.bounds;
    
    _scrollView.frame = frame;
    _pageControl.frame = CGRectMake((frame.size.width-200)/2.0, frame.size.height-20, 170, 20);
    _scrollView.contentSize = CGSizeMake(frame.size.width*(_items.count+2), frame.size.height);
    _scrollView.contentOffset = CGPointMake(frame.size.width, 0);
    for (int i=0; i<_items.count; i++) {
        
        UIView *view = _items[i];
        view.frame = CGRectMake(frame.size.width*(i+1), 0, frame.size.width, frame.size.height);
        
    }
    _firstItem.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    _lastItem.frame = CGRectMake(frame.size.width*(_items.count+1), 0, frame.size.width, frame.size.height);
  
}
- (UIView*)duplicate:(UIView*)view
{
    //闪退
//    return nil;
 //    UIView *copyView = [[[view class] alloc] init];
//    copyView.frame = view.frame;
//    unsigned int propertyCount    = 0;
//    objc_property_t *propertyList = class_copyPropertyList([view class], &propertyCount);
//    
//    for (int i=0; i<propertyCount; i++) {
//        
//        objc_property_t aProperty = propertyList[i];
//        const char *name          = property_getName(aProperty);
//        NSString *propertyName    = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
//        id value = [view valueForKey:propertyName];
//        if (value != nil) [copyView setValue:value forKey:propertyName];
//        
//        
//    }
//    free(propertyList);
//    return copyView;
    NSData * tempArchive = [NSKeyedArchiver archivedDataWithRootObject:view];
    return [NSKeyedUnarchiver unarchiveObjectWithData:tempArchive];
}


-(void)tapAction:(UITapGestureRecognizer *)sender{
    /**
     *  鉴别当前点击的页数
     */
   // NSLog(@" ----tap !!!!!index:%ld",(long)self.pageControl.currentPage);
    if (self.action) {
        
        self.action(self.pageControl.currentPage);
        
    }
}

#pragma mark ------ scrollView delegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    lastAutoScrollDate = [NSDate date];
    
    CGFloat width = scrollView.frame.size.width;
    CGFloat totalPages = _items.count;
    CGFloat off_x = scrollView.contentOffset.x;
    
    if (off_x >= width*(totalPages+1)) {
        
        scrollView.contentOffset = CGPointMake(width, 0);
        
    }else if (off_x <= 0){
        
        scrollView.contentOffset = CGPointMake(width*totalPages, 0);
    }
    
    off_x = scrollView.contentOffset.x;
    off_x -= (_pageControl.currentPage+1)*width;
    NSInteger changeIndex=off_x/width;
    _pageControl.currentPage += changeIndex;

}
//自动滚动 --- 2秒滚动一次
#define interval 3
-(void)autoScroller{
    
    NSTimeInterval delay = [[NSDate date] timeIntervalSinceDate:lastAutoScrollDate];
    if (delay >= interval) {
        delay = 0;
        lastAutoScrollDate = [NSDate date];
        NSInteger index = _pageControl.currentPage;
        index++;
        [_scrollView setContentOffset:CGPointMake((index+1)*self.frame.size.width, 0) animated:YES];
        
    }
    //无限自我调用
    //CGFloat delay = 2-second;
    [self performSelector:_cmd withObject:nil afterDelay:interval -delay];
    
}

-(void)start{

    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(autoScroller) object:nil];
    [self performSelector:@selector(autoScroller) withObject:nil afterDelay:2];

}
-(void)stop{

    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(autoScroller) object:nil];
}

-(void)dealloc{
    
    NSLog(@"delloc wheelView");
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(autoScroller) object:nil];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
