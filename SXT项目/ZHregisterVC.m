//
//  ZHregisterVC.m
//  SXT项目
//
//  Created by ma c on 16/6/21.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHregisterVC.h"
#import "ZHLonginVC.h"
#import "UMSocial.h"
#import "ZHTestPhoneNum.h"

@interface ZHRegisterVC()
@property(nonatomic,strong)UILabel *backLael;
@property(nonatomic,strong)UITextField *nameText;
@property(nonatomic,strong)UITextField *passText;
@property(nonatomic,strong)UILabel *lineLabel;
@property(nonatomic,strong)UIButton *nextBtn;
@property(nonatomic,strong)UIButton *registerBtn;
@property(nonatomic,strong)UILabel *lineLab1;
@property(nonatomic,strong)UILabel *quickLoginLab;
@property(nonatomic,strong)UILabel *lineLab2;

@property(nonatomic,strong)UIButton *QQBtn;
@property(nonatomic,strong)UIButton *weixinBtn;
@property(nonatomic,strong)UIButton *xinlangBtn;

@property(nonatomic,strong)UILabel *topFlag;
@property (nonatomic,strong) UIAlertController *alertVC;    //账户已经注册
@end


@implementation ZHRegisterVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = RBG(245, 245, 245);
    [self.view addSubview:self.backLael];
    [self.view addSubview:self.nameText];
    [self.view addSubview:self.lineLabel];
    [self.view addSubview:self.passText];
    [self.view addSubview:self.nextBtn];
    [self.view addSubview:self.registerBtn];
    
    [self.view addSubview:self.quickLoginLab];
    [self.view addSubview:self.lineLab1];
    [self.view addSubview:self.lineLab2];
    
    [self.view addSubview:self.QQBtn];
    [self.view addSubview:self.weixinBtn];
    [self.view addSubview:self.xinlangBtn];
    [self.view addSubview:self.topFlag];
}

-(void)viewWillLayoutSubviews
{
    
    [super viewWillLayoutSubviews];
    
    __weak typeof(self) weakSelf = self;
    [weakSelf.backLael mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.view.mas_top).offset(35);
        make.left.mas_equalTo(weakSelf.view.mas_left);
        make.right.mas_equalTo(weakSelf.view.mas_right);
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
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(15);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-15);
        make.height.mas_equalTo(1);
    } ];
    
    [weakSelf.passText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.lineLabel.mas_top);
        make.left.mas_equalTo(weakSelf.backLael.mas_left).offset(15);
        make.right.mas_equalTo(weakSelf.backLael.mas_right).offset(-15);
        make.height.mas_equalTo(44);
    }];
    
    [weakSelf.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.passText.mas_bottom).offset(15);
        make.left.mas_equalTo(weakSelf.backLael.mas_left).offset(16);
        make.right.mas_equalTo(weakSelf.backLael.mas_right).offset(-16);
        make.height.mas_equalTo(35);
    }];
    
    [weakSelf.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.nextBtn.mas_bottom).offset(27);
        make.width.mas_equalTo(92);
        make.right.mas_equalTo(weakSelf.backLael.mas_right).offset(-15);
        make.height.mas_equalTo(16);
    }];
    
    //一键登陆
    [weakSelf.quickLoginLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.nextBtn.mas_bottom).offset(52);
        make.width.mas_equalTo(80);
        make.centerX.mas_equalTo(weakSelf.nextBtn.mas_centerX);
        make.height.mas_equalTo(30);
    }];
    
    [weakSelf.lineLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(16);
        make.centerY.mas_equalTo(weakSelf.quickLoginLab.mas_centerY);
        make.right.mas_equalTo(weakSelf.quickLoginLab.mas_left);
        make.height.mas_equalTo(1);
    }];
    
    [weakSelf.lineLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-16);
        make.left.mas_equalTo(weakSelf.quickLoginLab.mas_right);
        make.centerY.mas_equalTo(weakSelf.quickLoginLab.mas_centerY);
        make.height.mas_equalTo(1);
    }];
    
    [weakSelf.weixinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.quickLoginLab.mas_bottom).offset(20);
        make.centerX.mas_equalTo(weakSelf.nextBtn.mas_centerX);
        make.height.mas_equalTo(45);
        make.width.mas_equalTo(45);
    }];
    
    [weakSelf.QQBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(60);
        make.centerY.mas_equalTo(weakSelf.weixinBtn.mas_centerY);
        make.height.mas_equalTo(45);
        make.width.mas_equalTo(45);
    }];
    
    [weakSelf.xinlangBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-60);
        make.centerY.mas_equalTo(weakSelf.weixinBtn.mas_centerY);
        make.height.mas_equalTo(45);
        make.width.mas_equalTo(45);
    }];
    
    [weakSelf.topFlag mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(15);
        make.height.mas_equalTo(14);
        make.top.mas_equalTo(weakSelf.view.mas_top).offset(11);
        make.width.mas_equalTo(weakSelf.view.frame.size.width/2.0+20);
    }];
}

