//
//  UIImage+ScaleImage.h
//  HuanLe
//
//  Created by lx on 15/5/25.
//  Copyright (c) 2015年 shengu. All rights reserved.
//

#import <UIKit/UIKit.h>

//#define IMG(name) [UIImage imageNamed:name]
#define IMG(image)  [UIImage imageNamed:image]
@interface UIImage (ScaleImage)

-(UIImage *)transformtoSize:(CGSize)Newsize;
//图片压缩？不用系统的？？
-(UIImage *)compressWithQuality:(CGFloat)quality;
-(UIImage *)compressWithNewSize:(NSInteger )imageSize;
+(UIImage *)imageWithColor:(UIColor *)color;
@end
