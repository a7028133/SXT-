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

@end
@implementation ZHTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        <#statements#>
    }
    return self;
}


+(instancetype)cellInTableView:(UITableView *)tableView
                   atIndexPath:(NSIndexPath *)indexPath
                      withData:(ZHTableViewCellModel *)data
{
    return cell;
}

-(UIImageView *)headImageView
{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]init];
        _headImageView.image = [UIImage imageNamed:@""];
        
    }
    return _headImageView;
}
-(UIImageView *)tailImageView
{
    if (!_tailImageView) {
        _tailImageView = [[UIImageView alloc]init];
        _tailImageView.image = [UIImage imageNamed:@""];
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
@end
