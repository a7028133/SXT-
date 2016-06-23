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

@property(nonatomic,strong)UILabel *marginLab;
@property(nonatomic,strong)UIButton *testBtn;
@property(nonatomic,strong)UIButton *registBtn;
@property(nonatomic,strong)UIButton *resendBtn;
@end

@implementation ZHTestPhoneNum
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:RBG(245, 245, 245)];
    
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
}

-(UILabel *)tipLab
{
    if (!_tipLab) {
        _tipLab = [[UILabel alloc]init];
        _tipLab.text = @"验证码已发送到+86";
        _tipLab.textColor = [UIColor grayColor];
        
        NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:@"验证码已发送到+86"];
        NSRange redRange = NSMakeRange([[noteStr string] rangeOfString:@"+86"].location, [[noteStr string] rangeOfString:@"+86"].length);
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
    }
    return _marginLab;
}

-(UIButton *)testBtn
{
    if (!_testBtn) {
        _testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _testBtn = [[UIButton alloc]init];
    }
    return _testBtn;
}

-(UIButton *)registBtn
{
    if (!_registBtn) {
        _registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _registBtn = [[UIButton alloc]init];
        _registBtn.titleLabel.text = @"注册";
        _registBtn.tintColor = [UIColor grayColor];
        _registBtn.backgroundColor = [UIColor lightGrayColor];
    }
    return _registBtn;
}

-(UIButton *)resendBtn
{
    if (!_resendBtn) {
        _resendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _resendBtn = [[UIButton alloc]init];
        _resendBtn.titleLabel.text = @"重新发送验证码";
        _resendBtn.tintColor = [UIColor grayColor];
    }
    return _resendBtn;
}
@end
