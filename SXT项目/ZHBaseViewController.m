//
//  ZHBaseViewController.m
//  SXT项目
//
//  Created by ma c on 16/6/22.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHBaseViewController.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"

@implementation ZHBaseViewController
+(void)requestGETWithURL:(NSString *)url
              withParams:(NSDictionary *)dic
              withSucess:(SecussBlock)suc
                withFail:(FailBlock)fail
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [SVProgressHUD show];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    [manager GET:url parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        suc(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
}

+(void)requestPOSTWithURL:(NSString *)url
              withParams:(NSDictionary *)dic
              withSucess:(SecussBlock)suc
                withFail:(FailBlock)fail
{
    AFHTTPSessionManager *manager  = [AFHTTPSessionManager manager];
    [SVProgressHUD show];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    [manager POST:url parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        suc(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
}
@end
