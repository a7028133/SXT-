//
//  ZHTestPhoneNum.m
//  SXT项目
//
//  Created by ma c on 16/6/22.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHTestPhoneNum.h"

@interface ZHTestPhoneNum  ()
@property(nonatomic,strong)UILabel *tipLab;
@property(nonatomic,strong)UILabel *doubleLab;
@property(nonatomic,strong)UITextField *text;

@property(nonatomic,strong)UILabel *marginLab;  //发送验证码按钮左边的竖线
@property(nonatomic,strong)UIButton *testBtn;   //发送验证码按钮
@property(nonatomic,strong)UIButton *registBtn;
@property(nonatomic,strong)UIButton *resendBtn;
@end

@implementation ZHTestPhoneNum
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:RBG(245, 245, 245)];
    self.navigationItem.title = @"验证手机号";
    
    [self.view addSubview:self.tipLab];
    [self.view addSubview:self.doubleLab];
    [self.view addSubview:self.text];
    
    [self.view addSubview:self.marginLab];
    [self.view addSubview:self.testBtn];
    [self.view addSubview:self.registBtn];
    [self.view addSubview:self.resendBtn];
}

-(void)viewWillLayoutSubviews
{
    __weak typeof(self) weakSelf = self;
    [weakSelf.tipLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.view.mas_top).offset(11);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(15);
        make.height.mas_equalTo(14);
        make.width.mas_equalTo(10*17+10);
    }];
    
    [weakSelf.doubleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.view.mas_top).offset(35);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(-1);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(1);
        make.height.mas_equalTo(43);
    }];
    
    [weakSelf.text mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.doubleLab.mas_top).offset(1);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(15);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-15);
        make.bottom.mas_equalTo(weakSelf.doubleLab.mas_bottom).offset(-1);
    }];
    
    [self.marginLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.doubleLab.mas_top).offset(10*PIX);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-205*PIX);
        make.width.mas_equalTo(1*PIX);
        make.bottom.mas_equalTo(weakSelf.doubleLab.mas_bottom).offset(-10*PIX);
    }];
    
    [self.testBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.doubleLab.mas_top);
        make.right.mas_equalTo(weakSelf.view.mas_right);
        make.width.mas_equalTo(205*PIX);
        make.bottom.mas_equalTo(weakSelf.doubleLab.mas_bottom);
    }];
    
    [self.registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.doubleLab.mas_bottom).offset(32*PIX);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-32*PIX);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(32*PIX);
        make.height.mas_equalTo(86*PIX);
    }];
    
    [self.resendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.registBtn.mas_bottom).offset(44*PIX);
        make.width.mas_equalTo(7*17*2+12*PIX);
        make.centerX.mas_equalTo(weakSelf.registBtn.mas_centerX);
        make.height.mas_equalTo(35*PIX);
    }];
}

#pragma mark 自定义事件
-(void)testBtnAction
{
    
}

-(void)registBtnAction
{
    
}

-(void)resendBtnAction
{
    
}

#pragma mark 懒加载

-(UILabel *)tipLab
{
    if (!_tipLab) {
        _tipLab = [[UILabel alloc]init];
        _tipLab.text = @"验证码已发送到+86";
        _tipLab.textColor = [UIColor grayColor];
        
        NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:@"验证码已发送到+86"];
        NSRange redRange = NSMakeRange([[noteStr string]rangeOfString:@"+86"].location, [[noteStr string] rangeOfString:@"+86"].length);
        [noteStr addAttribute:NSForegroundColorAttributeName value:RBG(40, 181, 244) range:redRange];
        [_tipLab setAttributedText:noteStr];
        [_tipLab sizeToFit];
    }
    return _tipLab;
}

-(UILabel *)doubleLab
{
    if (!_doubleLab) {
        _doubleLab = [[UILabel alloc]init];
        _doubleLab.layer.borderWidth = 1;
        _doubleLab.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _doubleLab.backgroundColor = [UIColor whiteColor];
    }
    return _doubleLab;
}

-(UITextField *)text
{
    if (!_text) {
        _text =[[UITextField alloc]init];
        _text.placeholder = @"请输入验证码";
        _text.backgroundColor= [UIColor whiteColor];
        
    }
    return _text;
}


-(UILabel *)marginLab
{
    if (!_marginLab) {
        _marginLab = [[UILabel alloc]init];
        _marginLab.backgroundColor = [UIColor grayColor];
    }
    return _marginLab;
}

-(UIButton *)testBtn
{
    if (!_testBtn) {
        _testBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _testBtn = [[UIButton alloc]init];
        [_testBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        [_testBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_testBtn addTarget:self action:@selector(testBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _testBtn;
}

-(UIButton *)registBtn
{
    if (!_registBtn) {
        _registBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _registBtn = [[UIButton alloc]init];
        [_registBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _registBtn.backgroundColor = RBG(234, 234, 234);
        [_registBtn addTarget:self action:@selector(registBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registBtn;
}

-(UIButton *)resendBtn
{
    if (!_resendBtn) {
        _resendBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _resendBtn = [[UIButton alloc]init];
        [_resendBtn setTitle:@"重新发送验证码" forState:UIControlStateNormal];
        [_resendBtn setTitleColor:RBG(204, 204, 204) forState:UIControlStateNormal];
        [_registBtn addTarget:self action:@selector(resendBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _resendBtn;
}
@end
