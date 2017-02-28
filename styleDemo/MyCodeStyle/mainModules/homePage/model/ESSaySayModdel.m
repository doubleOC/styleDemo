//
//  ESSaySayModdel.m
//  MiaoTong
//
//  Created by mrc on 16/9/18.
//  Copyright © 2016年 com.yibaoli. All rights reserved.
//

#import "ESSaySayModdel.h"
#import "MTSaysayCell.h"
@interface ESSaySayModdel (){

    NSInteger _pageIndex;
    NSInteger _pageSize;
    NSString *topicId;
    NSString *keyWord;
    NSString *pathExtention;//缓存路径标示福
}

@end

@implementation ESSaySayModdel

-(void)filterParas:(id)obj, ...{

    NSMutableArray *paras = [NSMutableArray array];
    va_list args;
    
    va_start(args, obj);
    
    if(obj)
    {
        [paras addObject:obj];
        id nextArg;
        while((nextArg = va_arg(args, id))){
            
            [paras addObject:nextArg];
        }
    }
    va_end(args);
    topicId = paras[0];
    keyWord = paras[1];

}

-(void)loadFirstPage{
    
    //_pageIndex = 1;
    [self sendRequestWithLastId:nil];
    
}
-(void)loadNextPage{
    
    //_pageIndex ++;
    [self sendRequestWithLastId:self.LastId];
    
}
-(void)sendRequestWithLastId:(NSString *)lastId{
   
//    //LOGIN_INFO.spaceId = @"34";
//    if (LOGIN_INFO.spaceId == nil) {
//        NSLog(@"未选择空间");
//        //LOGIN_INFO.spaceId = @"34";
//        //return;
//        
//    }
//   
//    
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    [dict setObject:nonEmpty(lastId) forKey:@"LastId"];
//    [dict setObject:nonEmpty(LOGIN_INFO.spaceId) forKey:@"spaceId"];
//    [dict setObject:@(20) forKey:@"PageSize"];
//    [dict setObject:nonEmpty(topicId) forKey:@"SubjectId"];
//    [dict setObject:nonEmpty(keyWord) forKey:@"Keyword"];
//    [dict setObject:@"" forKey:@"SortFields"];
//    
//
//    NSLog(@"%@",API_V3(@"Api/Zone/Post/Space"));
//    
//    [[self class] model_GET:API_V3(@"Api/Zone/Post/Space") paramtter:dict controller:nil result:^(ESSaySayModdel *model, NSString *error) {
//        
//        [self dismissTips];
//        //高度统计
//        for(SaySayInfo *info in model.Data){
//          
//            CGFloat height = [MTSaysayCell caculateHeightWithData:info];
//            info.height = @(height);
//        
//        }
//        
//        if (error || model.Result != 0) {
//            
//            [self presentFailureTips:error?error:model.Message];
//            
//        }else{
//            
////            //图片加载过多导致内存不够崩溃--不知道有没有用
////             [[SDImageCache sharedImageCache] clearMemory];
////            [[SDImageCache sharedImageCache] setValue:nil forKey:@"memCache"];
//            if (lastId == nil) {
//                
//                [self copyDataToSelf:model];
//                
//            }else{
//                 self.LastId = model.LastId;
//                [self.Data addObjectsFromArray:model.Data];
//            }
//            
//            //缓存数据 --- 2个地方取的缓存一样！！！！
//            [self saveCache];
//            
//        }
//        
//        
//        //发送消息
//        NSString *selector = [NSString stringWithFormat:@"message_%@_%@",NSStringFromClass([self->_observer class]),NSStringFromClass([self class])];
//        [self sendSignal:selector sorce:self->_observer paras:model,nil];
//        
//    }];
    
    
}

@end


@implementation SaySayInfo

@end


@implementation EmployeeInfo

@end

@implementation ForwardInfo


@end
