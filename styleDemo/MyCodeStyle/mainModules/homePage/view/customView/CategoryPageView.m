//
//  CategoryPageView.m
//  MiaoTong
//
//  Created by mrc on 16/9/6.
//  Copyright © 2016年 com.yibaoli. All rights reserved.
//

#import "CategoryPageView.h"
#import "Masonry.h"
@interface CategoryPageView (){

    NSArray *categotyViews;
    
}

@end
@implementation CateModel


@end

@implementation CategoryCell


-(id)init{

    self = [super init];
    if (self) {
        
        //给个默认值,不然自动布局会打印出错误
        //self.backgroundColor = [UIColor redColor];
        self.frame = CGRectMake(0, 0, 100, 100);
        [self createSubView];
        
        
    }
    return self;

}
//******创建subView
-(void)createSubView{

    _imageView = [[UIImageView alloc] init];
    //_imageView.image = IMG(@"ticketQuota");
    //_imageView.backgroundColor = RGBA(200, 200, 200, 1);
   //[_imageView borderForWidth:1 corner:3 color:RGB(240, 240, 240)];
   // _imageView.backgroundColor = [UIColor greenColor];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _textLabel = [[UILabel alloc] init];
    //_textLabel.backgroundColor = [UIColor greenColor];
    //_textLabel.text = @"傻逼";
    _textLabel.textColor =RGB(80, 80, 82);
    _textLabel.textAlignment = NSTextAlignmentCenter;
    _textLabel.font = [UIFont systemFontOfSize:12];
    
//    _redPot = [[UILabel alloc] init];
//    _redPot.backgroundColor = RGB(255, 0, 0);
//    _redPot.hidden = YES;
//    [_redPot borderForWidth:0 corner:8 color:RGBA(0, 0, 0, 0)];
    [self addSubview:_imageView];
    [self addSubview:_textLabel];
//    [self addSubview:_redPot];
//     _tapGesture = [[UITapGestureRecognizer alloc] init];
//    [_tapGesture addGestureSignal:@"tapClicked:" target:DEF_TARGET(CategoryPageView)];
//    [self addGestureRecognizer:_tapGesture];
    
    //自动布局
//    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
//    _textLabel.translatesAutoresizingMaskIntoConstraints = NO;
//    self.translatesAutoresizingMaskIntoConstraints = NO;
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_left).with.offset(0);
        make.bottom.equalTo(self.mas_bottom).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(0);
        make.height.equalTo(@18);
        
    }];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_left).with.offset(2);
        make.bottom.equalTo(_textLabel.mas_top).with.offset(-2);
        make.right.equalTo(self.mas_right).with.offset(-2);
        make.top.equalTo(self.mas_top).with.offset(2);
        
    }];
//    [_redPot mas_makeConstraints:^(MASConstraintMaker *make) {
//       
////        //make.left.equalTo(_imageView.mas_right).offset(-5);
////        make.top.equalTo(_imageView.mas_top).offset(0);
////        make.centerX.equalTo(@0).offset(30);
//        make.top.equalTo(@15);
//        make.right.equalTo(@(-15));
//        make.width.equalTo(@16);
//        make.height.equalTo(@16);
//        
//    }];
    
    
    
}
@end

@implementation CategoryPageView

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUp];
        //NOTICE_ADD(@selector(recieveNewMessage:), @"Z17ShowRedNodeNotificationName");
    }
    return self;
    
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        
      
        [self setUp];
        //NOTICE_ADD(@selector(recieveNewMessage:), Z17ShowRedNodeNotificationName);
    }
    return self;
    
}

-(void)recieveNewMessage:(NSNotification *)sender{
    
    CategoryCell *view = categotyViews.firstObject;
    view.redPot.hidden = NO;

    //收到通知显示小红点
    
//    if (self.index == 0) {
//        
//        self.redPot.hidden = NO;
//    }
}
-(void)dealloc{

    //NOTICE_DEL(Z17ShowRedNodeNotificationName);
}
-(void)setUp{
    
    _numberOfColumn = 5;
    _numberOfLines  = 1;
    _interSpace = 2;
    _lineSpace = 2;
    _edgeX = 20;
    _edgeY = 5;
    self.pagingEnabled = NO;
    self.backgroundColor = RGBA(255, 255, 255,0);
    //[self layoutConfiguer];
    
}
-(void)setItems:(NSArray *)items{

    _items = items;
    //创建item
    //self.backgroundColor = [UIColor redColor];
    for (UIView *view in categotyViews) {
        
        [view removeFromSuperview];
    }
    NSMutableArray *views = [NSMutableArray array];
    
    int index = 0;
    for (CateModel *md in items) {
        
        CategoryCell *view = [[CategoryCell alloc] init];
        view.index = index;
        view.textLabel.text = md.title;
        
        UIImage *image = IMG(md.icon);
        
        if (image) {
            
            view.imageView.image = image;
            
        }else{
            
//            NSString *imagePath = [ESPhotoPathSpliter splitPathWithImageId:md.icon size:CGSizeMake(100, 100)];
//            [view.imageView sd_setImageWithURL:URL(imagePath) placeholderImage:IMG(@"hold_3")];
        }
       
        
        [views addObject:view];
        [self addSubview:view];
        index++;
    }
    categotyViews = views;
}

//-(UIView *)productElement:(id)obj{
//
//    CategoryCell *view = [[CategoryCell alloc] init];
//    view.backgroundColor = [UIColor yellowColor];
//    return view;
//
//}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    //NSLog(@"------------ff:%@",NSStringFromCGRect(self.frame));
    [self layoutConfiguer];
    
}

