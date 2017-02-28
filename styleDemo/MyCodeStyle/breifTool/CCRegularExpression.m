//
//  CCRegularExpression.m
//  MyCodeStyle
//
//  Created by mrc on 2017/2/27.
//  Copyright © 2017年 mrc. All rights reserved.
//

#import "CCRegularExpression.h"

@implementation CCRegularExpression
BOOL empty(NSString *string){
    
    
    if (string == nil || string == NULL)
    {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]length] == 0)
    {
        return YES;
    }
    
    return NO;
    
    
}

//确保非空
NSString *nonEmpty(NSString *string){
    
    return empty(string) ? @"":string;
    
}

@end
