//
//  ZHDoubleTableView.m
//  SXT项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHDoubleTableView.h"
#import "ZHLeftTableViewModel.h"
#import "ZHRightTableViewCell.h"

@interface ZHDoubleTableView()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *leftTableView;
@property(nonatomic,strong)UITableView *rightTableView;
@end

@implementation ZHDoubleTableView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.leftTableView];
        [self addSubview:self.rightTableView];
    }
    return self;
}

-(void)layoutSubviews
{
    
}

-(void)requestData
{
    
}

#pragma mark    UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.leftTableView) {
        return 170;
    }
    else{
        return 175;
    }
}

#pragma mark
#pragma mark 懒加载
//-(UIScrollView *)BKScrollView
//{
//    if (!_BKScrollView) {
//        _BKScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 1000)];
//
//
//    }
//}

-(UITableView *)leftTableView
{
    if (!_leftTableView) {
        _leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 0) style:UITableViewStylePlain];
        _leftTableView.bounces = NO;_leftTableView.delegate = self;
        _leftTableView.dataSource = self;
    }
    return _leftTableView;
}

-(UITableView *)rightTableView
{
    if (!_rightTableView) {
        _rightTableView = [[UITableView alloc]initWithFrame:CGRectMake(-WIDTH, 0, WIDTH, 0) style:UITableViewStylePlain];
        _rightTableView.bounces = NO;
        _rightTableView.bounces = NO;
        _leftTableView.delegate = self;
        _rightTableView.dataSource = self;
    }
    return _rightTableView;
}

@end
