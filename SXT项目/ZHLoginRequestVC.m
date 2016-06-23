//
//  ZHLoginRequestVC.m
//  SXT项目
//
//  Created by ma c on 16/6/22.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHLoginRequestVC.h"
//#import "ZHMyRequest.h"


@implementation ZHLoginRequestVC
+(void)loginRequestGETWithURL:(NSString *)url
                   withParams:(NSDictionary *)dic
                   withSucess:(SucessBlock)suc
                     withFail:(FailBlock)fail
{
    [self requestGETWithURL:url withParams:dic withSucess:^(id responseObject) {
        NSDictionary *dic = responseObject;
        suc(dic);
    } withFail:^(NSError *error) {
        fail(error);
    }];
}

+(void)loginRequestPSOTWithURL:(NSString *)url
                    withParams:(NSDictionary *)dic
                    withSucess:(SucessBlock)suc
                      withFail:(FailBlock)fail
{
    [self requestPOSTWithURL:url withParams:dic withSucess:^(id responseObject) {
        NSDictionary *dic = responseObject;
        NSLog(@"%@",dic);
        suc(dic);
    } withFail:^(NSError *error) {
        fail(error);
    }];
}
@end
