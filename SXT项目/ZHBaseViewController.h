//
//  ZHBaseViewController.h
//  SXT项目
//
//  Created by ma c on 16/6/22.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHBaseViewController : UIViewController
typedef void (^SecussBlock)(id );
typedef void (^FailBlock)(NSError *error);

+(void)requestGETWithURL:(NSString *)url
              withParams:(NSDictionary *)dic
              withSucess:(SecussBlock)suc
                withFail:(FailBlock)fail;

+(void)requestPOSTWithURL:(NSString *)url
              withParams:(NSDictionary *)dic
              withSucess:(SecussBlock)suc
                withFail:(FailBlock)fail;
@end
