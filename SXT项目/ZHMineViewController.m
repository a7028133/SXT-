//
//  ZHMineViewController.m
//  SXT项目
//
//  Created by ma c on 16/6/22.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHMineViewController.h"
#import "MAsonry.h"
#import "ZHTableViewCell.h"
#import "ZHregisterVC.h"
#import "ZHLonginVC.h"

@interface ZHMineViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UIImageView *bgImageView;
@property(nonatomic,strong)UILabel *marginLab;
@property(nonatomic,strong)UITableView *myTableView;
@property(nonatomic,strong)UIButton *loginBtn;
@property(nonatomic,strong)UIButton *registBtn;
@property(nonatomic,strong)NSArray *arr;
@property(nonatomic,strong)NSMutableArray *MutablArr;
//登陆成功后显示的界面
@property(nonatomic,strong)UIButton *quitBtn;
@property(nonatomic,strong)UIButton *headImageBtn;
@property(nonatomic,strong)UILabel *IDLab;
@property(nonatomic,strong)UILabel *VIPLab;
@end

@implementation ZHMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    self.MutablArr = [NSMutableArray array];
    for (NSDictionary *dic in self.arr) {
        [self.MutablArr addObject:dic];
    }
    
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.marginLab];
    [self.view addSubview:self.myTableView];
    
    [self.bgImageView addSubview:self.loginBtn];
    [self.bgImageView addSubview:self.registBtn];
    [self.view addSubview:self.quitBtn];
    [self.view addSubview:self.headImageBtn];
    [self.view addSubview:self.IDLab];
    [self.view addSubview:self.VIPLab];
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"ErrorMessage"]isEqualToString:@"登陆成功"]) {
        self.quitBtn.hidden = NO;
        self.headImageBtn.hidden = NO;
        self.IDLab.hidden = NO;
        self.VIPLab.hidden = NO;
        self.loginBtn.hidden = YES;
        self.registBtn.hidden = YES;
    }
    else{
        self.quitBtn.hidden = YES;
        self.headImageBtn.hidden = YES;
        self.IDLab.hidden = YES;
        self.VIPLab.hidden = YES;
        self.loginBtn.hidden = NO;
        self.registBtn.hidden = NO;
    }
    
    
    
    [self makeConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark 约束
-(void)makeConstraints
{
    __weak typeof(self)weakSelf  =  self;
    [weakSelf.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.view.mas_top);
        make.right.mas_equalTo(weakSelf.view.mas_right);
        make.left.mas_equalTo(weakSelf.view.mas_left);
        make.height.mas_equalTo(127);
    }];
    
    [weakSelf.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.bgImageView.mas_top).offset(55);
        make.bottom.equalTo(weakSelf.bgImageView.mas_bottom).offset(-55);
        make.left.equalTo(weakSelf.bgImageView.mas_left).offset(107);
        make.width.equalTo(@40);
    }];
    
    [weakSelf.registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.bgImageView.mas_top).offset(55);
        make.bottom.equalTo(weakSelf.bgImageView.mas_bottom).offset(-55);
        make.right.equalTo(weakSelf.bgImageView.mas_right).offset(-107);
        make.width.equalTo(@40);
    }];
    
    [weakSelf.marginLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.bgImageView.mas_bottom);
        make.right.mas_equalTo(weakSelf.view.mas_right);
        make.left.mas_equalTo(weakSelf.view.mas_left);
        make.height.mas_equalTo(35);
    }];
    
    [weakSelf.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.marginLab.mas_bottom);
        make.right.mas_equalTo(weakSelf.view.mas_right);
        make.left.mas_equalTo(weakSelf.view.mas_left);
        make.bottom.mas_equalTo(weakSelf.view.mas_bottom).offset(20);
    }];
    
    //退出登陆按钮的约束
    [weakSelf.quitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(45);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-50);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(50);
        make.bottom.mas_equalTo(weakSelf.view.mas_bottom).offset(-42.5);
    }];
    
    [weakSelf.headImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(77.5);
        make.width.mas_equalTo(77.5);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(55);
        make.top.mas_equalTo(weakSelf.view.mas_top).offset(25);
    }];
    
    [weakSelf.IDLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(16);
        make.width.mas_equalTo(100);
        make.left.mas_equalTo(weakSelf.headImageBtn.mas_right).offset(35);
        make.top.mas_equalTo(weakSelf.view.mas_top).offset(37);
    }];
    
    [weakSelf.VIPLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(16);
        make.width.mas_equalTo(17*4+4);
        make.left.mas_equalTo(weakSelf.headImageBtn.mas_right).offset(35);
        make.top.mas_equalTo(weakSelf.IDLab.mas_bottom).offset(20);
    }];
    
    
}

#pragma mark 自定义方法
-(void)loginBtnAction
{
    self.loginBtn.alpha=1.0;
    [UIView animateWithDuration:0.2 animations:^{
        self.loginBtn.alpha=0.1;
    } completion:^(BOOL finished) {
        self.loginBtn.alpha=1.0;
    }];
    
    ZHLonginVC *logVC = [[ZHLonginVC alloc]init];
    logVC.block =^(){
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"ErrorMessage"]isEqualToString:@"登陆成功"]) {
            self.quitBtn.hidden = NO;
            self.headImageBtn.hidden = NO;
            self.loginBtn.hidden = YES;
            self.registBtn.hidden = YES;
            self.IDLab.hidden = NO;
            self.VIPLab.hidden = NO;
            self.IDLab.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"MemberId"];
        }
        else
        {
            
        }
        
        
