//
//  ZHBaseTableView.m
//  SXT项目
//
//  Created by ma c on 16/6/26.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHBaseTableView.h"
#import "ZHLeftTableViewCell.h"
#import "ZHRightTableViewCell.h"

@interface ZHBaseTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation ZHBaseTableView
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource  = self;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isSingleTableView) {
        return self.singleListArray.count;
    }
    else
    {
        return self.groupBuyListArray.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    //根据isSingle的值来设定对应cell的高度
    if (_isSingleTableView) {
        return 170;
    }else
        return 175;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"ID";
    if (self.isSingleTableView) {
        //给左边的tableView绘制自定义cell
        ZHLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell) {
            cell = [[ZHLeftTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        //给cell赋值，
        cell.singleList = self.singleListArray[indexPath.row];
        //cell被选中后反应的效果类型
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        //给左边的tableView绘制自定义cell
        ZHRightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell) {
            cell = [[ZHRightTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.groupBuyModel = self.groupBuyListArray[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"你点击了第%ld个cell",indexPath.row);
}
@end
