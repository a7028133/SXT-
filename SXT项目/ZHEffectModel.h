//
//	ZHEffectModel.h
//
//	Create by c ma on 27/6/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface ZHEffectModel : NSObject

@property (nonatomic, strong) NSString * goodsType;
@property (nonatomic, strong) NSString * goodsTypeName;
@property (nonatomic, strong) NSString * imgView;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end