//        self.IDLab.hidden = NO;
//        self.VIPLab.hidden = NO;
        
        [self.myTableView reloadData];
    } ;
    [self.navigationController pushViewController:logVC animated:YES];
}

-(void)registBtnAction
{
    self.registBtn.alpha=1.0;
    [UIView animateWithDuration:0.2 animations:^{
        self.registBtn.alpha=0.1;
    } completion:^(BOOL finished) {
        self.registBtn.alpha=1.0;
    }];
    
    ZHregisterVC *reVC = [[ZHregisterVC alloc]init];
    [self.navigationController pushViewController:reVC animated:YES];
}

-(void)quitBtnActoin
{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"ErrorMessage"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"MemberId"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"MemberLvl"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"MemberName"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"result"];
    
    self.quitBtn.hidden = YES;
    self.headImageBtn.hidden = YES;
    self.IDLab.hidden = YES;
    self.VIPLab.hidden = YES;
    self.loginBtn.hidden = NO;
    self.registBtn.hidden = NO;
    
    [self.myTableView reloadData];
}


#pragma mark    UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"ErrorMessage"]isEqualToString:@"登陆成功"]) {
        return 6;
    }
    else{
        return 4;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZHTableViewCell *cell = [ZHTableViewCell cellInTableView:tableView atIndexPath:indexPath withDic:self.MutablArr[indexPath.row]];
    
    return cell;
}

#pragma mark
#pragma mark 懒加载
-(UIImageView *)bgImageView
{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]init];
        _bgImageView.image = [UIImage imageNamed:@"我的背景"];
        _bgImageView.userInteractionEnabled = YES ;
    }
    return  _bgImageView;
}
-(UILabel *)marginLab
{
    if (!_marginLab) {
        _marginLab = [[UILabel alloc]init];
        [_marginLab setBackgroundColor:RBG(245, 245, 245)];
    }
    return _marginLab;
}

-(UITableView *)myTableView
{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc]init];
        _myTableView.bounces = NO ;
        _myTableView.backgroundColor = RBG(245, 245, 245);
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.rowHeight = 44;
        
    }
    return _myTableView;
}

-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _loginBtn = [[UIButton alloc]init];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.titleLabel.textColor = [UIColor whiteColor];
        [_loginBtn addTarget:self action:@selector(loginBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}
-(UIButton *)registBtn{
    if (!_registBtn) {
        _registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _registBtn = [[UIButton alloc]init];
        [_registBtn setTitle:@"注册" forState:UIControlStateNormal];
        _registBtn.titleLabel.textColor = [UIColor whiteColor];
        [_registBtn addTarget:self action:@selector(registBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registBtn;
}

-(NSArray *)arr
{
    if (!_arr) {
        _arr = [NSArray array];
        _arr = @[
                 @{@"headImage":@"我的界面我的收藏图标",
                   @"title":@"我的收藏",
                   @"tailImage":@"下一步"},
                 @{@"headImage":@"我的界面意见反馈图标",
                   @"title":@"意见反馈",
                   @"tailImage":@"下一步"},
                 @{@"headImage":@"我的界面关于我们图标",
                   @"title":@"关于我们",
                   @"tailImage":@"下一步"},
                 @{@"headImage":@"我的界面客服热线图标",
                   @"title":@"客服热线",
                   @"tailImage":@"客服电话号码"},
                 @{@"headImage":@"我的界面我的优惠券图标",
                   @"title":@"我的优惠券",
                   @"tailImage":@"下一步"},
                 @{@"headImage":@"我的界面邀请好友图标",
                   @"title":@"邀请好友,立刻赚钱",
                   @"tailImage":@"下一步"},
                 
                 ];
        
    }
    return _arr;
}

-(NSMutableArray *)MutablArr
{
    if (!_MutablArr) {
        _MutablArr = [NSMutableArray arrayWithCapacity:6];
        
    }
    return _MutablArr;
}
-(UIButton *)quitBtn
{
    if (!_quitBtn) {
        _quitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _quitBtn = [[UIButton alloc]init];
        [_quitBtn setTitle:@"退出登陆" forState:UIControlStateNormal];
        _quitBtn.backgroundColor = RBG(47, 203, 247);
        _quitBtn.layer.cornerRadius = 10;
        [_quitBtn addTarget:self action:@selector(quitBtnActoin) forControlEvents:UIControlEventTouchUpInside];
        _quitBtn.layer.masksToBounds = YES;
    }
    return _quitBtn;
}

-(UIButton *)headImageBtn
{
    if (!_headImageBtn) {
        _headImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _headImageBtn = [[UIButton alloc]init];
        [_headImageBtn setImage:[UIImage imageNamed:@"牛.jpg"] forState:UIControlStateNormal];
        _headImageBtn.layer.cornerRadius = 36;
        [_headImageBtn setBackgroundColor:[UIColor redColor]];
        _headImageBtn.layer.masksToBounds = YES;
    }
    return _headImageBtn;
}

-(UILabel *)IDLab
{
    if (!_IDLab) {
        _IDLab = [[UILabel alloc]init];
        _IDLab.backgroundColor = [UIColor clearColor];
        _IDLab.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"MemberId"];
    }
    return _IDLab;
}
//
-(UILabel *)VIPLab
{
    if (!_VIPLab) {
        _VIPLab = [[UILabel alloc]init];
        _VIPLab.backgroundColor = [UIColor clearColor];
        _VIPLab.textColor = [UIColor whiteColor];
        _VIPLab.text = @"普通会员";
    }
    return _VIPLab;
}
@end