-(void)layoutConfiguer{
    
    
    //CGSize size = self.bounds.size;
    NSInteger pageSize = _numberOfColumn*_numberOfLines;
    
    if (pageSize == 0) {
        
        NSLog(@"元素不存在！！！");
        return;
    }
    //每页个数
    //self.pagingEnabled = YES;
    NSInteger totalNumber = _items.count;
    CGFloat boundsWidth = self.bounds.size.width;
    CGFloat boundsHeight = self.bounds.size.height;
    NSInteger itemPerPage = _numberOfColumn*_numberOfLines;
    NSInteger numberOfPages = (_items.count+itemPerPage-1)/itemPerPage;
    CGFloat pageWidth = self.bounds.size.width;
    CGFloat edgeX = _edgeX;
    CGFloat edgeY = _edgeY;
    CGFloat contentWidth =0;
    CGFloat itemWidth = (boundsWidth-edgeX*2 - _lineSpace*(_numberOfColumn-1))/_numberOfColumn;
    CGFloat itemHeight = (boundsHeight - edgeY*2 - _interSpace*(_numberOfLines-1))/_numberOfLines;
    CGRect frame;
    for (int i=0; i<numberOfPages; i++) {
        //每页布局,每页不一定有5个
        NSInteger max = totalNumber-(i+1)*itemPerPage;
        if (max>0) max = itemPerPage;
        else max += itemPerPage;
        
        for (int j=0; j<max; j++) {
            
            NSInteger mx = j%_numberOfColumn;
            NSInteger my = j/_numberOfColumn;
            CGFloat ox = edgeX + pageWidth*i + (itemWidth+_lineSpace)*mx;
            if (self.pagingEnabled) {
                ox = edgeX + pageWidth*i + (itemWidth+_lineSpace)*mx;
            }else{
                //i*_numberOfColum+mx
                ox = edgeX + i*(itemWidth+_lineSpace)*_numberOfColumn + (itemWidth+_lineSpace)*mx;
            }
            CGFloat oy = edgeY +(itemHeight+_interSpace)*my;
            frame = CGRectMake(ox, oy, itemWidth, itemHeight);
            CGFloat maxY = CGRectGetMaxX(frame);
            if (maxY>contentWidth) {
                contentWidth = maxY;
            }
            NSInteger index = i*itemPerPage + j;
            UIView *view = categotyViews[index];
            view.frame = frame;
            //view.backgroundColor = [UIColor greenColor];
            //self.backgroundColor = [UIColor redColor];
            
        }
    }
    if (self.pagingEnabled) {
        
        self.contentSize = CGSizeMake(numberOfPages*boundsWidth, boundsHeight);
        
    }else{
        
        self.contentSize = CGSizeMake(contentWidth+edgeX, boundsHeight);
    }
//    NSInteger numeber = self.items.count;
//    CGFloat interSpace = _interSpace;//上下间距
//    CGFloat lineSpace = _lineSpace; //水平间距
//    CGFloat itemWidth = (size.width - lineSpace*(_numberOfColumn+1))/_numberOfColumn;
//    CGFloat itemHeight = (size.height-interSpace*(_numberOfLines+1))/_numberOfLines;
//   
//    CGRect frame = CGRectMake(lineSpace, interSpace,itemWidth, itemHeight);
//   
//    //不能使用subView遍历,scrollView自带2个指示条的子视图
//    /**
//     *  滚动时可选择是按页跳转还是自然滚动。按页滚动可能会有空白出现
//     */
//    NSInteger mutble = numeber/_numberOfLines +numeber%_numberOfLines;
//    NSInteger pageCount = (self.items.count+pageSize-1)/pageSize;
//    CGFloat sizeWidth =self.pagingEnabled ? size.width*pageCount:(itemWidth+lineSpace)*mutble+lineSpace;
//    self.contentSize = CGSizeMake(sizeWidth, itemHeight);
//    
//    int colum = 0;
//    int row = 0;
//
//    for (UIView *view in categotyViews) {
//        
//        
//        view.frame = frame;
//        colum++;
//        row ++;
//        NSInteger cp = colum/pageSize;
//        //NSInteger pageIndex = 0;
//        CGFloat offPage = cp*(size.width-lineSpace*!self.pagingEnabled);
//        frame.origin.x =lineSpace+(colum%_numberOfColumn)*(lineSpace +itemWidth) + offPage;
//        frame.origin.y =interSpace+((row%pageSize)/_numberOfColumn) *(interSpace+itemHeight);
//       
//    }
//    /*按页翻*/
//    // NSInteger pageCount = (self.items.count+pageSize-1)/pageSize;
//     self.contentSize = CGSizeMake(size.width*pageCount, size.height);
//    for (UIView *view in categotyViews) {
//        
//        
//                view.frame = frame;
//                colum++;
//                row ++;
//                NSInteger cp = colum/pageSize;
//                frame.origin.x =lineSpace+(colum%_numberOfColumn)*(lineSpace +itemWidth) + cp*size.width;
//                frame.origin.y =interSpace+((row%pageSize)/_numberOfColumn) *(interSpace+itemHeight);
//        
//    }

    
    
}


-(void)tapClicked:(UITapGestureRecognizer *)sender{
    
    CategoryCell *view = (CategoryCell *)sender.view;
    view.redPot.hidden = YES;
    //NSLog(@"-----tap --------:%ld",(long)view.index);
    if (self.action) {
        
        self.action(view.index);
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
