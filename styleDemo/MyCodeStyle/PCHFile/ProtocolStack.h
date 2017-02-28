//
//  ProtocolStack.h
//  MiaoTong
//
//  Created by mrc on 16/8/31.
//  Copyright © 2016年 com.yibaoli. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  一些通用协议 和 block 的声明
 */


/**
 *  计算cell高度协议声明
 */
@protocol DynamicHeightDelegate <NSObject>

@optional

@property (nonatomic,assign,readonly) CGFloat height;

+(CGFloat)caculateHeightWithData:(id)data;

@end

/**
 *  点击的某个索引
 *
 *  @param NSInteger 索引所在位置
 */
typedef void(^TAP_ACTION)(NSInteger );
