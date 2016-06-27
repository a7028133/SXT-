//
//  ZHBaseTableView.h
//  SXT项目
//
//  Created by ma c on 16/6/26.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHBaseTableView : UITableView
@property (strong, nonatomic) NSArray *singleListArray;
@property (strong, nonatomic) NSArray *groupBuyListArray;

@property(nonatomic,assign)BOOL isSingleTableView;
@end
