//
//  ZHTableViewCell.m
//  SXT项目
//
//  Created by ma c on 16/6/21.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHTableViewCell.h"

@interface ZHTableViewCell ()
@property(nonatomic,strong)UIImageView *headImageView;
@property(nonatomic,strong)UIImageView *tailImageView;
@property(nonatomic,strong)UILabel *textLab;
@property(nonatomic,strong)UILabel *lineLab;
@property(nonatomic,strong)UILabel *numLab;

@end
@implementation ZHTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.headImageView];
        [self addSubview:self.tailImageView];
        [self addSubview:self.textLab];
        [self addSubview:self.lineLab];
        [self addSubview:self.numLab];
    }
    return self;
}


+(instancetype)cellInTableView:(UITableView *)tableView
                   atIndexPath:(NSIndexPath *)indexPath
                       withDic:(NSDictionary *)dic
{
    static NSString *ID = @"ID";
    ZHTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ZHTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
        cell.headImageView.image = [UIImage imageNamed:dic[@"headImage"]];
        cell.lineLab.backgroundColor = RBG(245, 245, 245);
        cell.textLab.text = dic[@"title"];
        if (indexPath.row!=3) {
            cell.tailImageView.image = [UIImage imageNamed:dic[@"tailImage"]];
            cell.numLab.hidden = YES;
        }
        else
        {
            cell.tailImageView.hidden = YES;
            cell.numLab.text =@"400-6010-545";
        }
        
        
    }
    return cell;
}

-(void)layoutSubviews
{
    __weak typeof(self) weakSelf = self;
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top).offset(12.5);
        make.left.mas_equalTo(weakSelf.mas_left).offset(15);
        make.width.mas_equalTo(20);
        make.bottom.mas_equalTo(weakSelf.mas_bottom).offset(-12.5);
    }];
    
    [self.textLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top).offset(12.5);
        make.left.mas_equalTo(weakSelf.mas_left).offset(50);
        make.width.mas_equalTo(20*9);
        make.bottom.mas_equalTo(weakSelf.mas_bottom).offset(-12.5);
    }];
    
    [self.tailImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top).offset(10.5);
        make.width.mas_equalTo(20);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-15);
        make.bottom.mas_equalTo(weakSelf.mas_bottom).offset(-10.5);
    }];
    
    [self.lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.mas_left).offset(50);
        make.right.mas_equalTo(weakSelf.mas_right);
        make.height.mas_equalTo(1);
        make.bottom.mas_equalTo(weakSelf.mas_bottom);
    }];
    
    [self.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top).offset(12.5);
        make.width.mas_equalTo(20*7);
        make.right.mas_equalTo(weakSelf.mas_right).offset(5);
        make.bottom.mas_equalTo(weakSelf.mas_bottom).offset(-12.5);
    }];
    
    
}

-(UIImageView *)headImageView
{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]init];
        
    }
    return _headImageView;
}
-(UIImageView *)tailImageView
{
    if (!_tailImageView) {
        _tailImageView = [[UIImageView alloc]init];
    }
    return _tailImageView;
}
-(UILabel *)textLab
{
    if (!_textLab) {
        _textLab = [[UILabel alloc]init];
        
    }
    return _textLab;
}
-(UILabel *)lineLab
{
    if (!_lineLab) {
        _lineLab = [[UILabel alloc]init];
        [_lineLab setBackgroundColor:RBG(245, 245, 245)];
    }
    return _lineLab;
}
-(UILabel *)numLab
{
    if (!_numLab) {
        _numLab  = [[UILabel alloc]init];
        _numLab.textColor = [UIColor grayColor];
        
        
    }
    return _numLab;
}
@end
