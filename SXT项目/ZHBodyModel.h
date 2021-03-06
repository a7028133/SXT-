//
//	ZHBodyModel.h
//
//	Create by c ma on 27/6/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface ZHBodyModel : NSObject

@property (nonatomic, strong) NSString * commodityText;
@property (nonatomic, strong) NSString * imgView;
@property (nonatomic, strong) NSString * shopId;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end