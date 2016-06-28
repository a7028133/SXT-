//
//	ZHBodyModel.m
//
//	Create by c ma on 27/6/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ZHBodyModel.h"

NSString *const kZHBodyModelCommodityText = @"CommodityText";
NSString *const kZHBodyModelImgView = @"ImgView";
NSString *const kZHBodyModelShopId = @"ShopId";

@interface ZHBodyModel ()
@end
@implementation ZHBodyModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kZHBodyModelCommodityText] isKindOfClass:[NSNull class]]){
		self.commodityText = dictionary[kZHBodyModelCommodityText];
	}	
	if(![dictionary[kZHBodyModelImgView] isKindOfClass:[NSNull class]]){
		self.imgView = dictionary[kZHBodyModelImgView];
	}	
	if(![dictionary[kZHBodyModelShopId] isKindOfClass:[NSNull class]]){
		self.shopId = dictionary[kZHBodyModelShopId];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.commodityText != nil){
		dictionary[kZHBodyModelCommodityText] = self.commodityText;
	}
	if(self.imgView != nil){
		dictionary[kZHBodyModelImgView] = self.imgView;
	}
	if(self.shopId != nil){
		dictionary[kZHBodyModelShopId] = self.shopId;
	}
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	if(self.commodityText != nil){
		[aCoder encodeObject:self.commodityText forKey:kZHBodyModelCommodityText];
	}
	if(self.imgView != nil){
		[aCoder encodeObject:self.imgView forKey:kZHBodyModelImgView];
	}
	if(self.shopId != nil){
		[aCoder encodeObject:self.shopId forKey:kZHBodyModelShopId];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.commodityText = [aDecoder decodeObjectForKey:kZHBodyModelCommodityText];
	self.imgView = [aDecoder decodeObjectForKey:kZHBodyModelImgView];
	self.shopId = [aDecoder decodeObjectForKey:kZHBodyModelShopId];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	ZHBodyModel *copy = [ZHBodyModel new];

	copy.commodityText = [self.commodityText copyWithZone:zone];
	copy.imgView = [self.imgView copyWithZone:zone];
	copy.shopId = [self.shopId copyWithZone:zone];

	return copy;
}
@end