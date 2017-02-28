//
//  CategoryCollectionCell.h
//  MiaoTong
//
//  Created by mrc on 16/9/6.
//  Copyright © 2016年 com.yibaoli. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ZCPageController.h"

@interface CategoryCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@interface CategoryCollectionView: UICollectionView

@property (nonatomic,strong) NSArray *items;
/**
 *  全屏显示的行数(numberOfLines)和列数(numberOfColumn)
 */
@property (nonatomic,assign) NSInteger numberOfLines;
@property (nonatomic,assign) NSInteger numberOfColumn;
@property (nonatomic,assign) CGFloat interSpace; //上下间距
@property (nonatomic,assign) CGFloat lineSpace;  //水平间距

@end
