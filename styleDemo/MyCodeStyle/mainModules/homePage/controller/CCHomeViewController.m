//
//  CCHomeViewController.m
//  MyCodeStyle
//
//  Created by mrc on 2017/2/24.
//  Copyright © 2017年 mrc. All rights reserved.
//

#import "CCHomeViewController.h"
#import "MTMainTitleView.h"
#import "MTSaysayCell.h"
#import "ESSaySayModdel.h"
@interface CCHomeViewController ()<UITableViewDataSource,UITableViewDelegate>{
  
    ESSaySayModdel *saysayModel;

}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) MTMainTitleView *mainHeadView;
@end

@implementation CCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"首页";
    [self setupModels];
    [self setupTableView];
    //self.tableView.tableHeaderView = self.mainHeadView;
}
-(void)setupModels{
    
  saysayModel = [ESSaySayModdel modelWithObserve:self cache:@"main"];

}
-(void)setupTableView{
    
    self.tableView.tableHeaderView = self.mainHeadView;
    [self.tableView registerNib:[UINib nibWithNibName:@"MTSaysayCell" bundle:nil] forCellReuseIdentifier:@"SS"];
    
}

-(MTMainTitleView *)mainHeadView{

    if (!_mainHeadView) {
        
        MTMainTitleView *mainHeadView = [[MTMainTitleView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth*0.8)];
//        mainHeadView.rollView.action = ^(NSInteger index){[self enterTopicAtIndex:index];};
//        mainHeadView.rollView.items = [self creatRollingView];
//        mainHeadView.categoryView.action = ^(NSInteger index){[self enterCategoryAtIndex:index];};
//        mainHeadView.categoryView.items = [self categoryItems];
//        [mainHeadView.speakButton addTarget:self action:@selector(pushToComment:) forControlEvents:UIControlEventTouchUpInside];
//        [mainHeadView.moreButton addTarget:self action:@selector(pushToTopicList:) forControlEvents:UIControlEventTouchUpInside];
        mainHeadView.backgroundColor = RGB(230, 230, 230);
        _mainHeadView = mainHeadView;
    }
    
    return _mainHeadView;

}
////创建滚动视图元素
//-(NSArray *)creatRollingView{
//    
//    NSMutableArray *elements = [NSMutableArray array];
//    
//    UIView *(^initView)(TopicInfo *info) = ^UIView *(TopicInfo *info){
//        
//        MTTopicTableViewCell *rollView = [[[NSBundle mainBundle] loadNibNamed:@"MTTopicTableViewCell" owner:self options:nil] firstObject];
//        rollView.backgroundColor = RGB(255, 255, 255);
//        rollView.bottomLine.hidden = YES;
//        rollView.titleLabel.text = info.Title;
//        rollView.contentLabel.text = info.Description;
//        rollView.totalLabel.text = nil;
//        NSString *imagePath = [ESPhotoPathSpliter splitPathWithImageId:info.BgImageId size:CGSizeMake(400, 0)];
//        [rollView.iconImageView sd_setImageWithURL:URL(imagePath) placeholderImage:IMG(@"es_hold_0")];
//        return rollView;
//    };
//    
//    for (TopicInfo *info in topicModel.Data){
//        
//        [elements addObject:initView(info)];
//        
//    }
//    if (elements.count > 0) {
//        
//        _mainHeadView.rollView.firstItem = initView(topicModel.Data.lastObject);
//        _mainHeadView.rollView.lastItem = initView(topicModel.Data.firstObject);
//    }
//    
//    return elements;
//    
//    
//}
#pragma mark ------ dataSource and delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return saysayModel.Data.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SaySayInfo *info = saysayModel.Data[indexPath.row];
    return info.height.floatValue;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MTSaysayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SS"];
    cell.data = saysayModel.Data[indexPath.row];
    return cell;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
