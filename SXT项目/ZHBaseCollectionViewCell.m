//
//  ZHBaseCollectionViewCell.m
//  SXT项目
//
//  Created by ma c on 16/6/27.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHBaseCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@interface ZHBaseCollectionViewCell ()

@end
@implementation ZHBaseCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self= [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.imgView];
        [self.contentView addSubview:self.titleLab];
        self.effectModel = [ZHEffectModel new];
        self.faceModel = [ZHFaceModel new];
        self.bodyModel = [ZHBodyModel new];
        
    }
    return self;
}

-(void)layoutSubviews
{
    __weak typeof(self) weakSelf = self;
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(weakSelf).with.insets(UIEdgeInsetsMake(10, 20, 30, 20));
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.imgView.mas_bottom);
        make.left.mas_equalTo(weakSelf.mas_left);
        make.right.mas_equalTo(weakSelf.mas_right);
        make.bottom.mas_equalTo(weakSelf.mas_bottom);
        
    }];
}
#pragma mark 自定义方法

- (void)setEffectModel:(ZHEffectModel *)effectModel{
    NSURL *url = [NSURL URLWithString:effectModel.imgView];
    [self.imgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholder"]];
    self.titleLab.text = effectModel.goodsTypeName;
}

- (void)setFaceModel:(ZHFaceModel *)faceModel{
    NSURL *url = [NSURL URLWithString:faceModel.imgView];
    [self.imgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholder"]];
//    self.titleLab.text = faceModel.shopId;
}

- (void)setBodyModel:(ZHBodyModel *)bodyModel{
    NSURL *url = [NSURL URLWithString:bodyModel.imgView];
    [self.imgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholder"]];
//    self.titleLab.text = bodyModel.shopId;
}




#pragma mark 懒加载

-(UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = [[UIImageView alloc]init];
        [_imgView setBackgroundColor:[UIColor whiteColor]];
        
    }
    return _imgView;
}

-(UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.backgroundColor = [UIColor whiteColor];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        [_titleLab setFont:[UIFont systemFontOfSize:12]];
    }
    return _titleLab;
}


@end
