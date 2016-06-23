//
//  ZHLoginRequestVC.h
//  SXT项目
//
//  Created by ma c on 16/6/22.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHBaseViewController.h"
@interface ZHLoginRequestVC : ZHBaseViewController
typedef void (^SucessBlock)(NSDictionary *dic);
typedef void (^FailBlock)(NSError *);

+(void)loginRequestGETWithURL:(NSString *)url
                   withParams:(NSDictionary *)dic
                   withSucess:(SucessBlock)suc withFail:(FailBlock)fail;

+(void)loginRequestPSOTWithURL:(NSString *)url
                    withParams:(NSDictionary *)dic
                    withSucess:(SucessBlock)suc withFail:(FailBlock)fail;
@end
