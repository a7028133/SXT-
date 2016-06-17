//
//  ZHRegister.m
//  SXT项目
//
//  Created by ma c on 16/6/16.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHRegister.h"
#import "Masonry.h"

@interface ZHRegister()
@property(nonatomic,strong)UILabel *backLael;
@property(nonatomic,strong)UITextField *nameText;
@property(nonatomic,strong)UITextField *passText;
@property(nonatomic,strong)UILabel *lineLabel;
@property(nonatomic,strong)UIButton *loginBtn;
@property(nonatomic,strong)UIButton *registerBtn;
@property(nonatomic,strong)UILabel *lineLab1;
@property(nonatomic,strong)UILabel *quickLoginLab;
@property(nonatomic,strong)UILabel *lineLab2;

@property(nonatomic,strong)UIButton *QQBtn;
@property(nonatomic,strong)UIButton *weixinBtn;
@property(nonatomic,strong)UIButton *xinlangBtn;

@property(nonatomic,strong)UILabel *topFlag;

@end
@implementation ZHRegister
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.backLael];
        [self addSubview:self.nameText];
        [self addSubview:self.lineLabel];
        [self addSubview:self.passText];
        [self addSubview:self.loginBtn];
        [self addSubview:self.registerBtn];
        
        [self addSubview:self.quickLoginLab];
        [self addSubview:self.lineLab1];
        [self addSubview:self.lineLab2];
        
        [self addSubview:self.QQBtn];
        [self addSubview:self.weixinBtn];
        [self addSubview:self.xinlangBtn];
        [self addSubview:self.topFlag];
        
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    __weak typeof(self) weakSelf = self;
    [weakSelf.backLael mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top).offset(35);
        make.left.mas_equalTo(weakSelf.mas_left);
        make.right.mas_equalTo(weakSelf.mas_right);
        make.height.mas_equalTo(88);
    } ];
    
    [weakSelf.nameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.backLael.mas_top);
        make.left.mas_equalTo(weakSelf.backLael.mas_left).offset(15);
        make.right.mas_equalTo(weakSelf.backLael.mas_right).offset(-15);
        make.height.mas_equalTo(43);
    }];
    
    [weakSelf.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.nameText.mas_top).offset(44);
        make.left.mas_equalTo(weakSelf.mas_left).offset(15);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-15);
        make.height.mas_equalTo(1);
    } ];
    
    [weakSelf.passText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.lineLabel.mas_top);
        make.left.mas_equalTo(weakSelf.backLael.mas_left).offset(15);
        make.right.mas_equalTo(weakSelf.backLael.mas_right).offset(-15);
        make.height.mas_equalTo(44);
    }];
    
    [weakSelf.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.passText.mas_bottom).offset(15);
        make.left.mas_equalTo(weakSelf.backLael.mas_left).offset(16);
        make.right.mas_equalTo(weakSelf.backLael.mas_right).offset(-16);
        make.height.mas_equalTo(35);
    }];
    
    [weakSelf.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.loginBtn.mas_bottom).offset(27);
        make.width.mas_equalTo(92);
        make.right.mas_equalTo(weakSelf.backLael.mas_right).offset(-15);
        make.height.mas_equalTo(16);
    }];
    
    //一键登陆
    [weakSelf.quickLoginLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.loginBtn.mas_bottom).offset(52);
        make.width.mas_equalTo(80);
        make.centerX.mas_equalTo(weakSelf.loginBtn.mas_centerX);
        make.height.mas_equalTo(30);
    }];
    
    [weakSelf.lineLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(weakSelf.mas_left).offset(16);
        make.centerY.mas_equalTo(weakSelf.quickLoginLab.mas_centerY);
        make.right.mas_equalTo(weakSelf.quickLoginLab.mas_left);
        make.height.mas_equalTo(1);
    }];
    
    [weakSelf.lineLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(weakSelf.mas_right).offset(-16);
        make.left.mas_equalTo(weakSelf.quickLoginLab.mas_right);
        make.centerY.mas_equalTo(weakSelf.quickLoginLab.mas_centerY);
        make.height.mas_equalTo(1);
    }];
    
    [weakSelf.weixinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.quickLoginLab.mas_bottom).offset(20);
        make.centerX.mas_equalTo(weakSelf.loginBtn.mas_centerX);
        make.height.mas_equalTo(45);
        make.width.mas_equalTo(45);
    }];
    
    [weakSelf.QQBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(weakSelf.mas_left).offset(60);
        make.centerY.mas_equalTo(weakSelf.weixinBtn.mas_centerY);
        make.height.mas_equalTo(45);
        make.width.mas_equalTo(45);
    }];
    
    [weakSelf.xinlangBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(weakSelf.mas_right).offset(-60);
        make.centerY.mas_equalTo(weakSelf.weixinBtn.mas_centerY);
        make.height.mas_equalTo(45);
        make.width.mas_equalTo(45);
    }];
    
    [weakSelf.topFlag mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(weakSelf.mas_left).offset(15);
        make.height.mas_equalTo(14);
        make.top.mas_equalTo(weakSelf.mas_top).offset(11);
        make.width.mas_equalTo(weakSelf.frame.size.width/2.0);
    }];
}

