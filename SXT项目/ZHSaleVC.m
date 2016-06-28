//
//  ZHSaleVC.m
//  SXT项目
//
//  Created by ma c on 16/6/22.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHSaleVC.h"
#import "ZHCycleModelRequestVC.h"
#import "SDCycleScrollView.h"

#import "ZHBaseTableView.h"
#import "ZHLeftTableViewModel.h"
#import "ZHRightTableViewModel.h"

@interface ZHSaleVC ()<SDCycleScrollViewDelegate,UIScrollViewDelegate>
@property(nonatomic,strong)NSMutableArray *mArr;    //存储轮播广告的数据模型
@property(nonatomic,strong)UIScrollView *backScrollView;    //底部背景ScrollView
@property(nonatomic,strong)SDCycleScrollView *ADScrrollView; //首页广告轮播图
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)NSMutableArray *imagesURLStringsMArr;    //广告轮播图图片数据
@property(nonatomic,strong)NSMutableArray *titlesMArr;  //广告轮播图标题数据
@property(nonatomic,strong)NSMutableArray *leftTableViewModelArr;
@property(nonatomic,strong)NSMutableArray *rightTableViewModelArr;

@property(nonatomic,strong)ZHBaseTableView *leftTableView;
@property(nonatomic,strong)ZHBaseTableView *rightTableView;
@end

