//
//  ZHCycleModelRequestVC.m
//  SXT项目
//
//  Created by ma c on 16/6/23.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHCycleModelRequestVC.h"


@implementation ZHCycleModelRequestVC
+(void)cycleModelRequestGETWithURL:(NSString *)url withParams:(NSDictionary *)dic withSucess:(SucessBlock)suc withFail:(FailBlock)fail
{
    [self requestGETWithURL:url withParams:dic withSucess:^(id responseObject) {
        suc(responseObject);
    } withFail:^(NSError *error) {
        fail(error);
    }];
}

+(void)cycleModelRequestPOSTWithURL:(NSString *)url withParams:(NSDictionary *)dic withSucess:(SucessBlock)suc withFail:(FailBlock)fail
{
    
}
@end
