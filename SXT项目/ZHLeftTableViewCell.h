//
//  ZHLeftTableViewCell.h
//  SXT项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHLeftTableViewModel.h"

@interface ZHLeftTableViewCell : UITableViewCell
@property (strong, nonatomic)   ZHLeftTableViewModel *singleList; /** 存储数据的模型 */
@end