-(UILabel *)backLael
{
    if (!_backLael) {
        _backLael = [[UILabel alloc]init];
        _backLael.backgroundColor = [UIColor whiteColor];
    }
    return _backLael;
}

-(UITextField *)nameText
{
    if (!_nameText) {
        _nameText = [[UITextField alloc]init];
        _nameText.borderStyle = UITextBorderStyleNone;
        [_nameText setPlaceholder:@"请输入手机号码"];
        //        [_nameText ];
    }
    return _nameText;
}
-(UITextField *)passText
{
    if (!_passText) {
        _passText = [[UITextField alloc]init];
        _passText.borderStyle = UITextBorderStyleNone;
        [_passText setPlaceholder:@"设置账号密码"];
    }
    return _passText;
}

-(UILabel *)lineLabel
{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        [_lineLabel setBackgroundColor:[UIColor lightGrayColor]];
    }
    return _lineLabel;
}

-(UIButton *)loginBtn
{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_loginBtn setTitle:@"下一步" forState:UIControlStateNormal];
        
        [_loginBtn setBackgroundColor:RBG(234,234, 234)];
        [_loginBtn setTintColor:RBG(153,153,153)];
        _loginBtn.layer.cornerRadius = 5;
        _loginBtn.layer.masksToBounds = YES;
        
    }
    return _loginBtn;
}
-(UIButton *)registerBtn
{
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_registerBtn setTitle:@"去登陆" forState:UIControlStateNormal];
        [_registerBtn setTintColor:RBG(40, 181, 244)];
        [_registerBtn setBackgroundColor:RBG(245, 245, 245)];
    }
    return _registerBtn;
}

-(UILabel *)lineLab1
{
    if (!_lineLab1) {
        _lineLab1 = [[UILabel alloc]init];
        [_lineLab1 setBackgroundColor:[UIColor lightGrayColor]];
    }
    return _lineLab1;
}

-(UILabel *)quickLoginLab
{
    if (!_quickLoginLab) {
        _quickLoginLab = [[UILabel alloc]init];
        [_quickLoginLab setBackgroundColor:RBG(245, 245, 245)];
        _quickLoginLab.textAlignment = NSTextAlignmentCenter;
        [_quickLoginLab setText:@"一键登录"];
        [_quickLoginLab setTextColor:[UIColor lightGrayColor]];
    }
    return _quickLoginLab;
}
-(UILabel *)lineLab2
{
    if (!_lineLab2) {
        _lineLab2 = [[UILabel alloc]init];
        [_lineLab2 setBackgroundColor:[UIColor lightGrayColor]];
    }
    return _lineLab2;
}
-(UIButton *)QQBtn
{
    if (!_QQBtn) {
        _QQBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_QQBtn setImage:[UIImage imageNamed:@"登录界面qq登陆"] forState:UIControlStateNormal];
        
    }
    return _QQBtn;
}

-(UIButton *)weixinBtn
{
    if (!_weixinBtn) {
        _weixinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_weixinBtn setImage:[UIImage imageNamed:@"登录界面微信登录"] forState:UIControlStateNormal];
    }
    return _weixinBtn;
}

-(UIButton *)xinlangBtn
{
    if (!_xinlangBtn) {
        _xinlangBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_xinlangBtn setImage:[UIImage imageNamed:@"登陆界面微博登录"] forState:UIControlStateNormal];
    }
    return _xinlangBtn;
}

-(UILabel *)topFlag
{
    if (!_topFlag) {
        _topFlag = [[UILabel alloc]init];
        [_topFlag setText:@"请输入手机号码注册新用户"];
        [_topFlag setTextColor:RBG(102, 102, 102)];
    }
    return _topFlag;
}
@end
