//
//  ZHTableViewCell.h
//  SXT项目
//
//  Created by ma c on 16/6/21.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHTableViewCellModel.h"

@interface ZHTableViewCell : UITableViewCell
//cell的初始化入口
+(instancetype)cellInTableView:(UITableView *)tableView
                   atIndexPath:(NSIndexPath *)indexPath
                      withData:(ZHTableViewCellModel *)data;
@end
