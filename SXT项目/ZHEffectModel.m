//
//	ZHEffectModel.m
//
//	Create by c ma on 27/6/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ZHEffectModel.h"

NSString *const kZHEffectModelGoodsType = @"GoodsType";
NSString *const kZHEffectModelGoodsTypeName = @"GoodsTypeName";
NSString *const kZHEffectModelImgView = @"ImgView";

@interface ZHEffectModel ()
@end
@implementation ZHEffectModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kZHEffectModelGoodsType] isKindOfClass:[NSNull class]]){
		self.goodsType = dictionary[kZHEffectModelGoodsType];
	}	
	if(![dictionary[kZHEffectModelGoodsTypeName] isKindOfClass:[NSNull class]]){
		self.goodsTypeName = dictionary[kZHEffectModelGoodsTypeName];
	}	
	if(![dictionary[kZHEffectModelImgView] isKindOfClass:[NSNull class]]){
		self.imgView = dictionary[kZHEffectModelImgView];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.goodsType != nil){
		dictionary[kZHEffectModelGoodsType] = self.goodsType;
	}
	if(self.goodsTypeName != nil){
		dictionary[kZHEffectModelGoodsTypeName] = self.goodsTypeName;
	}
	if(self.imgView != nil){
		dictionary[kZHEffectModelImgView] = self.imgView;
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
	if(self.goodsType != nil){
		[aCoder encodeObject:self.goodsType forKey:kZHEffectModelGoodsType];
	}
	if(self.goodsTypeName != nil){
		[aCoder encodeObject:self.goodsTypeName forKey:kZHEffectModelGoodsTypeName];
	}
	if(self.imgView != nil){
		[aCoder encodeObject:self.imgView forKey:kZHEffectModelImgView];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.goodsType = [aDecoder decodeObjectForKey:kZHEffectModelGoodsType];
	self.goodsTypeName = [aDecoder decodeObjectForKey:kZHEffectModelGoodsTypeName];
	self.imgView = [aDecoder decodeObjectForKey:kZHEffectModelImgView];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	ZHEffectModel *copy = [ZHEffectModel new];

	copy.goodsType = [self.goodsType copyWithZone:zone];
	copy.goodsTypeName = [self.goodsTypeName copyWithZone:zone];
	copy.imgView = [self.imgView copyWithZone:zone];

	return copy;
}
@end