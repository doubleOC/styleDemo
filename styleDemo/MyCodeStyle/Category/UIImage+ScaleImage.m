//
//  UIImage+ScaleImage.m
//  HuanLe
//
//  Created by lx on 15/5/25.
//  Copyright (c) 2015年 shengu. All rights reserved.
//

#import "UIImage+ScaleImage.h"

#define P_KB 1024

@implementation UIImage (ScaleImage)

-(UIImage *)transformtoSize:(CGSize)Newsize{
    
    // 创建一个bitmap的context
    UIGraphicsBeginImageContext(Newsize);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, Newsize.width, Newsize.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage *TransformedImg=UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return TransformedImg;
    
}
//有区别吗！！！data压缩到指定大小-->100kb?
-(UIImage *)compressWithQuality:(CGFloat)quality{

    CGSize size = self.size;
    CGSize newSize = CGSizeMake(size.width*quality, size.height*quality);
    UIGraphicsBeginImageContext(newSize);
    [self drawInRect:(CGRect){CGPointZero,newSize}];
    UIImage *comImage = UIGraphicsGetImageFromCurrentImageContext();
    return comImage;


}
//data压缩到600KB以内，很号时间，大概要2秒
-(UIImage *)compressWithNewSize:(NSInteger )imageSize{
    
    
    NSData *data = UIImageJPEGRepresentation(self, 1.0);
    UIImage *comImage = self;
    CGSize size = self.size;
    imageSize *= 1024;
    while (data.length>imageSize) {
        
        //这个size哪来的
        
        CGSize newSize = CGSizeMake(size.width*0.7, size.height*0.7);
        UIGraphicsBeginImageContext(newSize);
        [self drawInRect:(CGRect){CGPointZero,newSize}];
        comImage = UIGraphicsGetImageFromCurrentImageContext();
        size = comImage.size;
        //NSLog(@"---------ppppppppppppppppp");
        data = UIImageJPEGRepresentation(comImage, 1.0);
    }
    return comImage;

}

+(UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end
