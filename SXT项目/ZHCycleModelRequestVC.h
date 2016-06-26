//
//  ZHCycleModelRequestVC.h
//  SXT项目
//
//  Created by ma c on 16/6/23.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHBaseViewController.h"
typedef void (^SucessBlock)(id responseObject);
typedef void (^FailBlock)(NSError *error);

@interface ZHCycleModelRequestVC : ZHBaseViewController
+(void)cycleModelRequestGETWithURL:(NSString *)url withParams:(NSDictionary *)dic withSucess:(SucessBlock)suc withFail:(FailBlock)fail;

+(void)cycleModelRequestPOSTWithURL:(NSString *)url withParams:(NSDictionary *)dic withSucess:(SucessBlock)suc withFail:(FailBlock)fail;
@end
