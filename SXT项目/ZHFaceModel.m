//
//	ZHFaceModel.m
//
//	Create by c ma on 27/6/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ZHFaceModel.h"

NSString *const kZHFaceModelCommodityText = @"CommodityText";
NSString *const kZHFaceModelImgView = @"ImgView";
NSString *const kZHFaceModelShopId = @"ShopId";

@interface ZHFaceModel ()
@end
@implementation ZHFaceModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kZHFaceModelCommodityText] isKindOfClass:[NSNull class]]){
		self.commodityText = dictionary[kZHFaceModelCommodityText];
	}	
	if(![dictionary[kZHFaceModelImgView] isKindOfClass:[NSNull class]]){
		self.imgView = dictionary[kZHFaceModelImgView];
	}	
	if(![dictionary[kZHFaceModelShopId] isKindOfClass:[NSNull class]]){
		self.shopId = dictionary[kZHFaceModelShopId];
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
		dictionary[kZHFaceModelCommodityText] = self.commodityText;
	}
	if(self.imgView != nil){
		dictionary[kZHFaceModelImgView] = self.imgView;
	}
	if(self.shopId != nil){
		dictionary[kZHFaceModelShopId] = self.shopId;
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
		[aCoder encodeObject:self.commodityText forKey:kZHFaceModelCommodityText];
	}
	if(self.imgView != nil){
		[aCoder encodeObject:self.imgView forKey:kZHFaceModelImgView];
	}
	if(self.shopId != nil){
		[aCoder encodeObject:self.shopId forKey:kZHFaceModelShopId];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.commodityText = [aDecoder decodeObjectForKey:kZHFaceModelCommodityText];
	self.imgView = [aDecoder decodeObjectForKey:kZHFaceModelImgView];
	self.shopId = [aDecoder decodeObjectForKey:kZHFaceModelShopId];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	ZHFaceModel *copy = [ZHFaceModel new];

	copy.commodityText = [self.commodityText copyWithZone:zone];
	copy.imgView = [self.imgView copyWithZone:zone];
	copy.shopId = [self.shopId copyWithZone:zone];

	return copy;
}
@end