//
//  ESSaySayModdel.h
//  MiaoTong
//
//  Created by mrc on 16/9/18.
//  Copyright © 2016年 com.yibaoli. All rights reserved.
//

#import "BSJsonModel.h"

@protocol SaySayInfo      @end
@protocol EmployeeInfo    @end

@class SaySayInfo,EmployeeInfo,ForwardInfo;


@interface ESSaySayModdel : BSJsonModel<JSMultipageDelegate>


@property (nonatomic, assign) NSInteger Result;

@property (nonatomic, strong) NSMutableArray<SaySayInfo,Optional> *Data;

@property (nonatomic, copy) NSString <Optional>*LastId;

//@property (nonatomic, assign) NSInteger TotalPage;

@property (nonatomic, strong) NSNumber<Optional>*TotalCount;

@property (nonatomic, strong) NSNumber<Optional>*PageSize;

@property (nonatomic, copy) NSString <Optional>*Message;


@end
@interface SaySayInfo : BSJsonModel

@property (nonatomic,strong)  NSString <Optional>*Id;

@property (nonatomic, assign) NSInteger TotalForward;

@property (nonatomic, strong) NSArray <Optional>*Images;

@property (nonatomic, assign) NSInteger TotalReply;

@property (nonatomic, strong) EmployeeInfo <Optional>*Employee;

@property (nonatomic, copy) NSString <Optional>*SpaceId;

@property (nonatomic, copy) NSString <Optional>*Content;

@property (nonatomic, assign) NSInteger TotalThumbUp;

@property (nonatomic, copy) NSString <Optional>*SubjectId;

@property (nonatomic, copy) NSString <Optional>*CreateTime;

@property (nonatomic, copy) ForwardInfo<Optional>*Forward;

@property (nonatomic, assign) BOOL HaveThumbUp;

@property (nonatomic, strong) NSNumber<Optional> *CanDelete;

@property (nonatomic,strong) NSNumber<Optional> *height;//根据数据计算出来的高度

@end

@interface EmployeeInfo : BSJsonModel

@property (nonatomic, copy) NSString <Optional>*Name;

@property (nonatomic, copy) NSString <Optional>*Mobilephone;

@property (nonatomic, assign) BOOL Sex;

@property (nonatomic, copy) NSString <Optional>*Code;

@property (nonatomic, copy) NSString <Optional>*Id;

@end



@interface ForwardInfo : BSJsonModel

@property (nonatomic, copy) NSString <Optional>*Id;

@property (nonatomic, copy) NSString <Optional>*Content;

@property (nonatomic, copy) NSArray <Optional>*Images;

@property (nonatomic, copy) NSString <Optional>*CreateTime;

@property (nonatomic, copy) EmployeeInfo <Optional>*Employee;


@end

