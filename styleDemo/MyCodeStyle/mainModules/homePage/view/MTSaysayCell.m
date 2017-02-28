//
//  MTSaysayCell.m
//  MiaoTong
//
//  Created by mrc on 16/9/7.
//  Copyright © 2016年 com.yibaoli. All rights reserved.
//

#import "MTSaysayCell.h"
//#import "NSString+Attribute.h"
//#import "ESActionModel.h"
//#import "WCAlertView.h"
@interface MTSaysayCell ()<UIGestureRecognizerDelegate,UIAlertViewDelegate>


//@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *forwardTapper;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;

@end


@implementation MTSaysayCell

- (void)awakeFromNib {
   
    [super awakeFromNib];
    
    
     //self.isShowImage = YES;
    if (_isAllText) {
        
        _segmentView.items = @[@"点赞0",@"转发0",@"评论0"];
        
    }else{
    
        _segmentView.items = @[@"",@"",@""];
    
    }
    
    _segmentView.horizontalSpace = 0;
    _segmentView.showIndicateView = NO;
    _segmentView.indicateHieght = 0;
    _segmentView.isRepeatClicked = YES;
    _segmentView.normalTextColor = RGB(127, 127, 128);
    _segmentView.selectedTextColor = RGB(127, 127, 128);
    _segmentView.strokeColor = RGB(220, 220, 220);
    _segmentView.clickedIndex = ^(NSInteger index){
    
        [self segmentClickedAtIndex:index];
    
    };
//    //添加图标
//    if (_isAllText == NO) {
//        
//        NSArray *images = @[@"zan_no",@"transmit",@"comment"];
//        NSArray *selectedImages = @[@"zan_ok",@"transmit",@"comment"];
//        for (int i=0; i<self.segmentView.buttons.count; i++) {
//            
//            UIButton *button = self.segmentView.buttons[i];
//            button.imageEdgeInsets = UIEdgeInsetsMake(0, -1, 0, 0);
//            button.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
//            button.titleLabel.font = [UIFont systemFontOfSize:15];
//            [button setImage:IMG(images[i]) forState:UIControlStateNormal];
//            [button setImage:IMG(selectedImages[i]) forState:UIControlStateSelected];
//            
//        }
//
//    }
    _collectionView.scrollEnabled = NO;
   //[self.forwardTapper addGestureSignal:@"pushToDetail:" target:DEF_TARGET(MTEnterpriseController)];
    UITapGestureRecognizer *tapper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(forwardClicked:)];
    //tapper.cancelsTouchesInView = NO;
    tapper.delegate = self;
    [_containerVIew addGestureRecognizer:tapper];
    
    
}

//选择器事件
-(void)segmentClickedAtIndex:(NSInteger)index{


//    switch (index) {
//        case 0:{
//            
//            [self sendSignal:@"thumUpAction:" sorce:_target paras:_data,nil];
//            if (_data.HaveThumbUp) {
//                
//                //[favourModel cancelThumbUpWithId:data.Id];
//                _data.TotalThumbUp -= 1;
//                _data.TotalThumbUp = MAX(0, _data.TotalThumbUp);//出现负数
//                
//            }else{
//                
//                //[favourModel thumbUpWithId:data.Id];
//                _data.TotalThumbUp += 1;
//            }
//            
//            //默认成功,如果不成功咋
//            _data.HaveThumbUp = !_data.HaveThumbUp;
//            [self setUpSegmentView];
//            
//            break;
//        }
//        case 1:{
//            
//            [self sendSignal:@"forwardAction:" sorce:_target paras:_data,nil];
//            //[ESActionSkiper skiperToForward:self data:data];
//            break;
//            
//        }
//        case 2:{
//            
//            [self sendSignal:@"commentAction:" sorce:_target paras:_data,nil];
//            //[ESActionSkiper skipToComment:self Id:data.Id comment:YES];
//            break;
//        }
//            
//            
//    }


}


-(void)recoverDefaultState{

    
    _collectionView.numberOfLines = 0;
    _collectionView.items = nil;
    _contentLabel.text = nil;
    _transmitLabel.text = nil;
    _containerVIew.backgroundColor = RGB(255, 255, 255);



}


-(void)forwardClicked:(id)sender{
    
//    //如果已经删除原文,则不可点击
//    if(_data.Forward && _data.Forward.Id.integerValue == 0){
//    
//        NSLog(@"原文已删除");
//        return;
//    
//    }
//    
//    if (_data.Forward) {
//        
//        SaySayInfo *info = [[SaySayInfo alloc] init];
//        info.Employee = _data.Forward.Employee;
//        info.Content = _data.Forward.Content;
//        info.Id = _data.Forward.Id;
//        info.Images = _data.Forward.Images;
//        info.height = _data.height;
//        info.SpaceId = _data.SpaceId;
//        info.SubjectId = _data.SubjectId;
//        info.CreateTime = _data.CreateTime;
//        [self sendSignal:@"pushToSaysayDetail:" sorce:_target paras:info,nil];
//        
//    }
//    else{
//    
//       [self sendSignal:@"pushToSaysayDetail:" sorce:_target paras:_data,nil];
//    
//    }
   

}