-(void)nextBtnAction
{
    if([self.nameText.text isEqualToString:@""]||[self.passText.text isEqualToString:@""])
    {
        
    }
    else
    {
        NSString *url = @"http://123.57.141.249:8080/beautalk/appMember/createCode.do";
        NSDictionary *dic = @{
                              @"MemberId":self.nameText.text
                              };
        [ZHRegisterVC requestPOSTWithURL:url withParams:dic withSucess:^(id responseObject) {
            NSLog(@"验证码请求:%@",responseObject);
            if (![responseObject[@"result"]isEqualToString:@"TelephoneExistError"]) {
                ZHTestPhoneNum *testPhoneVC = [[ZHTestPhoneNum alloc]init];
                testPhoneVC.nameText = self.nameText.text;
                testPhoneVC.passText = self.passText.text;
                [self.navigationController pushViewController:testPhoneVC animated:YES];
            }
            else
            {
                [self presentViewController:self.alertVC animated:YES completion:^{
                }];
            }
            
        } withFail:^(NSError *error) {
            if(error)
                NSLog(@"error:%@",error.localizedDescription);
        }];
    }
    
    
    
}

-(void)loginBtnAction
{
    ZHLonginVC *logVC = [[ZHLonginVC alloc]init];
    [self.navigationController pushViewController:logVC animated:YES];
}

-(void)QQBtnAction
{
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
//            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
        }});
}


-(UILabel *)backLael
{
    if (!_backLael)
    {
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
        _nameText.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        _nameText.clearButtonMode = UITextFieldViewModeAlways;
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
        _passText.secureTextEntry = YES;
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

-(UIButton *)nextBtn
{
    if (!_nextBtn) {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
        
        [_nextBtn setBackgroundColor:RBG(234,234, 234)];
        [_nextBtn setTintColor:RBG(153,153,153)];
        [_nextBtn addTarget:self action:@selector(nextBtnAction) forControlEvents:UIControlEventTouchUpInside];
        _nextBtn.layer.cornerRadius = 5;
        _nextBtn.layer.masksToBounds = YES;
        
    }
    return _nextBtn;
}
-(UIButton *)registerBtn
{
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_registerBtn setTitle:@"去登陆" forState:UIControlStateNormal];
        [_registerBtn setTintColor:RBG(40, 181, 244)];
        [_registerBtn setBackgroundColor:RBG(245, 245, 245)];
        [_registerBtn addTarget:self action:@selector(loginBtnAction) forControlEvents:UIControlEventTouchUpInside];
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
        [_QQBtn addTarget:self action:@selector(QQBtnAction) forControlEvents:UIControlEventTouchUpInside];
        
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
        _topFlag.textAlignment = NSTextAlignmentCenter ;
    }
    return _topFlag;
}

-(UIAlertController *)alertVC
{
    if (!_alertVC) {
        _alertVC = [UIAlertController alertControllerWithTitle:@"注意" message:@"该账户已经被注册" preferredStyle:UIAlertControllerStyleAlert];
        
        //事件
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action)
                                 {
                                     NSLog(@"这个按钮被点击");
                                 }];
        
        //给alertController 添加action
        [_alertVC addAction:action];
    }
    return _alertVC;
}

@end
