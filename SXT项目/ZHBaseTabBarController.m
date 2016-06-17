//
//  ZHBaseTabBarController.m
//  SXT项目
//
//  Created by ma c on 16/6/16.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHBaseTabBarController.h"
@interface ZHBaseTabBarController()
@property(nonatomic,strong)NSMutableArray *tabBarItemsArr;
@end


@implementation ZHBaseTabBarController
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_back"];
    
    /*
     视图控制器的组合关系
     UITabBarController包含UINavigationController，UINavigationController包含UIviewController
     */
    NSMutableArray *mArr = [NSMutableArray array];
    for (NSDictionary *dic in self.tabBarItemsArr) {
        Class viewController = NSClassFromString(dic[@"ViewController"]);
        UIViewController *VC = [[viewController alloc]init];
        
        UINavigationController *navC = [[UINavigationController alloc]initWithRootViewController:VC];
        
        VC.navigationItem.title = dic[@"title"];
        navC.tabBarItem.title = dic[@"title"];
        navC.tabBarItem.image = [UIImage imageNamed:dic[@"image"]];
        navC.tabBarItem.selectedImage = [UIImage imageNamed:dic[@"selectedImage"]];
        [mArr addObject:navC];
    }
    self.viewControllers = mArr;
    
    [[UITabBarItem appearance] setTitleTextAttributes: @{
                                                         NSFontAttributeName:[UIFont systemFontOfSize:12.0],
                                                         NSForegroundColorAttributeName:[UIColor grayColor]
                                                         }forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSFontAttributeName:[UIFont systemFontOfSize:12.0],
                                                        NSForegroundColorAttributeName:[UIColor grayColor]
                                                        } forState:UIControlStateSelected];
}


#pragma mark
#pragma makr 懒加载
-(NSMutableArray *)tabBarItemsArr
{
    if (!_tabBarItemsArr) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"TabBar List" ofType:@"plist"];
        _tabBarItemsArr = [NSMutableArray arrayWithContentsOfFile:path];
    }
    return _tabBarItemsArr;
}
@end
