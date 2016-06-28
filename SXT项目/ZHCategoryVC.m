//
//  ZHCategoryVC.m
//  SXT项目
//
//  Created by ma c on 16/6/27.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHCategoryVC.h"
#import "ZHEffectModel.h"
#import "ZHFaceModel.h"
#import "ZHBodyModel.h"
#import "ZHBaseCollectionView.h"

#define URL_ONE  @"http://123.57.141.249:8080/beautalk/appBrandareatype/findBrandareatype.do"
#define URL_TWO  @"http://123.57.141.249:8080/beautalk/appBrandarea/asianBrand.do"
#define URL_THREE  @"http://123.57.141.249:8080/beautalk/appBrandareanew/findBrandareanew.do"

@interface ZHCategoryVC ()
@property(nonatomic,strong)NSMutableArray *effectMArr;
@property(nonatomic,strong)NSMutableArray *faceMArr;
@property(nonatomic,strong)NSMutableArray *bodyMArr;

@property(nonatomic,strong)ZHBaseCollectionView *myCollectionView;

@end

@implementation ZHCategoryVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor cyanColor]];
    
    [self.view addSubview:self.myCollectionView];
    
    [self requestGETCollectionModelWithURL:URL_ONE withIndex:1];
    [self requestGETCollectionModelWithURL:URL_TWO withIndex:2];
    [self requestGETCollectionModelWithURL:URL_THREE withIndex:3];
    
}

-(void)viewWillLayoutSubviews
{
    __weak typeof(self)weakSelf = self;
    [self.myCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

#pragma mark  自定义方法
//分类中三个section的内容请求
-(void)requestGETCollectionModelWithURL:(NSString *)url withIndex:(NSUInteger )num
{
    __weak typeof(self)weakSelf = self;
    [ZHCategoryVC requestGETWithURL:url withParams:nil withSucess:^(id responseObject)
    {
        if (num == 1) {
            
            NSArray *arr = (NSArray *)responseObject;
            weakSelf.effectMArr  = [NSMutableArray arrayWithCapacity:arr.count];
            for (NSDictionary *dic in arr) {
                ZHEffectModel *model = [[ZHEffectModel alloc]initWithDictionary:dic];
                [weakSelf.effectMArr addObject:model];
            }
            weakSelf.myCollectionView.effectArr = weakSelf.effectMArr;
            [weakSelf.myCollectionView reloadData];
        }
        else if(num == 2)
        {
            NSArray *arr = (NSArray *)responseObject;
//            NSLog(@"脸部：%@",responseObject);
            self.faceMArr  = [NSMutableArray arrayWithCapacity:arr.count];
            for (NSDictionary *dic in arr) {
                ZHFaceModel *model = [[ZHFaceModel alloc]initWithDictionary:dic];
                [self.faceMArr addObject:model];
            }
            weakSelf.myCollectionView.faceArr = weakSelf.faceMArr;
            [weakSelf.myCollectionView reloadData];
        }
        else
        {
            NSArray *arr = (NSArray *)responseObject;
            self.bodyMArr  = [NSMutableArray arrayWithCapacity:arr.count];
            for (NSDictionary *dic in arr) {
                ZHBodyModel *model = [[ZHBodyModel alloc]initWithDictionary:dic];
                [self.bodyMArr addObject:model];
              }
            weakSelf.myCollectionView.bodyArr = weakSelf.bodyMArr;
            [weakSelf.myCollectionView reloadData];
        }
    } withFail:^(NSError *error) {
        if (error) {
            NSLog(@"error:%@",error.localizedDescription);
        }
    } ];
}

#pragma mark 懒加载
-(NSMutableArray *)effectMArr
{
    if (!_effectMArr) {
        _effectMArr = [NSMutableArray array];
    }
    return _effectMArr;
}

-(NSMutableArray *)faceMArr
{
    if (!_faceMArr) {
        _faceMArr = [NSMutableArray array];
    }
    return _faceMArr;
}

-(NSMutableArray *)bodyMArr
{
    if (!_bodyMArr) {
        _bodyMArr = [NSMutableArray array];
    }
    return _bodyMArr;
}

-(ZHBaseCollectionView *)myCollectionView
{
    if (!_myCollectionView) {
        UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc]init];
        NSInteger itemWidth = (WIDTH-3)/4;
        flowLayout.itemSize = CGSizeMake(itemWidth, itemWidth);
        flowLayout.minimumLineSpacing = 1;
        flowLayout.minimumInteritemSpacing = 0;
        //分段的内边距
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 1, 0);
        //section头
        flowLayout.headerReferenceSize = CGSizeMake(0, 35);
        
        _myCollectionView = [[ZHBaseCollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:flowLayout];
        [_myCollectionView setBackgroundColor:RBG(245, 245, 245)];
        
        
    }
    return _myCollectionView;
}
@end
