//
//  ZHTableViewCellModel.h
//  SXT项目
//
//  Created by ma c on 16/6/21.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHTableViewCellModel : NSObject
@property(nonatomic,strong)NSString *headImage;
@property(nonatomic,strong)NSString *labText;
@property(nonatomic,strong)NSString *tailImage;

//字典转模型
+(instancetype)modelWithDictionary:(NSDictionary *)dic;

@end
