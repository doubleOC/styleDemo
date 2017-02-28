//
//  BSJsonModel.h
//  MyCodeStyle
//
//  Created by mrc on 2017/2/24.
//  Copyright © 2017年 mrc. All rights reserved.
//

#import "JSONModel.h"


#define PER_PAGE_SIZE 20
#define JSObjectProperty(__property,__propertyName) \
@property (nonatomic,strong) __property <Optional>*__propertyName;

#define JSSetProperty(__property,__propertyName,__protocol)\
@property (nonatomic,strong) __property <__protocol,Optional>*__propertyName;

#define JSAssignProperty(__property,__propertyName)\
@property (nonatomic,assign) __property __propertyName;

////model数据方法
//#define ON_REQUEST(__class,__paras,__result)\
//+(void)load_##__class:(id)__paras finished:(ModelBolck)__result

//数据回调方法

#define ON_MESSAGE(__class,__model)   -(void)message_##__class##_##__model

typedef void(^ModelBolck)(id model,NSString *error);

/**
 JSMultipageDelegate代理用于多页加载数据
 */
@protocol JSMultipageDelegate

@optional

/**
 加载第一页
 */
-(void)loadFirstPage;

/**
 加载下一页
 */
-(void)loadNextPage;

/**
 获取网络请求所需的参数，简化传值
 
 @param obj 网络参数列表
 */
-(void)filterParas:(id)obj,...;


@end


/**
 数据请求模型基类，子类继承，key值为属性名
 */
@interface BSJsonModel : JSONModel{
    
@public id _observer;  //回条接收者
        NSString *cacheExt; //模型缓存扩展名
    
}

/**
 创建模型对象
 
 @param observe 事件监听对象
 @return BaseMode实例
 */
+(instancetype)modelWithObserve:(id)observe;

/**
 创建模型对象
 
 @param observe 事件监听对象
 @param cacheName 缓存文件名
 @return BaseMode实例
 */
+(instancetype)modelWithObserve:(id)observe cache:(NSString *)cachePath;

/**
 HTTP POST请求
 
 @param urlString 请求url
 @param paras 请求参数
 @param controller 发起请求的控制器(默认是根视图)
 @param resultBlock 请求结果回调
 */
+(void)model_POST:(NSString *)urlString paramtter:(NSDictionary *)paras controller:(UIViewController *)controller result:(ModelBolck)resultBlock;
/**
 HTTP GET请求
 
 @param urlString 请求url
 @param paras 请求参数
 @param controller 发起请求的控制器(默认是根视图)
 @param resultBlock 请求结果回调
 */

+(void)model_GET:(NSString *)urlString paramtter:(NSDictionary *)paras controller:(UIViewController *)controller result:(ModelBolck)resultBlock;

/**
 图片上传
 
 @param urlString 请求url
 @param paras 请求参数
 @param images 需要上传的图片数组(数组元素为NSData类型)
 @param resultBlock 请求结果回条
 */
+(void)model_upload:(NSString *)urlString paramtter:(NSDictionary *)paras images:(NSArray *)images result:(ModelBolck)resultBlock;

/**
 将数据拷贝到模型
 
 @param data json数据
 */
-(void)copyDataToSelf:(id)data;



/**
 模型归档
 */
-(void)saveCache;

/**
 加载本地归档模型
 
 @return 返回一个BaseModel模型(没有缓存返回nil)
 */
-(id)loadCache;

/**
 删除本地归档模型数据
 */
-(void)deleteCache;

@end
