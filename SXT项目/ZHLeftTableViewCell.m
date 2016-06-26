//
//  ZHLeftTableViewCell.m
//  SXT项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHLeftTableViewCell.h"
@interface ZHLeftTableViewCell ()
@property(nonatomic,strong)UIImageView *goodsImageView;
@property(nonatomic,strong)UIImageView *countryImageView;
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UILabel *priceLab;
@property(nonatomic,strong)UIButton *buyBtn;
@end

@implementation ZHLeftTableViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame ];
    if (self) {
        [self addSubview:self.goodsImageView];
        [self addSubview:self.countryImageView];
        [self addSubview:self.titleLab];
        [self addSubview:self.priceLab];
        [self addSubview:self.buyBtn];
    }
    return self;
}

+(void)cellintable:(UITableView *)table withIndexPath:(NSIndexPath *)index withDic:(NSDictionary *)dic
{
    static NSString *ID = @"ID";
    ZHLeftTableViewCell *cell = [table dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ZHLeftTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.goodsImageView = dic[@""];
        cell.countryImageView = dic[@""];
        cell.titleLab = dic[@""];
        cell.priceLab = dic[@""];
        cell.buyBtn = dic[@""];
    }
}


-(void)layoutSubviews
{
    __weak typeof(self)weakSelf = self;
    [self.goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top).offset(33*PIX);
        make.left.mas_equalTo(weakSelf.mas_left).offset(10*PIX);
        make.width.mas_equalTo(284*PIX);
        make.bottom.mas_equalTo(weakSelf.mas_bottom).offset(-33*PIX);
    }];
    
    [self.countryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.goodsImageView.mas_top).offset(33*PIX);
        make.left.mas_equalTo(weakSelf.goodsImageView.mas_left).offset(33*PIX);
        make.width.mas_equalTo(50*PIX);
        make.height.mas_equalTo(40*PIX);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top).offset(50*PIX);
        make.left.mas_equalTo(weakSelf.goodsImageView.mas_right).offset(12*PIX);
        make.right.mas_equalTo(weakSelf.mas_right).offset(34*PIX);
        make.height.mas_equalTo(158*PIX);
    }];
    
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.titleLab.mas_top).offset(52*PIX);
        make.left.mas_equalTo(weakSelf.goodsImageView.mas_right).offset(12*PIX);
        make.width.mas_equalTo(174*PIX);
        make.bottom.mas_equalTo(weakSelf.mas_bottom).offset(-57*PIX);
    }];
    
    [self.buyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.titleLab.mas_top).offset(28*PIX);
        make.right.mas_equalTo(weakSelf.goodsImageView.mas_right).offset(-89*PIX);
        make.width.mas_equalTo(70*PIX);
        make.bottom.mas_equalTo(weakSelf.mas_bottom).offset(-39*PIX);
    }];
    
}

#pragma mark
#pragma mark 懒加载
-(UIImageView *)goodsImageView
{
    if (!_goodsImageView) {
        _goodsImageView = [[UIImageView alloc]init];
        _goodsImageView.userInteractionEnabled =YES;
    }
    return _goodsImageView;
}

-(UIImageView *)countryImageView
{
    if (!_countryImageView) {
        _countryImageView = [[UIImageView alloc]init];
        _countryImageView.userInteractionEnabled = YES;
    }
    return _countryImageView;
}

-(UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        
    }
    return _titleLab;
}

-(UILabel *)priceLab
{
    if (!_priceLab) {
        _priceLab = [[UILabel alloc]init];
    }
    return _priceLab;
}
-(UIButton *)buyBtn
{
    if (!_buyBtn) {
        _buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _buyBtn = [[UIButton alloc]init];
    }
    return _buyBtn;
}

@end
