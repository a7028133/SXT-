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
@property(nonatomic,strong)UILabel *sucLab;  //注册成功后的提示语
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
    [self.view addSubview:self.sucLab];
    self.sucLab.hidden = YES;
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
    
    [self.sucLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(18*PIX);
        make.width.mas_equalTo(4*17*2+12*PIX);
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
        make.centerY.mas_equalTo(weakSelf.view.mas_centerY);
    }];
}

#pragma mark 自定义事件
-(instancetype)init
{
    self = [super init];
    [self startTime];
    return self;
}

-(void)testBtnAction
{
    [self startTime];
    NSString *url = @"http://123.57.141.249:8080/beautalk/appMember/createCode.do";
            NSDictionary *dic = @{
                                  @"MemberId":self.nameText
                                  };
            [ZHTestPhoneNum requestPOSTWithURL:url withParams:dic withSucess:^(id responseObject) {
                NSLog(@"验证码请求:%@",responseObject);
            } withFail:^(NSError *error) {
                if(error)
                    NSLog(@"error:%@",error.localizedDescription);
            }];
}

-(void)registBtnAction
{
    self.registBtn.alpha = 0.1;
    [UIView animateWithDuration:0.5 animations:^{
        self.registBtn.alpha = 1;
    }];
    
    if (![self.text.text isEqualToString:@""]) {
        NSString *url  = @"http://123.57.141.249:8080/beautalk/appMember/appRegistration.do";
        NSDictionary *dic =@{
                             @"LoginName":self.nameText,
                             @"Lpassword":self.passText,
                             @"Code":self.text.text,
                             @"Telephone":self.nameText
                             };
        [ZHTestPhoneNum requestGETWithURL:url withParams:dic withSucess:^(id responseObject) {
            NSLog(@"点击注册后返回的数据%@",responseObject);
            [UIView animateWithDuration:0.5 animations:^{
                self.sucLab.hidden = YES;
            } completion:^(BOOL finished) {
                self.sucLab.hidden = NO;
            }];
            [self.navigationController popToRootViewControllerAnimated:YES];
        } withFail:^(NSError *error) {
            if (error) {
                NSLog(@"error:%@",error.localizedDescription);
            }
        }];
    }
}

-(void)resendBtnAction
{
    self.resendBtn.alpha= 0.1;
    [UIView animateWithDuration:0.5 animations:^{
        self.resendBtn.alpha= 1;
    }];
    
    NSString *url = @"http://123.57.141.249:8080/beautalk/appMember/createCode.do";
    NSDictionary *dic = @{
                          @"MemberId":self.nameText
                          };
    [ZHTestPhoneNum requestPOSTWithURL:url withParams:dic withSucess:^(id responseObject) {
        
    } withFail:^(NSError *error) {
        if(error)
            NSLog(@"error:%@",error.localizedDescription);
    }];
}

-(void)startTime
{
    __block int timeout= 60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.testBtn setTitle:@"重发验证码" forState:UIControlStateNormal];
                self.testBtn.userInteractionEnabled = YES;
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [self.testBtn setTitle:[NSString stringWithFormat:@"%zd秒后重试",timeout] forState:UIControlStateNormal];
                [UIView commitAnimations];
                self.testBtn.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
    
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
        [_resendBtn addTarget:self action:@selector(resendBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _resendBtn;
}

-(UILabel *)sucLab
{
    if (!_sucLab) {
        _sucLab = [[UILabel alloc]init];
        _sucLab.text = @"注册成功！";
        [_sucLab setBackgroundColor: [UIColor whiteColor]];
        _sucLab.textColor = [UIColor grayColor];
    }
    return _sucLab;
}



@end