@implementation ZHSaleVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"限时特卖界面搜索按钮"] forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0, 0, 35, 35)];
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -30);
    [button addTarget:self action:@selector(leftBarButtonAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    self.titlesMArr = [NSMutableArray array];
    self.imagesURLStringsMArr = [NSMutableArray array];
    
    [self.view addSubview:self.backScrollView];
    
    [self.backScrollView addSubview:self.ADScrrollView];
    
    [self.backScrollView addSubview:self.leftTableView];
    [self.backScrollView addSubview:self.rightTableView];
    [self.backScrollView addSubview:self.leftBtn];
    [self.backScrollView addSubview:self.rightBtn];
    
    [self requestADModel];  //轮播广告数据的请求
    [self requestLeftTableViewModel];
    [self requestRightTableViewModel];
}

//请求广告数据
-(void)requestADModel
{
    __weak typeof(self) weakSelf = self;
    NSString *url = @"http://123.57.141.249:8080/beautalk/appHome/appHome.do";
    [ZHCycleModelRequestVC cycleModelRequestGETWithURL:url withParams:nil withSucess:^(id responseObject) {
        NSArray *arr = (NSArray *)responseObject;
        weakSelf.mArr = [NSMutableArray arrayWithCapacity:arr.count];
        for (NSDictionary *dic in arr) {
            [weakSelf.imagesURLStringsMArr addObject:dic[@"ImgView"]];
            [weakSelf.titlesMArr addObject:dic[@"CommodityText"]];
        }
        weakSelf.ADScrrollView.imageURLStringsGroup = weakSelf.imagesURLStringsMArr;
        weakSelf.ADScrrollView.titlesGroup = weakSelf.titlesMArr;
    } withFail:^(NSError *error) {
        if (error) {
            NSLog(@"ERROR:%@",error.localizedDescription);
        }
    }];
}

//左边tableView数据请求的方法
-(void)requestLeftTableViewModel
{
    __weak typeof(self) weakSelf = self;
    NSString *url = @"http://123.57.141.249:8080/beautalk/appActivity/appHomeGoodsList.do";
    [ZHSaleVC requestGETWithURL:url withParams:nil withSucess:^(id responseObject) {
        NSArray *arr = (NSArray *)responseObject;
        
        for (NSDictionary *dic in arr) {
            ZHLeftTableViewModel *model = [[ZHLeftTableViewModel alloc]initWithDictionary:dic];
            [weakSelf.leftTableViewModelArr addObject:model];
        }

        weakSelf.leftTableView.singleListArray = weakSelf.leftTableViewModelArr;
        //修改scrol的滑动范围
        weakSelf.backScrollView.contentSize = CGSizeMake(0, arr.count*170+280);
        //改变table的大小，使table不能进行滚动
        CGRect singleRect = weakSelf.leftTableView.frame;
        singleRect.size.height = arr.count * 170;
        _leftTableView.frame = singleRect;
        [weakSelf.leftTableView reloadData];
 
    } withFail:^(NSError *error) {
        if (error) {
            NSLog(@"error:%@",error.localizedDescription);
        }
    } ];
    
}

//右边tableView数据请求的方法
-(void)requestRightTableViewModel
{
    __weak typeof(self) weakSelf = self;
    NSString *url = @"http://123.57.141.249:8080/beautalk/appActivity/appActivityList.do";
    [ZHSaleVC requestGETWithURL:url withParams:nil withSucess:^(id responseObject) {
        NSArray *arr = (NSArray *)responseObject;
        for (NSDictionary *dic in arr) {
            ZHRightTableViewModel *model = [[ZHRightTableViewModel alloc]initWithDictionary:dic];
            [weakSelf.rightTableViewModelArr addObject:model];
        }

        weakSelf.rightTableView.groupBuyListArray = weakSelf.rightTableViewModelArr;
        CGRect groupRect = _rightTableView.frame;
        groupRect.size.height = arr.count * 175;
        _rightTableView.frame = groupRect;
        [weakSelf.rightTableView reloadData];

    } withFail:^(NSError *error) {
        if (error) {
            NSLog(@"error:%@",error.localizedDescription);
        }
    } ];
}

-(void)leftBtnAction
{
//    self.leftBtn.userInteractionEnabled = NO;
//    self.rightBtn.userInteractionEnabled = YES;
    //做按钮被选中
    NSDictionary *leftDic = @{
                              NSForegroundColorAttributeName: RBG(250, 79 , 1)
                              };
    NSString *leftText = @"新品团购";
    NSMutableAttributedString *leftAString = [[NSMutableAttributedString alloc] initWithString:leftText];
    [leftAString addAttributes:leftDic range:NSMakeRange(0, leftText.length)];
    [self.leftBtn setAttributedTitle:leftAString forState:UIControlStateNormal];
    
    [self.leftBtn setImage:[UIImage imageNamed:@"新品团选中"] forState:UIControlStateNormal];
    
    //右按钮不被选中
    NSDictionary *rigthDic = @{
                               NSForegroundColorAttributeName: RBG(40, 181 , 244)
                               };
    NSString *rightText = @"品牌团购";
    NSMutableAttributedString *rigthAString = [[NSMutableAttributedString alloc] initWithString:rightText];
    [rigthAString addAttributes:rigthDic range:NSMakeRange(0, rightText.length)];
    [self.rightBtn setAttributedTitle:rigthAString forState:UIControlStateNormal];
    [self.rightBtn setImage:[UIImage imageNamed:@"品牌团未选中"] forState:UIControlStateNormal];
    
    self.backScrollView.contentSize = CGSizeMake(0, _leftTableView.singleListArray.count*170+280);
    [UIView animateWithDuration:0.5 animations:^{
        CGRect singleRect = self.leftTableView.frame;
        singleRect.origin.x = 0;
        self.leftTableView.frame = singleRect;
        
        CGRect groupRect = self.rightTableView.frame;
        groupRect.origin.x = WIDTH;
        self.rightTableView.frame = groupRect;
    }];
}

-(void)rightBtnAction
{
//    self.rightBtn.userInteractionEnabled = NO;
//    self.leftBtn.userInteractionEnabled = YES;
    //右按钮选中
    NSDictionary *rigthDic = @{
                               NSForegroundColorAttributeName: RBG(250, 79 , 1)
                               };
    NSString *rightText = @"品牌团购";
    NSMutableAttributedString *rigthAString = [[NSMutableAttributedString alloc] initWithString:rightText];
    [rigthAString addAttributes:rigthDic range:NSMakeRange(0, rightText.length)];
    [_rightBtn setAttributedTitle:rigthAString forState:UIControlStateNormal];
    [_rightBtn setImage:[UIImage imageNamed:@"品牌团选中"] forState:UIControlStateNormal];
    
    
    //左按钮不被选中
    NSString *leftText = @"新品团购";
    NSDictionary *leftDic = @{
                              NSForegroundColorAttributeName: RBG(40, 181 , 244)
                              };
    NSMutableAttributedString *leftAString = [[NSMutableAttributedString alloc] initWithString:leftText];
    [leftAString addAttributes:leftDic range:NSMakeRange(0, leftText.length)];
    [_leftBtn setAttributedTitle:leftAString forState:UIControlStateNormal];
    [_leftBtn setImage:[UIImage imageNamed:@"新品团未选中"] forState:UIControlStateNormal];
    
    
    self.backScrollView.contentSize = CGSizeMake(0, self.rightTableView.groupBuyListArray.count*175+280);
    [UIView animateWithDuration:0.5 animations:^{
        CGRect singleRect = self.leftTableView.frame;
        singleRect.origin.x = WIDTH;
        self.leftTableView.frame = singleRect;
        
        CGRect groupRect = self.rightTableView.frame;
        groupRect.origin.x = 0;
        self.rightTableView.frame = groupRect;
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if([scrollView isEqual:self.backScrollView])
    {
        if (scrollView.contentOffset.y > 230) {
            CGRect leftBtbY = self.leftBtn.frame;
            leftBtbY.origin.y = scrollView.contentOffset.y;
            self.leftBtn.frame= leftBtbY;
            
            
            CGRect rightBtbY = self.rightBtn.frame;
            rightBtbY.origin.y = scrollView.contentOffset.y;
            self.rightBtn.frame = rightBtbY;
        }
        else{
            self.leftBtn.frame = CGRectMake(0, 230, WIDTH/2, 50);
            self.rightBtn.frame = CGRectMake(WIDTH/2, 230, WIDTH/2, 50);
        }
    }
}

-(void)leftBarButtonAction
{
    
}


#pragma mark
#pragma mark 懒加载

-(NSMutableArray *)mArr
{
    if(!_mArr){
        _mArr = [NSMutableArray array];
    }
    return _mArr;
}

-(UIScrollView *)backScrollView
{
    if (!_backScrollView) {
        _backScrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
        _backScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1200);
        _backScrollView.backgroundColor = [UIColor whiteColor];
        _backScrollView.delegate =self;
    }
    return _backScrollView;
}
-(SDCycleScrollView *)ADScrrollView
{
    if (!_ADScrrollView) {
        _ADScrrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, WIDTH, 230) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
        _ADScrrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _ADScrrollView.currentPageDotColor = [UIColor redColor];
    }
    return _ADScrrollView;
}

-(UIButton *)leftBtn
{
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtn = [[UIButton alloc]init];
        [_leftBtn setBackgroundColor:[UIColor whiteColor]];
        [_leftBtn setFrame:CGRectMake(0, 230, WIDTH/2, 50)];
        //未选中
        //一开始，左边被选中，且不能进行交互
//        self.leftBtn.userInteractionEnabled = NO;
        NSString *text = @"新品团购";
        NSDictionary *dic1 = @{
                               //选中 橘色
                              NSForegroundColorAttributeName: RBG(250, 79 , 1)
                              };
        NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc] initWithString:text];
        [attributedString1 addAttributes:dic1 range:NSMakeRange(0, text.length)];
        [_leftBtn setAttributedTitle:attributedString1 forState:UIControlStateNormal];
        [_leftBtn setImage:[UIImage imageNamed:@"新品团选中"] forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}

