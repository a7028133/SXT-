//
//  ZHRightTableViewCell.h
//  SXT项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHRightTableViewModel.h"

@interface ZHRightTableViewCell : UITableViewCell
@property (strong, nonatomic)   ZHRightTableViewModel *groupBuyModel;    /** 存储数据的model */
@end
