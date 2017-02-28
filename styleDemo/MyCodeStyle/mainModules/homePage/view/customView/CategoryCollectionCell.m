//
//  CategoryCollectionCell.m
//  MiaoTong
//
//  Created by mrc on 16/9/6.
//  Copyright © 2016年 com.yibaoli. All rights reserved.
//

#import "CategoryCollectionCell.h"

@interface CategoryCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation CategoryCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end


@implementation CategoryCollectionView

-(id)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout{
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        //[self initlizeSetUp];
        [self setUp];
    }
    return self;
    
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        //[self initlizeSetUp];
        [self setUp];
//        [self addObserver:self forKeyPath:@"self.bounds" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    }
    return self;
    
}
//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//
//    NSLog(@"----frame change-----");
//
//}
-(void)setUp{

    
    _interSpace = 3;
    _lineSpace = 3;
    self.scrollEnabled = NO;
    self.dataSource = self;
    self.delegate = self;
    self.showsHorizontalScrollIndicator = NO;
   
    [self registerNib:[UINib nibWithNibName:@"CategoryCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"Category"];
 
}
-(void)setItems:(NSArray *)items{
  
    _items = items;
    //[self layoutConfiguer];
    [self reloadData];

}
-(void)layoutConfiguer{
    
    CGSize size = self.bounds.size;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    CGFloat interSpace = _interSpace;//上下间距
    CGFloat lineSpace = _lineSpace;//水平间距
   // NSInteger pageSize = _numberOfColumn*_numberOfLines;
    
    if (_numberOfColumn*_numberOfLines == 0) {
        
        //NSLog(@"元素不存在！！！");
        return;
    }
   // NSLog(@"-----size:%@ line:%ld,%ld",NSStringFromCGSize(size),_numberOfLines,_items.count);

    CGFloat itemWidth = (size.width - lineSpace*(_numberOfColumn+1))/_numberOfColumn;
    //高度是否需要确保是正方形
    //CGFloat itemHeight = (size.height-interSpace*(_numberOfLines+1))/_numberOfLines;
    layout.itemSize = CGSizeMake(itemWidth, itemWidth);
    layout.sectionInset = UIEdgeInsetsMake(interSpace, lineSpace, interSpace, lineSpace);
    layout.minimumInteritemSpacing = interSpace;
    layout.minimumLineSpacing = lineSpace;
    //layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionViewFlowLayout *currentLayout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    if (!CGSizeEqualToSize(layout.itemSize,currentLayout.itemSize)) {
        
        self.collectionViewLayout = layout;
        self.contentOffset = CGPointZero;
       
        
    }
    
    
    
    
}


-(void)layoutSubviews{
    
   
    [super layoutSubviews];
    //[self layoutConfiguer];
   
  
   

}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPa
{
    if (_numberOfLines*_numberOfLines == 0) {
        return CGSizeZero;
    }
    CGFloat itemWidth = (self.bounds.size.width - _lineSpace*(_numberOfColumn+1))/_numberOfColumn;
    return CGSizeMake(itemWidth, itemWidth);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return _lineSpace;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return _interSpace;
}
#pragma mark ------- 数据源
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _items.count;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CategoryCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Category" forIndexPath:indexPath];
  
    //cell.backgroundColor = [UIColor greenColor];
//    //加载缩略图
     id obj = _items[indexPath.row];
    if ([obj isKindOfClass:[NSString class]]) {
        [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:obj] options:0 progress:nil completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
            
        }];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:obj]];
    }
//    NSString *imagePath = nil;
//    if ([obj isKindOfClass:[BPhotoModel class]]) {
//        
//         imagePath = [obj valueForKey:@"thumbnail"];
//        
//    }else{
//         imagePath = obj;
//        
//    }
////    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:URL(imagePath) options:(0) progress:^(NSInteger receivedSize, NSInteger expectedSize) {
////        
////    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
////        
////    }];
//
//    [cell.imageView sd_setImageWithURL:URL(imagePath) placeholderImage:IMG(@"es_hold_2") options:1];

    // [[SDImageCache sharedImageCache] clearMemory];
   
    //[[NSURLCache sharedURLCache] removeAllCachedResponses];
    //[cache clearMemory];
    //NSLog(@"图片加载次数啊");
//    SDImageCache *cache = [SDImageCache sharedImageCache];
//    UIImage *image = [cache imageFromDiskCacheForKey:imagePath];
//    if (image) {
//        
//        cell.imageView.image = image;
//        
//    }else{
//    
//      [cell.imageView sd_setImageWithURL:URL(imagePath) placeholderImage:IMG(@"es_hold_2")];
//        
//    }
   
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSIndexPath *idpx = [NSIndexPath indexPathForItem:0 inSection:0];
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:idpx];
    //开始放大的区域
    CGRect rect = [collectionView convertRect:cell.frame toView:[UIApplication sharedApplication].keyWindow];
    rect.origin.x += 5;
    rect.origin.y += 5;
    rect.size.width -= 10;
    rect.size.height -= 10;
    
//    ZCPageController *controller = [[ZCPageController alloc] init];
//    controller.data = _items;
//    controller.currentIndex = indexPath.row;
//    //controller.unitRect = rect;
//    //UICollectionViewFlowLayout *flow = (UICollectionViewFlowLayout *)collectionView.collectionViewLayout;
//    //controller.innerSpace = flow.minimumLineSpacing + 10;
//    controller.offerView = collectionView;
//    [controller display:YES];
    
    //      [ZCPageController showWithData:_list index:indexPath.row posion:rect];
    //      [ZCPageController showInWindowWithData:_list atIndex:indexPath.row];
    
}

//-(NSArray *)orginImageFromData:(NSArray *)data{
//
//    NSMutableArray *orginImages = [NSMutableArray array];
//    for (NSString *images in data) {
//        
//    }
//
//}
//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
//
//    if ([keyPath isEqualToString:@"frame"]) {
//        
//        NSLog(@"--%@",change);
//        
//    }else{
//    
//        [super observeValueForKeyPath:keyPath ofObject:object change:change context:nil];
//    }
//
//
//}

-(void)dealloc{
  
    //NSLog(@"--------delloc");
    //[self removeObserver:self forKeyPath:@"frame"];

}
@end
