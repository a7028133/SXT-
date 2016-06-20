//
//  ZHMeViewController.m
//  SXT项目
//
//  Created by ma c on 16/6/16.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHMeViewController.h"
#import "ZHInputView.h"
#import "ZHMeUIView.h"
#import "MAsonry.h"

@interface ZHMeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UIImageView *bgImageView;
@property(nonatomic,strong)UILabel *marginLab;
@property(nonatomic,strong)UITableView *myTableView;
@property(nonatomic,strong)UIButton *loginBtn;
@property(nonatomic,strong)UIButton *registBtn;
@property(nonatomic,strong)NSArray *arr;
@end

@implementation ZHMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.marginLab];
    [self.view addSubview:self.myTableView];

    [self.bgImageView addSubview:self.loginBtn];
    [self.bgImageView addSubview:self.registBtn];
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
}

#pragma mark 自定义方法
-(void)loginBtnAction
{
    
}

-(void)registBtnAction
{
    
}

#pragma mark    UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

#pragma mark
#pragma mark 懒加载
-(UIImageView *)bgImageView
{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]init];
        _bgImageView.image = [UIImage imageNamed:@"我的背景"];
        
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
        
    }
    return _myTableView;
}

-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn = [[UIButton alloc]init];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.titleLabel.textColor = [UIColor whiteColor];
        [_loginBtn addTarget:self action:@selector(loginBtnAction) forControlEvents:UIControlEventTouchUpOutside];
    }
    return _loginBtn;
}
-(UIButton *)registBtn{
    if (!_registBtn) {
        _registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _registBtn = [[UIButton alloc]init];
        [_registBtn setTitle:@"注册" forState:UIControlStateNormal];
        _registBtn.titleLabel.textColor = [UIColor whiteColor];
        [_registBtn addTarget:self action:@selector(registBtnAction) forControlEvents:UIControlEventTouchUpOutside];
    }
    return _registBtn;
}

-(NSArray *)arr
{
    if (!_arr) {
        _arr = [NSArray array];
        _arr = @[
                  @{@"我的界面关于我们图标":@"关于我们"},
                  @{@"我的界面客服热线图标":@"客服热线"},
                  @{@"我的界面我的收藏图标":@"我的收藏"},
                  @{@"我的界面我的优惠券图标":@"我的优惠券"},
                  @{@"我的界面邀请好友图标":@"邀请好友,立刻赚钱"},
                  @{@"我的界面意见反馈图标":@"意见反馈"}
                 ];
    }
    return _arr;
}
@end
