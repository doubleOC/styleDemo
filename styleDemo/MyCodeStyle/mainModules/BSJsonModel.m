//
//  BSJsonModel.m
//  MyCodeStyle
//
//  Created by mrc on 2017/2/24.
//  Copyright © 2017年 mrc. All rights reserved.
//

#import "BSJsonModel.h"
#import <objc/runtime.h>

@interface BSJsonModel (){
    
    
    
}

@end

@implementation BSJsonModel


#pragma mark---------数据请求

+(void)model_POST:(NSString *)urlString paramtter:(NSDictionary *)paras controller:(UIViewController *)controller result:(ModelBolck)resultBlock{
    
    if (controller == nil) {
        
        controller = [UIApplication sharedApplication].keyWindow.rootViewController;
        
    }
//    [MT_AFNetClient postPath:urlString paramas:paras currentViewController:controller success:^(NSData *stringData, id JSONDict){
//        
//        id model = [[self alloc]initWithDictionary:JSONDict error:nil];
//        resultBlock(model,nil);
//        
//    } failed:^(NSString *error) {
//        
//        resultBlock(nil,error);
//        
//    } noNetwork:^(NSString *alertMessage) {
//        
//        resultBlock(nil,alertMessage);
//        
//    }];
    
}


+(void)model_GET:(NSString *)urlString paramtter:(NSDictionary *)paras controller:(UIViewController *)controller result:(ModelBolck)resultBlock{
    
    if (controller == nil) {
        
        controller = [UIApplication sharedApplication].keyWindow.rootViewController;
        
    }
    
//    [MT_AFNetClient getPath:urlString paramas:paras currentViewController:controller success:^(NSData *stringData, id JSONDict){
//        
//        id model = [[self alloc]initWithDictionary:JSONDict error:nil];
//        resultBlock(model,nil);
//        
//        
//    } failed:^(NSString *error) {
//        
//        resultBlock(nil,error);
//        
//    } noNetwork:^(NSString *alertMessage) {
//        
//        resultBlock(nil,alertMessage);
//        
//    }];
    
    
}

+(void)model_upload:(NSString *)urlString paramtter:(NSDictionary *)paras images:(NSArray *)images result:(ModelBolck)resultBlock{
    
    
//    [MT_AFNetClient uploadCCImageWithUrl:urlString image:images dic:[NSMutableDictionary dictionaryWithDictionary:paras] currentViewController:[UIApplication sharedApplication].keyWindow.rootViewController success:^(NSData *stringData, id JSONDict) {
//        
//        id model = [[self alloc]initWithDictionary:JSONDict error:nil];
//        resultBlock(model,nil);
//        
//    } failed:^(NSString *error) {
//        
//        resultBlock(nil,error);
//        
//    } noNetwork:^(NSString *alertMessage) {
//        
//        resultBlock(nil,alertMessage);
//    }];
    
    
}

+(instancetype)modelWithObserve:(id)observe{
    
    BSJsonModel *model = [[self alloc] init];
    //加载缓存
    id obj = [model loadCache];
    if (obj) {
        model = obj;
    }
    model->_observer = observe;
    return model;
}
+(instancetype)modelWithObserve:(id)observe cache:(NSString *)cachePath{
    
    BSJsonModel *model = [[self alloc] init];
    model->_observer = observe;
    model->cacheExt = cachePath;
    //加载缓存
    id obj = [model loadCache];
    if (obj) {
         model = obj;
    }
    model->_observer = observe;
    model->cacheExt = cachePath;

    return model;
    
    
}

-(void)copyDataToSelf:(id)data{
    
    unsigned int propertyCount    = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &propertyCount);
    
    for (int i=0; i<propertyCount; i++) {
        
        objc_property_t aProperty = propertyList[i];
        const char *name          = property_getName(aProperty);
        NSString *propertyName    = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
        id value = [data valueForKey:propertyName];
        
        if (value != nil) [self setValue:value forKey:propertyName];
        
        
    }
    free(propertyList);
    
}

#pragma  mark ------模型数据持久化(数据归档)

-(id)loadCache{
    
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self archieverPath]];
}
-(void)saveCache{
    
    [NSKeyedArchiver archiveRootObject:self toFile:[self archieverPath]];
}
-(void)deleteCache{
    
    [[NSFileManager defaultManager] removeItemAtPath:[self archieverPath] error:nil];
}
//-(NSString *)getFileSaveDate{
//
//    return nil;
//}
//归档路径
//帐号+类名+唯一标识
-(NSString *)archieverPath{
    
    //创建缓存路径文件夹
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *folderPath = [NSString stringWithFormat:@"%@/Documents/jsonCache",NSHomeDirectory()];
    if (![fileManager fileExistsAtPath:folderPath]) {
        
        [fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:NO attributes:nil error:nil];
    }
    NSString *className = NSStringFromClass([self class]);
    NSString *account = @"157388";
    NSString *filePath = [NSString stringWithFormat:@"%@/%@-%@-%@",folderPath,account,className,nonEmpty(self->cacheExt)];
    return filePath;
    
}
#pragma mark --------mode归档

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    if (self) {
        
        [self modelCoder:aDecoder archieved:NO];
        
    }
    return self;
    
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [self modelCoder:aCoder archieved:YES];
    
}

-(void)modelCoder:(NSCoder *)aCoder archieved:(BOOL)archiever{
    
    unsigned int propertyCount = 0;
    objc_property_t *propertys = class_copyPropertyList([self class], &propertyCount);
    for (int i=0; i<propertyCount; i++) {
        
        objc_property_t aProperty = propertys[i];
        NSString *propertyName = [NSString stringWithCString:property_getName(aProperty) encoding:NSUTF8StringEncoding];
        if (archiever) {
            
            id value = [self valueForKey:propertyName];
            [aCoder encodeObject:value forKey:propertyName];
            
        }else{
            
            id value = [aCoder decodeObjectForKey:propertyName];
            // NSLog(@"------value:%@",value);
            //value 为nil也可以???
            [self setValue:value forKey:propertyName];
        }
        
    }
    free(propertys);
    
    
}

#pragma mark ----------kvc空值处理

-(void)setNilValueForKey:(NSString *)key{
    
    NSLog(@"赋值为空:%@",key);
    
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    NSLog(@"赋值失败--UndefinedKey:%@",key);
    
}
-(id)valueForUndefinedKey:(NSString *)key{
    
    NSLog(@"取值失败--UndefinedKey:%@",key);
    return nil;
}

#pragma mark ------ 打印

@end