-(UIButton *)rightBtn
{
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn = [[UIButton alloc]init];
        [_rightBtn setBackgroundColor:[UIColor whiteColor]];
        [_rightBtn setFrame:CGRectMake(WIDTH/2, 230, WIDTH/2, 50)];
        NSDictionary *dic = @{
                              NSForegroundColorAttributeName: RBG(40, 181 , 244)
                              };
        NSString *text = @"品牌团购";
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
        [attributedString addAttributes:dic range:NSMakeRange(0, text.length)];
        [self.rightBtn setAttributedTitle:attributedString forState:UIControlStateNormal];
        
        [self.rightBtn setImage:[UIImage imageNamed:@"品牌团未选中"] forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}

//单品团购table
- (ZHBaseTableView *)leftTableView{
    if (!_leftTableView) {
        _leftTableView = [[ZHBaseTableView alloc]initWithFrame:CGRectMake(0, 280, WIDTH, 0) style:(UITableViewStylePlain)];
        _leftTableView.isSingleTableView = YES;
        _leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        __weak typeof(self) weakSelf = self;
//        _leftTableView.singleBlock = ^(NSString *goodsID){
//            SXTDetailsViewController *detailsViewControll = [[SXTDetailsViewController alloc]init];
//            detailsViewControll.goodsID = goodsID;
//            detailsViewControll.hidesBottomBarWhenPushed = YES;
//            [weakSelf.navigationController pushViewController:detailsViewControll animated:YES];
            //            weakSelf.tabBarController.tabBar.hidden = YES;
//        };
    }
    return _leftTableView;
}
//品牌团购table
- (ZHBaseTableView *)rightTableView{
    if (!_rightTableView) {
        _rightTableView = [[ZHBaseTableView alloc]initWithFrame:CGRectMake(WIDTH, 280, WIDTH, 0) style:(UITableViewStylePlain)];
        _rightTableView.isSingleTableView = NO;
        _rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        WS(weakSelf);
//        _groupBuyTableView.groupBlock = ^(NSString *groupId){
//            SXTClassListViewController *classList = [[SXTClassListViewController alloc]init];
//            classList.idDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"appGgroupon/appGrounpGoodsList.do",@"URL",groupId,@"ID",@"GrouponId",@"keyword", nil];
//            [weakSelf.navigationController pushViewController:classList animated:YES];
//        };
    }
    return _rightTableView;
}



-(NSMutableArray *)leftTableViewModelArr
{
    if (!_leftTableViewModelArr) {
        _leftTableViewModelArr = [NSMutableArray array];
    }
    return _leftTableViewModelArr;
}

-(NSMutableArray *)rightTableViewModelArr
{
    if (!_rightTableViewModelArr) {
        _rightTableViewModelArr = [NSMutableArray array];
    }
    return _rightTableViewModelArr;
}

@end
