//
//  ZHMeUIView.m
//  SXT项目
//
//  Created by ma c on 16/6/16.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHMeUIView.h"
#import "Masonry.h"


@interface ZHMeUIView ()
@property(nonatomic,strong)UIImageView *topBackImageView; //第一个imageView，其上方登陆，注册按钮
@property(nonatomic,strong)UIButton *loginBtn;
@property(nonatomic,strong)UIButton *registerBtn;
//@property(nonatomic,strong)UIImageView *nextBackImageView; //第二个imageView，其上放收藏，意见，客服。。。

@property(nonatomic,strong)UILabel *lineLab;
@property(nonatomic,strong)UIButton *collectBtn;
@property(nonatomic,strong)UIButton *suggestBtn;
@property(nonatomic,strong)UIButton *aboutBtn;
@property(nonatomic,strong)UIButton *serviceBtn;
@end

@implementation ZHMeUIView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.topBackImageView];
        [self addSubview:self.loginBtn];
        [self addSubview:self.registerBtn];
//        [self addSubview:self.nextBackImageView];
        
    }
    return self;
}

-(void)layoutSubviews
{
    __weak typeof(self) weakSelf = self;
    [weakSelf.topBackImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top);
        make.left.mas_equalTo(weakSelf.mas_left);
        make.height.mas_equalTo(125);
        make.width.mas_equalTo(weakSelf.mas_width);
    }];
    
    [weakSelf.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.topBackImageView.mas_top).offset(55);
        make.bottom.mas_equalTo(weakSelf.topBackImageView.mas_bottom).offset(-55);
        
        make.left.mas_equalTo(weakSelf.topBackImageView.mas_left).offset(100);
        make.right.mas_equalTo(weakSelf.registerBtn.mas_left).offset(-93);
    }];
    
    [weakSelf.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.topBackImageView.mas_top).offset(55);
        make.bottom.mas_equalTo(weakSelf.topBackImageView.mas_bottom).offset(-55);
        
//        make.left.mas_equalTo(weakSelf.loginBtn.mas_right).offset(93);
        make.right.mas_equalTo(weakSelf.topBackImageView.mas_right).offset(-99);
        
    }];
    
    
}


#pragma mark 
#pragma mark 懒加载
-(UIImageView *)topBackImageView
{
    if (!_topBackImageView) {
        _topBackImageView = [[UIImageView alloc]init];
        
        _topBackImageView.image = [UIImage imageNamed:@"我的背景"];
    }
    return _topBackImageView;
}

-(UIButton *)loginBtn
{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn setBackgroundColor:[UIColor clearColor]];
    }
    return _loginBtn;
}
-(UIButton *)registerBtn
{
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_registerBtn setBackgroundColor:[UIColor clearColor]];
    }
    return _registerBtn;
}

-(UILabel *)lineLab
{
    if (!_lineLab) {
        _lineLab = [[UILabel alloc]init];
        [_lineLab setBackgroundColor:[UIColor grayColor]];
    }
    return _lineLab;
}
-(UIButton *)collectBtn
{
    if (!_collectBtn) {
        _collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_collectBtn setBackgroundColor:[UIColor whiteColor]];
        
    }
    return _collectBtn;
}
@end
