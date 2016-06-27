//
//	ZHRightTableViewModel.m
//
//	Create by c ma on 27/6/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ZHRightTableViewModel.h"

NSString *const kZHRightTableViewModelActivityDate = @"ActivityDate";
NSString *const kZHRightTableViewModelActivityId = @"ActivityId";
NSString *const kZHRightTableViewModelCommodityText = @"CommodityText";
NSString *const kZHRightTableViewModelContent = @"Content";
NSString *const kZHRightTableViewModelFormetDate = @"FormetDate";
NSString *const kZHRightTableViewModelIfMiddlePage = @"IfMiddlePage";
NSString *const kZHRightTableViewModelImgView = @"ImgView";
NSString *const kZHRightTableViewModelLogoImg = @"LogoImg";
NSString *const kZHRightTableViewModelShopTitle = @"ShopTitle";

@interface ZHRightTableViewModel ()
@end
@implementation ZHRightTableViewModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kZHRightTableViewModelActivityDate] isKindOfClass:[NSNull class]]){
		self.activityDate = dictionary[kZHRightTableViewModelActivityDate];
	}	
	if(![dictionary[kZHRightTableViewModelActivityId] isKindOfClass:[NSNull class]]){
		self.activityId = dictionary[kZHRightTableViewModelActivityId];
	}	
	if(![dictionary[kZHRightTableViewModelCommodityText] isKindOfClass:[NSNull class]]){
		self.commodityText = dictionary[kZHRightTableViewModelCommodityText];
	}	
	if(![dictionary[kZHRightTableViewModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kZHRightTableViewModelContent];
	}	
	if(![dictionary[kZHRightTableViewModelFormetDate] isKindOfClass:[NSNull class]]){
		self.formetDate = dictionary[kZHRightTableViewModelFormetDate];
	}	
	if(![dictionary[kZHRightTableViewModelIfMiddlePage] isKindOfClass:[NSNull class]]){
		self.ifMiddlePage = dictionary[kZHRightTableViewModelIfMiddlePage];
	}	
	if(![dictionary[kZHRightTableViewModelImgView] isKindOfClass:[NSNull class]]){
		self.imgView = dictionary[kZHRightTableViewModelImgView];
	}	
	if(![dictionary[kZHRightTableViewModelLogoImg] isKindOfClass:[NSNull class]]){
		self.logoImg = dictionary[kZHRightTableViewModelLogoImg];
	}	
	if(![dictionary[kZHRightTableViewModelShopTitle] isKindOfClass:[NSNull class]]){
		self.shopTitle = dictionary[kZHRightTableViewModelShopTitle];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.activityDate != nil){
		dictionary[kZHRightTableViewModelActivityDate] = self.activityDate;
	}
	if(self.activityId != nil){
		dictionary[kZHRightTableViewModelActivityId] = self.activityId;
	}
	if(self.commodityText != nil){
		dictionary[kZHRightTableViewModelCommodityText] = self.commodityText;
	}
	if(self.content != nil){
		dictionary[kZHRightTableViewModelContent] = self.content;
	}
	if(self.formetDate != nil){
		dictionary[kZHRightTableViewModelFormetDate] = self.formetDate;
	}
	if(self.ifMiddlePage != nil){
		dictionary[kZHRightTableViewModelIfMiddlePage] = self.ifMiddlePage;
	}
	if(self.imgView != nil){
		dictionary[kZHRightTableViewModelImgView] = self.imgView;
	}
	if(self.logoImg != nil){
		dictionary[kZHRightTableViewModelLogoImg] = self.logoImg;
	}
	if(self.shopTitle != nil){
		dictionary[kZHRightTableViewModelShopTitle] = self.shopTitle;
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
	if(self.activityDate != nil){
		[aCoder encodeObject:self.activityDate forKey:kZHRightTableViewModelActivityDate];
	}
	if(self.activityId != nil){
		[aCoder encodeObject:self.activityId forKey:kZHRightTableViewModelActivityId];
	}
	if(self.commodityText != nil){
		[aCoder encodeObject:self.commodityText forKey:kZHRightTableViewModelCommodityText];
	}
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kZHRightTableViewModelContent];
	}
	if(self.formetDate != nil){
		[aCoder encodeObject:self.formetDate forKey:kZHRightTableViewModelFormetDate];
	}
	if(self.ifMiddlePage != nil){
		[aCoder encodeObject:self.ifMiddlePage forKey:kZHRightTableViewModelIfMiddlePage];
	}
	if(self.imgView != nil){
		[aCoder encodeObject:self.imgView forKey:kZHRightTableViewModelImgView];
	}
	if(self.logoImg != nil){
		[aCoder encodeObject:self.logoImg forKey:kZHRightTableViewModelLogoImg];
	}
	if(self.shopTitle != nil){
		[aCoder encodeObject:self.shopTitle forKey:kZHRightTableViewModelShopTitle];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.activityDate = [aDecoder decodeObjectForKey:kZHRightTableViewModelActivityDate];
	self.activityId = [aDecoder decodeObjectForKey:kZHRightTableViewModelActivityId];
	self.commodityText = [aDecoder decodeObjectForKey:kZHRightTableViewModelCommodityText];
	self.content = [aDecoder decodeObjectForKey:kZHRightTableViewModelContent];
	self.formetDate = [aDecoder decodeObjectForKey:kZHRightTableViewModelFormetDate];
	self.ifMiddlePage = [aDecoder decodeObjectForKey:kZHRightTableViewModelIfMiddlePage];
	self.imgView = [aDecoder decodeObjectForKey:kZHRightTableViewModelImgView];
	self.logoImg = [aDecoder decodeObjectForKey:kZHRightTableViewModelLogoImg];
	self.shopTitle = [aDecoder decodeObjectForKey:kZHRightTableViewModelShopTitle];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	ZHRightTableViewModel *copy = [ZHRightTableViewModel new];

	copy.activityDate = [self.activityDate copyWithZone:zone];
	copy.activityId = [self.activityId copyWithZone:zone];
	copy.commodityText = [self.commodityText copyWithZone:zone];
	copy.content = [self.content copyWithZone:zone];
	copy.formetDate = [self.formetDate copyWithZone:zone];
	copy.ifMiddlePage = [self.ifMiddlePage copyWithZone:zone];
	copy.imgView = [self.imgView copyWithZone:zone];
	copy.logoImg = [self.logoImg copyWithZone:zone];
	copy.shopTitle = [self.shopTitle copyWithZone:zone];

	return copy;
}
@end