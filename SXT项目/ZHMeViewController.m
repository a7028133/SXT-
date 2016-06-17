//
//  ZHMeViewController.m
//  SXT项目
//
//  Created by ma c on 16/6/16.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHMeViewController.h"
#import "ZHInputView.h"
#import "ZHMeUIView.h"

@interface ZHMeViewController ()

@end

@implementation ZHMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    ZHInputView *inputVC = [[ZHInputView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-108)];
//    [inputVC setBackgroundColor:RBG(245, 245, 245)];
//    [self.view addSubview:inputVC];
    
    ZHMeUIView *meVC = [[ZHMeUIView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-108)];
    [meVC setBackgroundColor:RBG(245, 245, 245)];
    [self.view addSubview:meVC];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
