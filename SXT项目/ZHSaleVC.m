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
#import "ZHLeftTableViewModel.h"
#import "ZHDoubleTableView.h"

@interface ZHSaleVC ()<SDCycleScrollViewDelegate>
@property(nonatomic,strong)NSMutableArray *mArr;    //存储轮播广告的数据模型
@property(nonatomic,strong)UIScrollView *backScrollView;    //底部背景ScrollView
@property(nonatomic,strong)SDCycleScrollView *ADScrrollView; //首页广告轮播图
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)UIScrollView *tableScrollView;   //切换两个tableView的scrollView
@property(nonatomic,strong)NSMutableArray *imagesURLStringsMArr;    //广告轮播图图片数据
@property(nonatomic,strong)NSMutableArray *titlesMArr;  //广告轮播图标题数据
@property(nonatomic,strong)NSMutableArray *leftTableViewModelArr;
@end

@implementation ZHSaleVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    
    
    self.titlesMArr = [NSMutableArray array];
    self.imagesURLStringsMArr = [NSMutableArray array];
    
    [self.view addSubview:self.backScrollView];
    
    [self.backScrollView addSubview:self.ADScrrollView];
    [self.backScrollView addSubview:self.leftBtn];
    [self.backScrollView addSubview:self.rightBtn];
    
    ZHDoubleTableView *tableViewVC = [[ZHDoubleTableView alloc]initWithFrame:CGRectMake(0, 310, WIDTH, 1000)];
    [self.view addSubview:tableViewVC];
    
    [self requestADModel];  //轮播广告数据的请求
    [self requestLeftTableViewModel];
}

//请求广告数据
-(void)requestADModel
{
    NSString *url = @"http://123.57.141.249:8080/beautalk/appHome/appHome.do";
    [ZHCycleModelRequestVC cycleModelRequestGETWithURL:url withParams:nil withSucess:^(id responseObject) {
        NSArray *arr = (NSArray *)responseObject;
        self.mArr = [NSMutableArray arrayWithCapacity:arr.count];
        for (NSDictionary *dic in arr) {
            [self.imagesURLStringsMArr addObject:dic[@"ImgView"]];
            [self.titlesMArr addObject:dic[@"CommodityText"]];
        }
        self.ADScrrollView.imageURLStringsGroup = self.imagesURLStringsMArr;
        self.ADScrrollView.titlesGroup = self.titlesMArr;
    } withFail:^(NSError *error) {
        if (error) {
            NSLog(@"ERROR:%@",error.localizedDescription);
        }
    }];
}

//左边tableView数据请求的方法
-(void)requestLeftTableViewModel
{
    NSString *url = @"http://123.57.141.249:8080/beautalk/appActivity/appHomeGoodsList.do";
    [ZHSaleVC requestGETWithURL:url withParams:nil withSucess:^(id responseObject) {
        NSArray *arr = (NSArray *)responseObject;
        
        for (NSDictionary *dic in arr) {
            ZHLeftTableViewModel *model = [[ZHLeftTableViewModel alloc]initWithDictionary:dic];
            [self.leftTableViewModelArr addObject:model];
        }
        
        
        
        NSLog(@"arr:%@",arr);
    } withFail:^(NSError *error) {
        if (error) {
            NSLog(@"error:%@",error.localizedDescription);
        }
        ;
    } ];
    
}


-(void)leftBtnAction
{
    self.leftBtn.userInteractionEnabled = NO;
    self.rightBtn.userInteractionEnabled = YES;
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
}

-(void)rightBtnAction
{
    self.rightBtn.userInteractionEnabled = NO;
    self.leftBtn.userInteractionEnabled = YES;
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
}



#pragma mark
#pragma mark 懒加载

-(NSMutableArray *)mArr
{
    if(!_mArr)
    {
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
        [_leftBtn setFrame:CGRectMake(0, 230, WIDTH/2, 50)];
        //未选中
        //一开始，左边被选中，且不能进行交互
        self.leftBtn.userInteractionEnabled = NO;
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
-(NSMutableArray *)leftTableViewModelArr
{
    if (!_leftTableViewModelArr) {
        _leftTableViewModelArr = [NSMutableArray array];
    }
    return _leftTableViewModelArr;
}

@end
