//
//	ZHRightTableViewModel.h
//
//	Create by c ma on 27/6/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface ZHRightTableViewModel : NSObject

@property (nonatomic, strong) NSString * activityDate;
@property (nonatomic, strong) NSString * activityId;
@property (nonatomic, strong) NSString * commodityText;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * formetDate;
@property (nonatomic, strong) NSString * ifMiddlePage;
@property (nonatomic, strong) NSString * imgView;
@property (nonatomic, strong) NSString * logoImg;
@property (nonatomic, strong) NSString * shopTitle;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end