- (IBAction)deleteAction:(UIButton *)sender {
    
//    [WCAlertView showAlertWithTitle:@"确定要删除该动态吗" message:@"" customizationBlock:nil completionBlock:^(NSUInteger buttonIndex, WCAlertView *alertView) {
//        
//        if (buttonIndex == 1) {
//            
//            [[self class] presentMessageTips:@"删除中..."];
//            [DELModel deleteZoneWithId:_data.Id result:^(DELModel *model, NSString *error) {
//                
//                [[self class] dismissTips];
//                 MSG_ERROR(error, model.Result, model.Message);
//                [self sendSignal:@"deleteZone:" sorce:_target paras:_data,nil];
//                
//            }];
//
//        }
//        
//    } cancelButtonTitle:@"取消" otherButtonTitles:@"删除", nil];
    
}

-(void)setUpSegmentView{
 
    UIButton *zanButton = _segmentView.buttons[0];
    UIButton *forwardButton = _segmentView.buttons[1];
    UIButton *commentButton = _segmentView.buttons[2];
    [zanButton setTitle:@"点赞" forState:UIControlStateNormal];
    [forwardButton setTitle:@"评论" forState:UIControlStateNormal];
    [commentButton setTitle:@"转发" forState:UIControlStateNormal];
//    zanButton.selected = _data.HaveThumbUp;
//    [zanButton setTitle:[NSString stringWithFormat:@"%@%ld",_segmentView.items[0],(long)_data.TotalThumbUp] forState:UIControlStateNormal];
//    [forwardButton setTitle:[NSString stringWithFormat:@"%@%ld",_segmentView.items[1],(long)_data.TotalForward] forState:UIControlStateNormal];
//    [commentButton setTitle:[NSString stringWithFormat:@"%@%ld",_segmentView.items[2],(long)_data.TotalReply] forState:UIControlStateNormal];
}
-(void)setData:(SaySayInfo *)data{

     _data = data;
    [self setUpSegmentView];
    _deleteButton.hidden = !_data.CanDelete.boolValue;
    self.contentLabel.text = data.Content;
    self.iconView.image = IMG(@"avatar");
    self.nameLabel.text = data.Employee.Name;
    self.dateLabel.text = data.CreateTime;
    //是否是转发
    NSArray *sourceImages;
    if (data.Forward) {
        
        self.containerVIew.backgroundColor = RGBA(240, 240, 240,0.8);
        NSString *string = [NSString stringWithFormat:@"转发: %@",data.Forward.Content];
        NSDictionary *attribute = @{NSForegroundColorAttributeName:RGB(83, 158, 220)};
//        NSAttributedString *attText = [string addText:nonEmpty(data.Forward.Employee.Name) attribute:attribute range:NSMakeRange(3, 0)];
        self.transmitLabel.text = nil;
        //self.transmitLabel.attributedText = attText;
        sourceImages = data.Forward.Images;
        
    }else{
    
       self.containerVIew.backgroundColor = RGB(255, 255, 255);
       self.transmitLabel.text = nil;
       self.transmitLabel.attributedText = nil;
       sourceImages = data.Images;
    
    }
    //将图片数据装换为全路径
    NSMutableArray *images = [NSMutableArray array];
    for(NSString *imageId in sourceImages){
        //http://mutone.fangte.com/V3/
        NSString *fullPath =  [NSString stringWithFormat:@"http://mutone.fangte.com/V3/Api/Zone/Image?id=%@&width=100",imageId];
        //BPhotoModel *pm = [ESPhotoPathSpliter getImageWithId:imageId thumbWidth:200];
        [images addObject:fullPath];
//        //pm.thumbnail =
//        NSString *imagePath = [ESPhotoPathSpliter splitPathWithImageId:imageId size:CGSizeMake(200, 0)];
//        [images addObject:imagePath];
        
    }
    //双倍加载。。。
    _collectionView.numberOfColumn = 3;
    _collectionView.numberOfLines = (images.count+2)/3;
    _collectionView.items = images;
    
    [self changeImageContainerHeight];
    

}
-(void)layoutSubviews{

    [super layoutSubviews];
    //[self layoutIfNeeded];

}
//创建随机图片数组
-(NSArray *)formatimageData:(NSArray *)photos{

//    NSMutableArray *images = [NSMutableArray array];
//    for(NSString *imageId in photos){
//        
//        NSString *imagePath = [ESPhotoPathSpliter splitPathWithImageId:imageId size:CGSizeMake(400, 400)];
//        [images addObject:imagePath];
//        
//    }
    
    return nil;
   // return images;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(MTSaysayCell *)calculatorCell{

    static MTSaysayCell *cell = nil;
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MTSaysayCell" owner:self options:nil] firstObject];
    }
    cell.frame = [UIScreen mainScreen].bounds;
    [cell layoutIfNeeded];
    return cell;
}
//根据底部约束视图获取cell高度(可写一个分类)
+(CGFloat)caculateHeightWithData:(SaySayInfo*)data{

//  MTSaysayCell *cell = [MTSaysayCell calculatorCell];
//    cell.contentLabel.text = data.Content;
//   
//    cell.nameLabel.text = data.Employee.Name;
//    cell.dateLabel.text = data.CreateTime;
//    //是否转发是
//    NSArray *sourceImages;
//    if (data.Forward) {
//        
//        cell.containerVIew.backgroundColor = RGBA(240, 240, 240,0.8);
//        NSString *string = [NSString stringWithFormat:@"转发: %@",data.Forward.Content];
//        NSDictionary *attribute = @{NSForegroundColorAttributeName:RGB(83, 158, 220)};
//        NSAttributedString *attText = [string addText:nonEmpty(data.Forward.Employee.Name) attribute:attribute range:NSMakeRange(3, 0)];
//        cell.transmitLabel.text = nil;
//        cell.transmitLabel.attributedText = attText;
//        sourceImages = data.Forward.Images;
//        
//    }else{
//        
//        cell.containerVIew.backgroundColor = RGB(255, 255, 255);
//        cell.transmitLabel.text = nil;
//        cell.transmitLabel.attributedText = nil;
//        sourceImages = data.Images;
//        
//    }
//    //将图片数据装换为全路径
//    NSArray *images = sourceImages;
//    cell.collectionView.numberOfColumn = 3;
//    cell.collectionView.numberOfLines = (images.count+2)/3;
//
//    [cell changeImageContainerHeight];
//
//    CGFloat height = CGRectGetMaxY(cell.bottomView.frame);
//    if (cell.hideButtonView) {
//        
//        height = CGRectGetMaxY(cell.containerVIew.frame);
//        
//    }
//    //+1是底部分割线
//    return height+1;
    return 100;

    
}
//+(CGFloat)cacuteHeightWithCommentData:(CommentData *)data{
//   
//   MTSaysayCell *cell = [MTSaysayCell calculatorCell];
//   
//   [cell recoverDefaultState];
//    NSMutableArray *images = [NSMutableArray array];
//    for(NSString *imageId in data.Images){
//        
//        NSString *imagePath = [ESPhotoPathSpliter splitPathWithImageId:imageId size:CGSizeMake(400, 400)];
//        [images addObject:imagePath];
//        
//    }
//    //NSArray *images = data.Images;
//    cell.collectionView.numberOfColumn = 3;
//    cell.collectionView.numberOfLines = (images.count+2)/3;
//    //cell.collectionView.items = images;
//    [cell changeImageContainerHeight];
//    cell.contentLabel.text = data.Content;
//    cell.containerVIew.backgroundColor = RGB(255, 255, 255);
//    
//    [cell layoutIfNeeded];
//    //CGFloat height = CGRectGetMaxY(cell.bottomView.frame);
//    
//    CGFloat height = CGRectGetMaxY(cell.containerVIew.frame);
////    cell.hideButtonView = YES;
////    if (cell.hideButtonView) {
////        
////        
////        
////    }
//    //+1是底部分割线
//    return height+1;
//
//    
//}





-(void)changeImageContainerHeight{

    //先确定collectionVIew
    self.frame = [UIScreen mainScreen].bounds;
    [self layoutIfNeeded];
    CGFloat width = self.collectionView.frame.size.width;
    CGFloat lines = self.collectionView.numberOfLines;
    CGFloat lineSpace = self.collectionView.lineSpace;
    CGFloat ox = (width-lineSpace)/3.0;
    CGFloat imageHeight = lines*ox;
//    NSLog(@"------%f",imageHeight);
    if (imageHeight >0) {
        
        imageHeight += lineSpace;
        
    }
    self.imageHeight.constant = imageHeight;
//    NSLog(@"------%ld",self.collectionView.constraints.count);
//    for (NSLayoutConstraint *constranit in self.collectionView.constraints) {
//       
//        if (constranit.firstAttribute == NSLayoutAttributeHeight) {
//            
//            constranit.constant = imageHeight;
//
//           
//        }
//        
//    }
    [self layoutIfNeeded];
  
}

/**
 *  cell手势冲突问题解决
 *
 */
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
   
    if ([touch.view.superview isKindOfClass:[UICollectionViewCell class]]) {
        
        return NO;
    }
    return YES;
}
@end
