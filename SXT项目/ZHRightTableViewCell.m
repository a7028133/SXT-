//
//  ZHRightTableViewCell.m
//  SXT项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHRightTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface ZHRightTableViewCell ()
/**
 品牌团购用来显示的图片
 */
@property (strong, nonatomic)   UIImageView *groupImage;
@end

@implementation ZHRightTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self addSubview:self.groupImage];
    }
    
    return self;
}

- (void)layoutSubviews{
    __weak typeof(self) weakSelf = self;
    [_groupImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 0, 10, 0));
    }];
}

- (void)setGroupBuyModel:(ZHRightTableViewModel *)groupBuyModel{
    NSURL *picURL = [NSURL URLWithString:groupBuyModel.imgView];
    [self.groupImage sd_setImageWithURL:picURL placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
//    self.groupImage.image = [UIImage imageNamed:groupBuyModel.imgView];
    
}

- (UIImageView *)groupImage{
    if (!_groupImage) {
        _groupImage = [[UIImageView alloc]init];
    }
    return _groupImage;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
