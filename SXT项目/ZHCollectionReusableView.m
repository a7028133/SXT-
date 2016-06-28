//
//  ZHCollectionReusableView.m
//  SXT项目
//
//  Created by ma c on 16/6/28.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHCollectionReusableView.h"
@interface ZHCollectionReusableView ()
@property (strong, nonatomic)UILabel *titleLab;     //section头上的标题Lab
@end


@implementation ZHCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLab];
    }
    return self;
}

-(void)layoutSubviews
{
    __weak typeof(self)weakSelf = self;
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 15, 0, 0));
    }];
}

- (void)setTitle:(NSString *)title{
    self.titleLab.text = title;
}


-(UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.font = [UIFont systemFontOfSize:13.0];
    }
    return _titleLab;
}
@end
